#!/usr/bin/env python3
import argparse
import os
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, List, Optional, Tuple

ID_DEF_RE = re.compile(r"^\s*id\s*=\s*(\d+)\b", re.IGNORECASE)
ID_EVENT_RE = re.compile(r"\bevent\s*=\s*(\d+)\b", re.IGNORECASE)
ID_DECISION_RE = re.compile(r"\bdecision\s*=\s*(\d+)\b", re.IGNORECASE)
ID_WHICH_EVENT_CMD_RE = re.compile(
    r"\btype\s*=\s*(trigger|sleepevent)\b[^\n\r}]*\bwhich\s*=\s*(\d+)\b",
    re.IGNORECASE,
)

FLAG_SET_RE = re.compile(r"\b(setflag|clrflag)\b[^\n\r}]*\bwhich\s*=\s*([A-Za-z0-9_]+)\b", re.IGNORECASE)
FLAG_CHECK_RE = re.compile(r"\bflag\s*=\s*([A-Za-z0-9_]+)\b", re.IGNORECASE)
FLAG_BRACKET_RE = re.compile(r"\[([A-Za-z0-9_]+)\]")

PREFERRED_DIRS = {"AI", "Db", "Scenarios", "Localisation"}
INCLUDE_EXTS = {".txt", ".inc", ".eug", ".eue"}
EXCLUDE_DIRS = {".git", ".vscode", "Logs", "Screenshots", "Map", "Gfx", "Music"}


@dataclass
class Hit:
    path: Path
    line_no: int
    kind: str
    line: str


def is_comment(line: str) -> bool:
    return line.lstrip().startswith("#")


def iter_files(root: Path) -> Iterable[Path]:
    for child in root.iterdir():
        if child.is_dir() and child.name in PREFERRED_DIRS:
            for dirpath, dirnames, filenames in os.walk(child):
                dirnames[:] = [d for d in dirnames if d not in EXCLUDE_DIRS]
                for file_name in filenames:
                    path = Path(dirpath) / file_name
                    if path.suffix.lower() in INCLUDE_EXTS:
                        yield path


def detect_symbol_from_line(line: str) -> Optional[Tuple[str, str]]:
    m = ID_DEF_RE.search(line)
    if m:
        return ("id", m.group(1))

    m = ID_EVENT_RE.search(line)
    if m:
        return ("id", m.group(1))

    m = ID_DECISION_RE.search(line)
    if m:
        return ("id", m.group(1))

    m = ID_WHICH_EVENT_CMD_RE.search(line)
    if m:
        return ("id", m.group(2))

    m = FLAG_SET_RE.search(line)
    if m:
        return ("flag", m.group(2))

    m = FLAG_CHECK_RE.search(line)
    if m:
        return ("flag", m.group(1))

    m = FLAG_BRACKET_RE.search(line)
    if m:
        return ("flag", m.group(1))

    return None


def detect_symbol_from_location(location: str) -> Tuple[str, str]:
    if ":" not in location:
        raise ValueError("Format --at musi być: <plik>:<linia>")

    file_part, line_part = location.rsplit(":", 1)
    file_path = Path(file_part)
    if not file_path.exists():
        raise ValueError(f"Nie znaleziono pliku: {file_path}")

    try:
        line_no = int(line_part)
    except ValueError as exc:
        raise ValueError("Numer linii w --at musi być liczbą całkowitą") from exc

    with file_path.open("r", encoding="utf-8", errors="ignore") as handle:
        lines = handle.readlines()

    if line_no < 1 or line_no > len(lines):
        raise ValueError(f"Linia poza zakresem: {line_no} (1..{len(lines)})")

    detected = detect_symbol_from_line(lines[line_no - 1])
    if not detected:
        raise ValueError("Na wskazanej linii nie wykryto ID ani flagi")

    return detected


