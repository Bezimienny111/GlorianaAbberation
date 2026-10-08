# Gloriana 1337 - Alternate Destinies

Projekt rozszerzenia i modułów historii alternatywnej dla modyfikacji **Gloriana 1337** na silniku **For The Glory (FTG 1.3)**.

---

## O projekcie

Projekt wprowadza modułową architekturę historii alternatywnej („Czysta Nakładka”), która działa równolegle do podstawowego moda i jest całkowicie odporna na nadpisywanie plików przy aktualizacjach wydawanych przez autora moda.

W grze dostępny jest dedykowany scenariusz:

- **1337 - Alternate Destinies** (ładujący wszystkie moduły alternatywne).
- Obok niego pozostaje nienaruszony oryginalny scenariusz autora: **1337 - The Storm Breaks**.

---

## Zaplanowane i wdrażane moduły

1. **Bizancjum (BYZ)**: Rozbudowane drzewo decyzji reconquisty cesarskiej (6000–6062) w `Db/Decisions/alt_byzantine.txt`.
2. **Papiestwo, Italia i Cesarstwo Zachodnie (PAP / ITA / WRE)**: Trzy ścieżki ustrojowe (Teokracja, Królestwo Włoch, Odrodzenie Cesarstwa Zachodniego, Konsulowie SPQR).
3. **Mamelukowie i Nowy Egipt (MAM / EGY)**: Likwidacja kasty mameluckiej, ścieżka Ptolemeuszy w Aleksandrii, odrodzenie religii staroegipskiej (_Kemet_) lub racjonalizmu (_Mu'tazilizm_).
4. **Związek Hanzeatycki (HSA)**: Zjednoczenie miast hanzeatyckich w jedno mocarstwo morskie (_Großer Hansetag_), Cło Sundzkie, zamorskie kontory i szlak ku Winlandii.
5. **Ameryki Prekolumbijskie (AZT / INC)**: Filozoficzna reforma Nezahualcoyotla, rozbicie konkwistadorów w Cajamarce i Tenochtitlan, adaptacja żelaza, kawalerii i prochu, talasokracja Pacyfiku i Karaibów.
6. **Unia Celtycka (SCO / WLS / EIR)**: Powstanie Owaina Glyndŵra, likwidacja Pale w Dublinie, sojusz narodów celtyckich przeciw Plantagenetom.
7. **Cesarstwo Etiopii (ETH)**: Talasokracja Morza Czerwonego, przymierze z Europą (mit Księdza Jana) i Południowa Krucjata ku Jerozolimie.
8. **Królestwo Korei (KOR)**: Oświecenie naukowe króla Sejonga (Hangul), pancerne Okręty Żółwie (_Geobukseon_) 150 lat wcześniej i rekonkwista Mandżurii.

Szczegółowa dokumentacja każdego modułu znajduje się w katalogu `Work Folder/`.

---

## Gałęzie w repozytorium (Git Branches)

- **`main`**: Czysta baza moda Gloriana 1337 z oficjalnymi plikami autora.
- **`alternate-destinies`**: Główna gałąź robocza zawierająca moduły alternatywnej historii.

---

## Procedura aktualizacji moda w przyszłości (Skrót)

Gdy autor moda wyda nową wersję (np. `Gloriana_1337_v1.06.zip`):

1. Upewnij się, że nie masz niezapisanych zmian (`git status`).
2. Przełącz na bazę: `git checkout main`.
3. Rozpakuj zipa autora z nadpisaniem plików.
4. Zapisz nową wersję autora: `git add .` -> `git commit -m "Upstream vX.X"` -> `git push origin main`.
5. Wróć do alternatywnej historii: `git checkout alternate-destinies`.
6. Scal zmiany: `git merge main`.
7. Uruchom skrypt przywracający wpisy bazy danych: `Work Folder\Alt_Patches\Apply-AltPatches.ps1`.
8. Zapisz scalenie: `git commit -am "Merge upstream"` -> `git push origin alternate-destinies`.

Pełny poradnik ze szczegółowymi instrukcjami znajduje się w pliku:  
[Work Folder/UPDATING_AND_GIT_WORKFLOW.md](Work%20Folder/UPDATING_AND_GIT_WORKFLOW.md).
