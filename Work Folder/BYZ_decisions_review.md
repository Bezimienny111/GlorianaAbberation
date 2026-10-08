# BYZ: analiza decyzji i powiazanych wydarzen

Data: 2026-10-08.
Status: analiza statyczna, bez zmian w plikach gry i bez testu silnika FTG.
Zakres: decyzje 6000-6015 i 6020-6040 oraz ich bezposrednie zaleznosci.

## Material zrodlowy

- [Decyzje BYZ](../Db/Decisions/Byzantine.txt).
- [Dawna sciezka restauracji i eventy kampanii](../Db/Events/BYZANNEX_08_Imperial_Restoration.txt).
- [Renaissance / The Italians](../Db/Events/BYZANNEX_06_Renaissance.txt).
- [Trebizond](../Db/Events/BYZANNEX_05_Trebizond.txt).
- [North Italy / Union of Monferrat](../Db/Events/BYZANNEX_13_North_Italy.txt).
- [Rome](../Db/Events/BYZANNEX_14_Rome.txt).
- [Mameluks](../Db/Events/BYZANNEX_16_Mameluks.txt).
- [Russia](../Db/Events/BYZANNEX_19_Russia.txt).
- [Zasady decyzji FTG](../Db/Decisions/Readme.txt).
- [Changelog dotychczasowych konwersji](CHANGELOG_events.txt).

## 1. Pewne bledy i niedokonczone zaleznosci

### 1.1. Niedostepna decyzja 6008

- Miejsce: `potential` decyzji 6008, flaga `optionsopen3`.
- Problem: w przeszukanych plikach `Db` nie ma ustawienia tej flagi.
- Skutek: restauracja Balkanow i Lewantu z tej galezi nie jest dostepna w normalnym przebiegu gry.
- Najbardziej prawdopodobne miejsce naprawy: akcja decyzji 6029, "I can never choose", nadajaca roszczenia do obu regionow.
- Propozycja: dodac tam `setflag` dla `optionsopen3`; sprawdzic odblokowanie 6008 po wykonaniu 6029.

### 1.2. Bledne prowincje w decyzji 6012

- Miejsce: `trigger` decyzji 6012, "Restoration of the Balkans".
- Problem: wymagane jest 9 z 10 prowincji Lewantu i Egiptu, nie Balkanow.
- Skutek: po decyzji 6034, ustawiajacej `westwardho3`, mozna uzyskac balkanskie core'y bez odpowiedniego podboju Balkanow.
- Propozycja: oprzec warunki na balkanskim zestawie 6001/6006, z tym samym uzgodnionym progiem.

### 1.3. Niepelne przeniesienie blokad z eventu 3001135

- Miejsce: opcja "Mi amici!" w evencie 3001135, "The Italians".
- Problem: `sleepevent` nadal dotyczy zastapionych eventow 3001155-3001162; nie blokuje decyzji 6024-6039.
- Istniejace zabezpieczenie: `byz_restoration_complete_blocked` blokuje tylko decyzje 6040.
- Skutek: ekspansja i nagrody z decyzji pozostaja dostepne, ale eventy wsparcia 3001163-3001166 sa uspione.
- Propozycja: ustalic, czy wybor ma zamykac cala sciezke restauracji. Jesli tak, przeniesc blokade do `potential` wszystkich objetych nia decyzji, zachowujac stare linie jako komentarze.

## 2. Niespojnosci warunkow dostepnosci

### 2.1. Decyzja 6035 wymaga fragmentu przyszlego celu

- `potential` wymaga 4 z 6 prowincji: Sivas, Angora, Anatolia, Syria, Judea, Alexandria.
- Tylko trzy sa anatolijskie. Bez przynajmniej jednej z trzech prowincji Lewantu/Egiptu decyzja nie bedzie widoczna.
- Tymczasem jej glownym efektem jest dopiero nadanie roszczen do Lewantu i Egiptu po opanowaniu Italii, Anatolii i Balkanow.
- Propozycja: widocznosc oprzec na ziemiach stanowiacych zaplecze wyprawy, a nie wymuszonym wczesniejszym podboju jej celu.

### 2.2. Decyzja 6030 nie obsluguje konsekwentnie wasali

- `trigger` dopuszcza podporzadkowanie panstw wloskich zamiast bezposredniego posiadania ich ziem.
- `potential` wymaga jednak wlasnosci trzech z szesciu wskazanych prowincji.
- Skutek: calkowite zwyciestwo dyplomatyczne moze spelniac warunki wykonania, ale nie warunki widocznosci.
- Propozycja: uwzglednic odpowiednie alternatywy wasalne takze w `potential`, albo jawnie przyjac wymaganie czesci bezposrednich podbojow.

### 2.3. Potential potrafi zawetowac tolerancje brakujacych prowincji

- Przyklad 6036: `trigger` wymaga 19 z 21 prowincji, ale `potential` wymaga 5 z 6 kluczowych ziem.
- Jesli dwiema brakujacymi prowincjami sa Dobrudja i Anatolia, `trigger` przechodzi, lecz `potential` ma tylko 4 z 6 i blokuje decyzje.
- Podobny przypadek w 6038/6039: brak Dobrudzy i Bulgarii moze miescic sie w progu 21 z 23, lecz zawetowac widocznosc.
- Propozycja: sprawdzic implikacje "spelniony trigger => spelnione prowincjonalne potential" dla wszystkich duzych zestawow.
- Uwagi: samo dopuszczenie jednej lub dwoch brakujacych prowincji jest udokumentowanym wyborem projektowym, nie bledem skladni.

