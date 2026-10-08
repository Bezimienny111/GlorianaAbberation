# Procedura Postepowania przy Aktualizacji Moda (Instrukcja Krok po Kroku)

Data utworzenia: 2026-10-08.
Repozytorium: `https://github.com/Bezimienny111/GlorianaAbberation.git`
Galaz bazowa moda: `main` (czysty kod autora)
Galaz alternatywnej historii: `alternate-destinies` (nasze zmiany i moduly)

---

## Czy nalezy teraz cokolwiek aktualizowac lub przywracac?

**NIE, na ten moment nie musisz niczego przywracac ani aktualizowac.**
- Twoj obecny stan gry jest w 100% zsynchronizowany, zabezpieczony i zapisany w repozytorium GitHub na galezi `main` i `alternate-destinies`.
- Masz gotowa i dzialajaca architekture nakladki (`Scenarios/1337 - Alternate Destinies.eeg` oraz `Db/events_alt_master.txt`).
- Mozesz od razu grac lub kontynuowac dodawanie decyzji i eventow.

---

## Co zrobic w przyszlosci, gdy autor wyda nowa wersje moda (np. v1.06)?

Gdy autor moda udostepni nowe archiwum (np. `Gloriana_1337_v1.06.zip`), postepuj scisle wedlug ponizszej procedury 7 krokow.

```
                  [NOWA PACZKA ZIP OD AUTORA]
                               │
               (Krok 1: Sprawdzenie czystosci gita)
                               │
                 (Krok 2: git checkout main)
                               │
            (Krok 3: Wypakowanie zipa z nadpisaniem)
                               │
           (Krok 4: git commit -am "Aktualizacja...")
                               │
          (Krok 5: git checkout alternate-destinies)
                               │
                 (Krok 6: git merge main)
                               │
         (Krok 7: Uruchomienie Apply-AltPatches.ps1)
                               │
                            [GOTOWE!]
```

---

### KROK 1: Upewnij sie, ze nie masz niezapisanych zmian
Otworz PowerShell w katalogu moda (`d:\Steam\steamapps\common\For The Glory\Mods\Gloriana_1337`) i wpisz:
```powershell
git status
```
*Jesli widzisz komunikat `nothing to commit, working tree clean` – przejdz do Kroku 2.*  
*Jesli masz niezapisane zmiany robocze, najpierw je zapisz:*
```powershell
git add .
git commit -m "Zapis biezacych prac przed aktualizacja"
```

---

### KROK 2: Przelacz sie na galaz czystego moda autora (`main`)
```powershell
git checkout main
```

---

### KROK 3: Rozpakuj nowa paczke moda od autora
1. Rozpakuj pobrane archiwum `.zip` do folderu:  
   `d:\Steam\steamapps\common\For The Glory\Mods\Gloriana_1337`
2. Wybierz opcje: **„Zastap pliki w miejscu docelowym”** (Nadpisz).

---

### KROK 4: Zapisz nowa wersje autora w historii Gita
```powershell
git add .
git commit -m "Upstream: Aktualizacja Gloriana 1337 do nowej wersji od autora"
git push origin main
```
*W tym momencie na galezi `main` masz czysty, oryginalny stan nowej wersji moda od autora zarchiwizowany na GitHubie.*

---

### KROK 5: Przelacz sie z powrotem na swoja galaz alternatywnej historii
```powershell
git checkout alternate-destinies
```

---

### KROK 6: Scal zmiany autora ze swoimi modulami (Merge)
```powershell
git merge main
```
*Dzieki architekturze nakladki (pliki `alt_*.txt` i `1337 - Alternate Destinies.eeg` nie wystepuja w paczce autora) Git automatycznie scali wszystkie poprawki autora bez zadnych konfliktow!*

---

### KROK 7: Przywroc wpisy bazodanowe silnika (1 klikniecie)
Poniewaz autor w nowej paczce mogl nadpisac pliki `countries.txt`, `religions.txt` i `cultures.txt`, uruchamiamy nasz gotowy skrypt odtwarzajacy brakujace wpisy (tag WRE, religie i kultury):

Wpisz w PowerShellu:
```powershell
powershell -ExecutionPolicy Bypass -File "Work Folder\Alt_Patches\Apply-AltPatches.ps1"
```
*(lub kliknij prawym przyciskiem myszy na plik `Work Folder\Alt_Patches\Apply-AltPatches.ps1` w Eksploratorze Windows i wybierz „Uruchom za pomoca programu PowerShell”).*

Na koniec zatwierdz i wyslij polaczone repozytorium na GitHuba:
```powershell
git add .
git commit -m "Merge nowej wersji autora z modulami Alternate Destinies"
git push origin alternate-destinies
```

---

## Podsumowanie: dlaczego to jest niezawodne?
1. **Nigdy nie stracisz kodu**: Twoje decyzje i eventy sa w plikach `alt_*.txt`, ktorych autor nie ma w zipie.
2. **Pelna kontrola wersji**: Galaz `main` zawsze przechowuje dokladnie to, co wydal autor. Galaz `alternate-destinies` to Twoja wzbogacona gra.
3. **Automatyzacja**: Skrypt `Apply-AltPatches.ps1` dba o to, by silnik FTG nie zglosil bledu o braku tagu WRE czy religii `roman_pagan`.
