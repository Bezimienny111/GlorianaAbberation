# PAP: analiza warunkowania czasowego decyzji i integracji prowincji

Data: 2026-10-08.
Status: analiza techniczna silnika For The Glory (FTG 1.3), zatwierdzona przez uzytkownika do implementacji.
Zakres: mozliwosci warunkowania decyzji i eventow od uplywu czasu (X lat od poprzedniej decyzji/eventu) oraz mechanika 10-letniej integracji prowincji.

## 1. Architektura silnika FTG: pamiec i zapis stanu gry

Analiza plikow zapisu (`.eeg`), zrodel modyfikacji i definicji triggerow wykazuje:
- **Decyzje** sa zapisywane w sekcji `decisionhistory = { TAG = { id1 id2 ... } }` wylacznie jako lista identyfikatorow podjetych decyzji.
- **Flagi** sa zapisywane w sekcji `flags = { flaga1 = yes/no ... }` jako proste zmienne logiczne (booleany).
- **Eventy** sa zapisywane w historii wylacznie jako lista numerow ID zdarzen, ktore juz wystapily.

### Wniosek techniczny:
Silnik gry **nie przechowuje stempla czasowego (daty ani roku)** wykonania decyzji czy ustawienia flagi. W konsekwencji w FTG **nie istnieja bezposrednie triggery** typu `years_since_decision`, `decision_age` ani `years_since_event`. Trigger `decision = <id>` sprawdza jedynie fakt wykonania (tak/nie).

---

## 2. Kluczowe odkrycie: natywne triggery czasowe prowincji

W przeciwienstwie do decyzji ogolnokrajowych, silnik FTG w wewnetrznej strukturze kazdej prowincji rejestruje dokladny dzien zmiany wlasciciela oraz kontrolera. 

W plikach silnika (m.in. `triggers.csv`) oraz w skryptach zaawansowanych modow potwierdzono istnienie w pelni natywnych triggerow czasowych:

```txt
ownerchange = { province = <ID> years = <liczba_lat> }
controlchange = { province = <ID> years = <liczba_lat> }
```

### Zastosowanie dla 10-letniej integracji prowincji:
Wymog uzytkownika: *„po zajeciu prowincji na kazda prowincje powinien byc osobny event, ktory daje core po posiadaniu prowincji przez minimum 10 lat”*.
Dzieki powyzszemu odkryciu nie trzeba stosowac sztucznych obejsc. Event integracji prowincji opiera sie na 100% natywnym kodzie C++ silnika:

```txt
trigger = {
    owned = { province = 389 data = -1 }
    control = { province = 389 data = -1 }
    ownerchange = { province = 389 years = 10 }
    controlchange = { province = 389 years = 10 }
    NOT = { core_national = { province = 389 data = -1 } }
}
```
Trigger ten jest spelniony dokladnie wtedy, gdy prowincja znajduje sie nieprzerwanie we wladaniu i pelnej kontroli panstwa przez minimum 10 lat.

---

## 3. Metody symulacji uplywu czasu miedzy decyzjami

W przypadku relacji miedzy decyzjami ogolnymi (np. „Decyzja B dostepna dopiero X lat po decyzji A”), zidentyfikowano i przeanalizowano 3 glowne metody:

### Metoda A: Lancuch z opoznionym eventem flagujacym (Staged Flags via Event)
Najbardziej uniwersalna metoda fabularna:
1. **Decyzja A**: ustawia flage poczatkowa:
   `command = { type = setflag which = dec_A_enacted }`
2. **Event posredni**: sprawdza flage `dec_A_enacted`, ma szeroki zakres dat i parametr `offset`:
   - `offset = 1800` (dla ok. 5 lat) lub `offset = 3600` (dla ok. 10 lat).
   - W momencie odpalenia ustawia flage gotowosci:
     `command = { type = setflag which = dec_B_ready }`
3. **Decyzja B**: w swoim bloku `trigger` wymaga spelnienia:
   `trigger = { flag = dec_B_ready }`

*Charakterystyka*: Decyzja B pojawia sie w oknie decyzji, lecz jest zablokowana do czasu, az event w tle potwierdzi dojrzenie reformy.

### Metoda B: Oparcie o stolice prowincjonalna (`ownerchange`)
Gdy decyzja polityczna jest nastepstwem opanowania danego terytorium:
- Decyzja B w sekcji `trigger` wymaga podjecia decyzji A oraz uplywu lat na wiodacej prowincji regionu:
  `decision = 7001`
  `ownerchange = { province = 389 years = 10 }`
*Charakterystyka*: Zapewnia dokladny, co do dnia zegar oparty na silniku prowincji.

### Metoda C: Warunki inwestycyjne i infrastrukturalne (Naturalny timer rozgrywki)
Zamiast biernego oczekiwania na uplyw lat, decyzja B wymaga spelnienia warunkow, ktore w naturalny sposob zajmuja graczowi kilka do kilkunastu lat rozgrywki:
- Wybudowanie sadu (`courthouse`) i poborcy (`bailiff`) w 3-4 miastach (czas budowy w silniku to 12-24 miesiecy na budynek oraz koszt dukatow).
- Osiagniecie wymaganego poziomu technologii (np. `infra = 3` lub `trade = 3`).
- Spadek nacjonalizmu prowincjonalnego.

---

## 4. Rekomendacja i decyzja projektowa

Zgodnie z decyzja uzytkownika przyjmuje sie nastepujace standardy implementacji w projekcie PAP:
1. **Integracja prowincji (core po 10 latach)**: bezwzgledne uzycie natywnych triggerow `ownerchange = { province = X years = 10 }` oraz `controlchange = { province = X years = 10 }`.
2. **Decyzje terytorialne**: oparcie wymogow czasowych o `ownerchange` na kluczowej stolicy prowincjonalnej.
3. **Decyzje ustrojowe i reformy kurialne**: uzycie Metody A (staged flag z eventem pomocniczym operujacym na `offset`).