## 3. Efekty i balans wymagajace decyzji projektowej

### 3.1. Powtorne nagrody za restauracje tego samego regionu

- Przyklad: 6020 ustawia `totheeast`, a pozniejsza 6024 moze ustawic `totheeast2`.
- Decyzje 6000 i 6003 maja osobne ID oraz osobne `unique = yes`; obie moga przyznac redukcje badboy o 3.
- Nie ma wspolnej flagi zakonczonej restauracji Anatolii, ktora wykluczalaby drugi wariant nagrody.
- Propozycja: wspolne flagi integracji regionow, niezalezne od kolejnosci wyborow strategicznych.
- Nie przesadzac bez testu, czy ponowne wywolanie tego samego niepersistentnego eventu kampanii przyzna wojsko ponownie.

### 3.2. Brak roszczenia do Napoli w 6037

- Decyzja 6037 przyznaje roszczenia do 394, 395, 396 i 819, ale nie do Napoli (393).
- Decyzja 6014, odblokowywana przez `Romeward3`, wymaga takze Napoli.
- Nie jest to twarda blokada wykonania, lecz niespojnosc wzgledem innych wloskich galezi.
- Propozycja: dodac roszczenie albo wyjasnic fabularnie celowe pominiecie.

### 3.3. Pokojowa konsolidacja ma kary dyplomatyczne inwazji

- Decyzja 6036, "Consolidate our realm", pogarsza relacje z wieloma panstwami zachodnimi; z PAP o 400.
- Efekty zostaly odziedziczone po starym evencie, ale nie odpowiadaja opisowi pokojowej alternatywy.
- Propozycja: uzasadnic je sporem o tytul cesarski albo odroznic zestaw relacji od opcji ataku na Italie.

### 3.4. Niewykorzystany bonus stabilnosci

- 6001, 6006, 6007 i 6012 wymagaja stabilnosci 3 i przyznaja dodatkowo +1.
- Przy zwyklym wykonaniu bonus nie poprawi stabilnosci ponad limit.
- Propozycja: obnizyc wymaganie albo zastapic nagrode; wybor zalezy od zamierzonej trudnosci restauracji.

### 3.5. Wsparcie kampanii przychodzi po podboju

- Eventy 3001163-3001166 wywolywane sa z decyzji restauracji, po zdobyciu prawie calego odpowiedniego regionu.
- Opisy mowia natomiast o rekrutacji do wyprawy.
- Propozycja: odroznic pomoc na rozpoczecie kampanii od nagrody po jej zakonczeniu. Nie przenosic efektow bez oceny balansu.
- Szczegolna uwaga: 3001166 daje 35 000 piechoty, 15 000 kawalerii i 40 artylerii, ale odejmuje 500 manpower oraz obniza podatki w czterech losowych prowincjach.

## 4. Elementy wygladajace poprawnie

- Decyzje i eventy sciezki sa zarejestrowane w glownym pliku `Db/events.txt`.
- Eventy 3001154-3001162 oraz 3001167 maja blokade `NOT = { tag = BYZ }` przy `country = BYZ`; nie powinny naturalnie konkurowac z nowymi decyzjami.
- Alternatywy 6020-6023 dziela flage `byz_crossroads`, blokujaca ponowny wybor.
- Sprawdzone powiazania mameluckie i rosyjskie korzystaja z nowych flag etapow zamiast historii zastapionych eventow.
- Reakcje PAP/MOS/RUS na abdykacje korzystaja z `GRE = { flag = byz_crossroads }` oraz braku BYZ.
- `someof` uzywa poprawnego podklucza `number`.
- Sekcja propozycji 6041-6062 jest komentarzem, nie dzialajaca implementacja dalszej ekspansji.

## 5. Minimalna kolejnosc ewentualnych poprawek

1. Naprawic osierocona flage 6008 i zestaw prowincji 6012.
2. Uzgodnic znaczenie opcji "Mi amici!" i przeniesc odpowiednie blokady.
3. Uzgodnic jednorazowosc regionalnych restauracji i ich nagrod.
4. Poprawic zgodnosc `potential` z `trigger`, szczegolnie dla wasali.
5. Dopiero potem zmieniac balans nagrod, relacje i moment wsparcia kampanii.

Kazda zmiana pliku eventu lub decyzji wymaga wpisu po angielsku do CHANGELOG_events.txt. Linie zastapione lub zbedne nalezy komentowac, nie usuwac bez wyraznego polecenia.

## 6. Testy wymagajace gry

- Wykonanie 6029 i pojawienie sie 6008 po ewentualnej naprawie.
- Przyjecie opcji "Mi amici!" przed oraz po rozpoczeciu restauracji.
- Dwie galezie restauracji tego samego regionu w jednej kampanii.
- Ponowne wywolanie tego samego eventu kampanii i zachowanie uspionego eventu.
- Zachowanie flag i historii decyzji po BYZ -> GRE.
- Widocznosc 6030 przy dominacji przez wasali oraz 6036 przy dwoch brakujacych kluczowych ziemiach.

Nie potwierdzono w silniku: ponawiania eventow wywolywanych komenda `trigger`, migracji flag po zmianie tagu ani zachowania nagrod przy limitach zasobow.