def find_id_refs(root: Path, symbol: str) -> List[Hit]:
    hits: List[Hit] = []

    for path in iter_files(root):
        try:
            with path.open("r", encoding="utf-8", errors="ignore") as handle:
                for idx, line in enumerate(handle, start=1):
                    if is_comment(line):
                        continue

                    kind = None

                    m = ID_DEF_RE.search(line)
                    if m and m.group(1) == symbol:
                        kind = "id-def"

                    m = ID_EVENT_RE.search(line)
                    if m and m.group(1) == symbol:
                        kind = "event-ref"

                    m = ID_DECISION_RE.search(line)
                    if m and m.group(1) == symbol:
                        kind = "decision-ref"

                    m = ID_WHICH_EVENT_CMD_RE.search(line)
                    if m and m.group(2) == symbol:
                        kind = f"command-{m.group(1).lower()}"

                    if kind:
                        hits.append(Hit(path=path, line_no=idx, kind=kind, line=line.rstrip("\n\r")))
        except OSError:
            continue

    return sorted(hits, key=lambda h: (str(h.path).lower(), h.line_no))


def find_flag_refs(root: Path, symbol: str) -> List[Hit]:
    hits: List[Hit] = []
    symbol_lower = symbol.lower()

    for path in iter_files(root):
        try:
            with path.open("r", encoding="utf-8", errors="ignore") as handle:
                for idx, line in enumerate(handle, start=1):
                    if is_comment(line):
                        continue

                    raw = line.rstrip("\n\r")
                    lowered = raw.lower()
                    kind = None

                    for m in FLAG_SET_RE.finditer(raw):
                        if m.group(2).lower() == symbol_lower:
                            kind = f"flag-{m.group(1).lower()}"
                            break

                    if kind is None:
                        m = FLAG_CHECK_RE.search(raw)
                        if m and m.group(1).lower() == symbol_lower:
                            kind = "flag-check"

                    if kind is None:
                        for m in FLAG_BRACKET_RE.finditer(raw):
                            if m.group(1).lower() == symbol_lower:
                                kind = "flag-bracket"
                                break

                    if kind:
                        hits.append(Hit(path=path, line_no=idx, kind=kind, line=raw))
        except OSError:
            continue

    return sorted(hits, key=lambda h: (str(h.path).lower(), h.line_no))


def print_hits(root: Path, symbol_type: str, symbol: str, hits: List[Hit]) -> None:
    print(f"Szukam {symbol_type}: {symbol}")
    print(f"Root: {root}")
    print(f"Wyników: {len(hits)}")
    print("-" * 80)

    for hit in hits:
        rel = hit.path.relative_to(root).as_posix()
        print(f"{rel}:{hit.line_no}: [{hit.kind}] {hit.line.strip()}")


def main() -> int:
    parser = argparse.ArgumentParser(description="FTG references: ID i flagi")
    parser.add_argument("--root", default=".", help="Root moda/workspace")
    parser.add_argument("--symbol", help="ID lub flaga")
    parser.add_argument("--kind", choices=["auto", "id", "flag"], default="auto")
    parser.add_argument("--at", help="Wykryj symbol z linii: <plik>:<linia>")

    args = parser.parse_args()

    if not args.symbol and not args.at:
        print("Podaj --symbol albo --at", file=sys.stderr)
        return 2

    root = Path(args.root).resolve()
    if not root.exists():
        print(f"Root nie istnieje: {root}", file=sys.stderr)
        return 2

    try:
        if args.at:
            symbol_type, symbol = detect_symbol_from_location(args.at)
        else:
            symbol = args.symbol.strip()
            if args.kind == "id":
                symbol_type = "id"
            elif args.kind == "flag":
                symbol_type = "flag"
            else:
                symbol_type = "id" if symbol.isdigit() else "flag"
    except ValueError as exc:
        print(str(exc), file=sys.stderr)
        return 2

    if symbol_type == "id":
        hits = find_id_refs(root, symbol)
    else:
        hits = find_flag_refs(root, symbol)

    print_hits(root, symbol_type, symbol, hits)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
