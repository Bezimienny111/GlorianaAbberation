# FTG Syntax Highlight

Lokalne rozszerzenie VS Code dodające podświetlanie składni plików For The Glory.

## Co obejmuje
- Język `ftg`
- Gramatyka TextMate dla eventów/scenariuszy (komendy, triggery, liczby, tagi, komentarze)
- Konfiguracja języka (`#` komentarze, pary nawiasów)

## Szybkie uruchomienie (MVP lokalnie)
1. Otwórz folder `Work Folder/ftg-syntax-highlight` jako projekt VS Code.
2. Naciśnij `F5` (Run Extension).
3. W nowym oknie Extension Development Host otwórz plik `*.eue`, `*.inc`, `*.eug` lub plik z mapowania z workspace.

## Użycie w tym modzie
W głównym workspace ustawione są skojarzenia w `.vscode/settings.json`:
- `AI/*.txt`
- `Db/events*.txt`
- `Db/Events/**/*.txt`
- `Scenarios/**/*.eug`
- `Scenarios/**/*.inc`
- `*.eue`

Po aktywacji rozszerzenia te pliki będą miały język `ftg`.

## Pełna instalacja (na stałe)
Opcja A (najprostsza):
- Uruchamiaj rozszerzenie przez `F5`, gdy pracujesz nad modem.

Opcja B (VSIX):
1. Zainstaluj `vsce` (`npm i -g @vscode/vsce`).
2. W folderze `Work Folder/ftg-syntax-highlight` wykonaj `vsce package`.
3. Zainstaluj wygenerowany plik `.vsix` w VS Code (`Extensions: Install from VSIX...`).
