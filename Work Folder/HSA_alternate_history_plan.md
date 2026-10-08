# HSA: Zjednoczenie i Mocarstwowosc Zwiazku Hanzeatyckiego (1337–1838)

Data: 2026-10-08.
Status: szczegolowy projekt alternatywnej historii dla Zwiazku Hanzeatyckiego.
Tag: `HSA` (Hanseatic League / Hanza).
Horyzont czasowy: 1337–1838.

---

## 1. Kontekst historyczny i punkt wyjscia (1337–1370)

W 1337 roku Hanza jest poteznym, lecz nieformalnym zwiazkiem ponad setki miast kupieckich i gildii morskich rozrzuconych od Kolonii po Nowogrod:
- **Zjazd w Lubece (1356)**: historyczny pierwszy ogolny zjazd (*Hansetag*), ktory sformalizowal wspolna reprezentacje Ligi.
- **Wojna z Dania i Pokoj w Stralsundzie (1370)**: apogeum wplywow Hanzy – rozbicie krola Danii Waldemara Atterdaga, wymuszenie kontroli nad zamkami Skanii i dominacja nad ciesnina Sund.
- **Problem schylkowy**: w historii Hanza upadla przez brak jednolitej armii i wladzy centralnej, rozbita przez ksiazat Rzeszy, konkurencje holenderska i kompanie angielskie.
- **Punkt zwrotny**: Gracz stajacy na czele Lubeki, Hamburga, Bremy lub Gdanska moze **przelać autorytet Ligi w jedno suwerenne panstwo-mocarstwo morskie (HSA)**, z wlasna floto-armia, monopolem ciesnin i zamorskim imperium kontorow.

---

## 2. Zjednoczenie i Decyzja: Großer Hansetag

### Decyzja H01: Proklamacja Panstwa Hanzeatyckiego
*Plik: `Db/Decisions/hansa.txt` (ID 7150)*.

- **Potencjalni autorzy**:
  - `LUB` (Lubeka / Wolne Miasto), `HAM` (Hamburg), `BRE` (Brema), `STT` (Szczecin / Pomorze), `DAN` (Gdansk) lub `KOL` (Kolonia).
- **Wymogi**:
  - Rok >= 1356 (po pierwszym historycznym Hansetagu),
  - Pokoj, stabilnosc >= 2,
  - Kontrola nad co najmniej 3 kluczowymi miastami hanzeatyckimi (Lubeka/Mecklemburg 305, Brema 336, Danzig 301, Koeln 344, Vorpommern 304),
  - Skarbiec >= 250 dukatow, poziom infrastruktury >= 2.
- **Skutki w silniku FTG**:
  - Zmiana tagu na **`HSA`** (`country which = HSA`),
  - Stolica w Lubece (305) lub Hamburgu (`capital which = 305`),
  - Aktywacja istniejacej w modzie puli monarchow: `monarchs.HSA = 13599-13763`,
  - Utworzenie lub wzmocnienie Centrum Handlu (CoT) w prowincji 305,
  - Zyskanie kultury `german`,
  - Dobrowolna wasalizacja lub aneksja mniejszych miast zwiazkowych w Niemczech polnocnych.

---

## 3. Dwa Profile Ustrojowe Ligi

Gracz w drodze decyzji konstytucyjnej wybiera droge ustrojowa nowego panstwa:

```
                         [PROKLAMACJA HSA (1370)]
                                    │
                     ┌──────────────┴──────────────┐
                     ▼                             ▼
       [A. DIE HANSEATISCHE REPUBLIK]    [B. DAS NORDISCHE SEEREICH]
       (Republika Kupiecka / Senat)      (Monarchia / Talasokracja)
       - Rzady Burmistrzow i Patrycjatu  - Dziedziczny Kapitanat Generalny
       - Ekstremalna Plutokracja         - Silna wladza wykonawcza
       - Floty kaperskie i kondotierzy   - Regularna flota admiralska
```

### Model A: Die Hanseatische Republik (Republika Kupiecka)
- Wladza Senatu Ligi i czterech wielkich kwartalow miejskich (*Quartiere*).
- Zmiany suwakow:
  - `domestic which = PLUTOCRACY value = 4` (maksimum kupiectwa),
  - `domestic which = NAVAL value = 4` (caly potencjal w morze),
  - `domestic which = MERCANTILISM value = -3` (wolny rynek wewnetrzny i niskie clo dla czlonkow),
  - `domestic which = ARISTOCRACY value = -4` (usunięcie wplywu szlachty).
- Armia: niemal wylacznie elitarne wojska najemne i milicje cechowe opłacane z gigantycznych zyskow handlowych.

### Model B: Das Nordische Seereich (Talasokracja Północy / Stadtholder)
- Powolanie dziedzicznego Kapitanatu Ligi (np. z rodu von Lüneburg, Welfow lub Gryfitow pomorskich).
- Utworzenie zintegrowanego terytorialnie panstwa morskiego zdolnego stawic czolo krolom Danii, Szwecji i Francji.
- Zmiany suwakow: wyzsza centralizacja (`CENTRALIZATION value = 3`), silna flota wojenna.

