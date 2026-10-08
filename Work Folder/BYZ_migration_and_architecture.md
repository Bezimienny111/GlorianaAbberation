# Architektura Odporna na Aktualizacje i Plan Migracji Bizancjum (BYZ)

Data: 2026-10-08.
Status: architektura zaimplementowana i zweryfikowana.
Repozutorium zdalne: `https://github.com/Bezimienny111/GlorianaAbberation.git`
Branch roboczy: `alternate-destinies`.

---

## 1. Zasada Dzialania: Czysta Nakladka (Overlay Architecture)

Aby zabezpieczyc caly nasz dorobek przed nadpisaniem przez nowa wersje moda udostepniona przez autora w archiwum zip, zastosowalismy architekture calkowicie wyizolowanych plikow z przedrostkiem `alt_`:

```
Gloriana_1337/
├── Scenarios/
│   ├── 1337 - The Storm Breaks.eeg       [Oryginal autora - nietkniety]
│   └── 1337 - Alternate Destinies.eeg    [Nasz scenariusz - autor go nie ma w zipie]
│
├── Db/
│   ├── events.txt                        [Oryginalny loader autora - nietkniety]
│   ├── events_alt_master.txt             [Nasz loader - autor go nie ma w zipie]
│   │
│   ├── Decisions/
│   │   ├── alt_byzantine.txt             [Wszystkie decyzje BYZ 6000-6040 + 6041-6062]
│   │   ├── alt_papal.txt                 [Decyzje 7000-7099 PAP/ITA/WRE]
│   │   ├── alt_egypt.txt                 [Decyzje 7100-7149 MAM/EGY]
│   │   ├── alt_hansa.txt                 [Decyzje 7150-7199 HSA]
│   │   ├── alt_americas.txt              [Decyzje 7200-7299 AZT/INC]
│   │   ├── alt_celtic.txt                [Decyzje 7300-7349 SCO/WLS/EIR]
│   │   ├── alt_ethiopia.txt              [Decyzje 7350-7399 ETH]
│   │   └── alt_korea.txt                 [Decyzje 7400-7449 KOR]
│   │
│   └── Events/
│       ├── alt_byzantine.txt             [Eventy usypiajace i eventy wsparcia BYZ]
│       ├── alt_papal.txt                 [Eventy 296150+ PAP/ITA/WRE]
│       ├── alt_egypt.txt                 [Eventy 112001+ MAM/EGY]
│       ├── alt_hansa.txt                 [Eventy 110050+ HSA]
│       ├── alt_americas.txt              [Eventy 113000+ AZT/INC]
│       ├── alt_celtic.txt                [Eventy 120686+ Celci]
│       ├── alt_ethiopia.txt              [Eventy 5303+ ETH]
│       └── alt_korea.txt                 [Eventy 3892+ KOR]
│
└── Work Folder/
    └── Alt_Patches/                      [Kopie zapasowe i 1-klikowy skrypt przywracania]
        ├── countries_patch.txt           [Wpis nowego tagu WRE]
        ├── religions_patch.txt           [Wpisy 5 nowych religii]
        ├── cultures_patch.txt            [Wpis kultury roman]
        └── Apply-AltPatches.ps1          [Skrypt odtwarzajacy wpisy w Db/ po update]
```

### Dlaczego ta struktura jest w 100% bezpieczna?
1. **Brak kolizji nazw**: Żaden z naszych plików `alt_*.txt`, plik `events_alt_master.txt` ani scenariusz `1337 - Alternate Destinies.eeg` nie istnieje w paczce autora. Rozpakowanie nowej wersji moda z opcja "Nadpisz pliki" **nie usunie ani nie zmieni zadnego z nich**.
2. **Czystosc oryginalu**: Oryginalny scenariusz `1337 - The Storm Breaks.eeg` oraz oryginalny `Db/events.txt` pozostaja czyste – w menu gry mozna w kazdej chwili uruchomic wersje autora lub wersje Alternate.

---

## 2. Plan Migracji i Odpiecia Zmian Bizancjum (BYZ)

### 2.1. Dotychczasowy problem
Podczas wczesniejszej konwersji eventow restauracji cesarstwa na decyzje 6020–6040 dokonano bezposredniej edycji w plikach autora:
- W `Db/Events/BYZANNEX_08_Imperial_Restoration.txt` dodano do 10 eventow (3001154, 3001155–3001162, 3001167) warunek `NOT = { tag = BYZ }`.
- Jesli autor wyda wersje np. 1.06 moda, plik `BYZANNEX_08.txt` zostanie nadpisany, a zablokowane eventy wroca do gry, dublujac sie z decyzjami!

### 2.2. Zastosowane rozwiazanie (Czyste odpiecie via Sleeper Event)
Zamiast modyfikowac pliki autora, w naszym nowym pliku `Db/Events/alt_byzantine.txt` wprowadzamy **startowy event inicjalizacyjny**:
- Odpala sie dla BYZ w 1337 roku (lub na poczatku gry),
- Wykonuje natywne komendy silnika FTG:
  ```
  command = { type = sleepevent which = 3001154 }
  command = { type = sleepevent which = 3001155 }
  command = { type = sleepevent which = 3001156 }
  command = { type = sleepevent which = 3001157 }
  command = { type = sleepevent which = 3001158 }
  command = { type = sleepevent which = 3001159 }
  command = { type = sleepevent which = 3001160 }
  command = { type = sleepevent which = 3001161 }
  command = { type = sleepevent which = 3001162 }
  command = { type = sleepevent which = 3001167 }
  ```
- **Zysk**: Nawet gdy autor nadpisze plik `BYZANNEX_08.txt` w nowej wersji moda, nasz sleeper event w ulamku sekundy uspi te stare eventy w pamieci gry, a gracz bedzie mial pelny, bezbledny dostep do decyzji w `Db/Decisions/alt_byzantine.txt`!

### 2.3. Stan decyzji Bizancjum w `alt_byzantine.txt`
Plik `Db/Decisions/alt_byzantine.txt` zawiera juz kompletna, zabezpieczona baze:
- Decyzje **6000–6015**: kampanie regionalne (Azja Mniejsza, Balkany, Lewant, Egipt),
- Decyzje **6020–6040**: glowna sciezka Imperial Restoration (Konstantynopol, Pakt Krzyzowy, drogi ekspansji, Basil II, final 6040),
- Zalozenia projektowe **6041–6062**: 10 kolejnych kampanii reconquisty (Hispania, Galia, Brytania, Germania, Dacja, Mezopotamia, relokacje stolic wrogow).

---

## 3. Procedura Postepowania przy Aktualizacji Moda przez Autora

Gdy w przyszlosci autor moda udostepni nowa wersje (np. `Gloriana_1337_v1.06.zip`):

1. **Krok 1: Rozpakowanie aktualizacji**
   - Rozpakuj archiwum autora do folderu `Mods\Gloriana_1337\`, zezwalajac na nadpisanie plikow.
2. **Krok 2: Uruchomienie patchera bazy danych (1 klikniecie)**
   - Kliknij prawym przyciskiem myszy na plik:  
     `Work Folder\Alt_Patches\Apply-AltPatches.ps1` $\rightarrow$ **Uruchom za pomoca programu PowerShell**.
   - Skrypt sprawdzi `Db\countries.txt`, `Db\Religions\religions.txt` oraz `Db\cultures.txt`. Jesli autor je nadpisal, skrypt w 0.1 s dopisze brakujacy tag `WRE`, kulture `roman` i religie alternatywne.
3. **Krok 3: Git (opcjonalnie, jesli korzystasz z repozytorium)**
   - Wpisz: `git commit -am "Aktualizacja moda od autora"` i zsynchronizuj z GitHubem (`git push`).
4. **Gotowe!**
   - Twoj scenariusz `1337 - Alternate Destinies` dziala natychmiast, korzystajac ze wszystkich nowych poprawek autora, zachowujac jednoczesnie 100% naszych drzewek alternatywnych.