---

## 4. Unikalne Mechaniki Ekspansji

### 4.1. Dominium Maris Baltici i Cło Sundzkie (ok. 1370–1400)
- **Wojna o ciesniny**: zlamanie monopolu Korony Dunskej.
- **Decyzja: Opanowanie Sundu**:
  - Wymog: kontrola prowincji Skania (251) i Sjaelland (307).
  - Efekt: prawo pobierania cla sundzkiego (*Sundzoll*) – coroczny wielki przychod handlowy do skarbca (`trade = 500`, stały dochod podatkowy prowincji +5), permanentny spadek wplywow Kopenhagi.

### 4.2. Eksterytorialne Uzbrojone Kontory Ligi
Zamiast kosztownego podboju calych obcych krolestw, Hanza rozbudowuje 4 wielkie historyczne bazy zagraniczne, zamieniajac je w uzbrojone faktorie:

1. **Steelyard w Londynie (Anglia 247)**:
   - Wymuszenie przywilejow na Koronie Angielskiej (lub interwencja w dobie Wojny Dwóch Róż).
   - Efekt: monopol na eksport angielskiej welny, dochod +5 do Mecklemburga, wplyw na polityke Anglii.
2. **Peterhof w Nowogrodzie (Nowogrod 274)**:
   - Podporzadkowanie handlu futrami i woskiem, uniezaleznienie faktorow od woli posadnikow.
3. **Bryggen w Bergen (Bergenshus 256)**:
   - Pelen monopol na handel dorszem suszonym (sztokfiszem) i tranem, wplyw na unie kalmarska.
4. **Kantor w Brugii / Antwerpii (Flandern 380)**:
   - Otwarcie szlaku ku suknu flamandzkiemu i zlotu hiszpanskiemu.

### 4.3. Polnocny Szlak Atlantycki (Wyprawy ku Winlandii)
- W dobie XV wieku zeglarze hanzeatyccy wyplywaja z baz w Bergen ku Islandii i Grenlandii.
- **Decyzja: Slakiem Dawnych Wikingow (ok. 1460–1490)**:
  - Odkrycie i kolonizacja **Winlandii (Nowa Fundlandia / Kanada / prowincje Placentia, Wabana)** na dziesieciolecia przed Johnem Cabotem i Anglikami!
  - Powstanie hanzeatyckich osad wielorybniczych i faktorii handlu futrami z rdzennymi plemionami Ameryki Polnocnej.

---

## 5. Reakcje Mocarstw Osciennych

1. **Krolestwo Danii (DAN) i Unia Kalmarska**:
   - Ciagly konflikt o wladze nad ciesninami i handel morski; proby zbrojnego wypchniecia kupcow hanzeatyckich ze Skanii i Bergen.
2. **Krolestwo Anglii (ENG)**:
   - Konflikt z *Merchant Adventurers* (angielskimi kupcami); w razie wrogosci – zbrojne oblezienie Steelyardu w Londynie i wojny handlowe na Morzu Polnocnym.
3. **Republika Nowogrodzka (NVG) i Wielkie Ksiestwo Moskiewskie (MOS)**:
   - Nowogrod jako partner handlowy vs. Moskwa Iwana III, ktora historycznie zlikwidowala Peterhof. Gracz moze obronic Nowogrod przed moskiewska aneksja!
4. **Książęta Rzeszy (HRE)**:
   - Opor sasiedzkich elektorow (Brandenburgia, Saksonia, Brunszwik) przed imperializmem wolnych miast.

---

## 6. Alokacja ID i Integracja Techniczna

- **Decyzje**: Zakres ID **7150–7199** w pliku `Db/Decisions/hansa.txt`.
- **Eventy**: Wykorzystanie i adaptacja istniejacego pliku `Db/Events/OAJF_hansa2.txt` oraz nowa pula eventow integracyjnych w `Db/Events/hansa_alt.txt` (ID **110050–110099**).
- **Monarchowie**: Istniejaca juz w modzie, w pelni zarezerwowana pula:
  `monarchs.HSA = 13599-13763 (Hanseatic League)` w [Gloriana Monarch and Leader ID file.txt](file:///d:/Steam/steamapps/common/For%20The%20Glory/Mods/Gloriana_1337/Work%20Folder/Gloriana%20Monarch%20and%20Leader%20ID%20file.txt).
- **Tag**: `HSA` (obecny w `Db/countries.txt`, kolor DarkGray).
- **Prowincje kluczowe**: 305 (Mecklemburg/Luebeck), 336 (Bremen), 301 (Danzig), 344 (Koeln), 304 (Vorpommern), 251 (Skaone), 307 (Sjaelland).
