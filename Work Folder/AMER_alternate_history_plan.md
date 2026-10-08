# AMER: Odrodzenie i Reformacja Mezoameryki oraz Andow (1337–1838)

Data: 2026-10-08.
Status: szczegolowy projekt alternatywnej historii dla Imperium Aztekow i Inkow.
Tagi: `AZT` (Aztekowie / Mexica), `INC` (Inkowie / Tawantinsuyu), `MAA` (Maja), `ZAP` (Zapotekowie), `TAR` (Taraskowie), `CHM` (Chimu).
Horyzont czasowy: 1337–1838.

---

## 1. Zalozenia silnika FTG i bariery historyczne

W silniku *For The Glory* panstwa Nowego Swiata zostaly obciazone restrykcjami:
- **Grupa technologiczna `pagan`**: surowa kara -20% do predkosci badan technologicznych oraz kary dochodowe.
- **Zasada aneksji pogańskiej**: dowolne panstwo o religii `pagan` moze zostac anektowane w 100% w jednym traktacie pokojowym, niezaleznie od liczby posiadanych prowincji.
- **Brak hutnictwa zelaza, broni palnej i koni**: w 1337 roku armie obu cywilizacji uzywaja wylacznie piechoty, broni z obsydianu i brązu oraz lam.
- **Katastrofa demograficzna (Ospa / Wielkie Wymieranie)**: historycznie epidemie zniszczyly 70–90% populacji obu imperiow.

**Cel projektu**: Stworzenie pelnej sciezki decyzyjno-eventowej pozwalajacej graczowi zreformowac panstwo, ocalic populacje, przejac technologie europejska i odeprzec inwazje konkwistadorow.

---

## 2. IMPERIUM MEZIKOW / AZTEKOWIE (Tag: AZT)

```
                     [1337-1428: WZROST POTEGI TENOCHTITLAN]
                                        │
                [DECYZJA: REFORMA FILOZOFICZNA NEZAHUALCOYOTLA]
                                        │
                    ┌───────────────────┴───────────────────┐
                    ▼                                       ▼
       [A. SWIATLOSC QUETZALCOATLA]            [B. WOJNA TOTALNA HUITZILOPOCHTLI]
       - Zniesienie ofiar z ludzi              - Masowe ofiary z jencow
       - Wieczna Liga Anahuac                  - Fanatyczne morale armii
       - Sojusz z Tlaxcala i Tarascanami       - Nienawisc sasiednich ludow
                    │                                       │
                    └───────────────────┬───────────────────┘
                                        │
                        [1519: LADOWANIE CORTESA W VERACRUZ]
                                        │
                     [EVENT: ODWROCENIE LA NOCHE TRISTE]
                     - Pulapka na groblach Tenochtitlan
                     - Przejecie koni, arkebuzow i karaweli
                                        │
                    ┌───────────────────┴───────────────────┐
                    ▼                                       ▼
       [ADAPTACJA ZELAZA I PROCHU]             [KONTROFENSYWA MORSKA]
       - Techgroup -> orthodox                 - Stocznia w Veracruz
       - Rycerze Jaguara na Koniach            - Odbicie Kuby i Karaibow
       - Kwarantanna ospy (ziololecznictwo)    - Pan-Mezoamerykanska Flota
```

### 2.1. Faza I: Reformy Wewnetrzne i Porozumienie Doliny Anahuac (XV w.)
Historycznie wladcy Mexicow (Tlacaelel i Montezuma I) oparli panstwo na terrorze Wojen Kwietnych (*Xochiyaoyotl*) i masowych ofiarach z jencow. W rezultacie sasiedzi (Tlaxcala, Totonakowie) nienawidzili Tenochtitlan i przeszli na strone Cortesa.

* **Decyzja A01: Kodeks Prawny z Texcoco (Nauki Nezahualcoyotla)**:
  * Wymogi: Pokoj, wladca ADM >= 6, innowacyjnosc >= 4.
  * Efekt: Odrzucenie religijnego terroru na rzecz filozofii harmonii kosmicznej (*Ometeotl*) i kultu boga madrosci *Quetzalcoatla*.
  * Zmiana religii na zreformowana: `religion which = nahua_reformed` (`annexable = no`, `tech_speed = 5.00`, brak kar dyplomatycznych).
  * `domestic which = INNOVATIVE value = 3`, `domestic which = CENTRALIZATION value = 2`.
* **Decyzja A02: Wieczna Liga Cemanahuac (Pojednanie Sasiedzkie)**:
  * Wymogi: Wykonane A01, brak wojen w Mezoameryce.
  * Efekt: Pokojowa unia z Tlaxcala, Taraskanami (`TAR`) i Zapotekami (`ZAP`) – wlaczenie kultur `tarascan` i `zapotec` jako kultur panstwowych.
  * **Kluczowy skutek historyczny**: Cortes po wyladowaniu w 1519 r. **nie znajduje ani jednego indiańskiego sojusznika!**

### 2.2. Faza II: Konfrontacja z Cortesem (1519–1521)
* **Event: Pulapka na Groblach Jeziora Texcoco (Wielka Noc Odwetu)**:
  * Mexikowie nie daja sie zwiesc mitom o „bialych bogach”.
  * Zamiast uleglosci – uderzenie na garnizon hiszpanski, zniszczenie armii Cortesa, pojmanie zywcem hiszpanskich oficerow, rusznikarzy i kowali.
* **Event: Przejecie Skarbow Zelaza i Ognia**:
  * Zdobycie hiszpanskich arkebuzow, armat polowych, zbroi plytowych oraz kilkudziesieciu koni bojowych w Veracruz.
  * Przymusowa praca jencow hiszpanskich jako instruktorow rusznikarstwa i hodowli koni.

### 2.3. Faza III: Skok Cywilizacyjny i Kwarantanna (1525–1560)
* **Event: Kordon Sanitarny i Tradycyjna Medycyna Ziolowa**:
  * W obliczu ospy kaplani i zielarze Mexicow wprowadzaja natychmiastowa izolacje chorych, dezynfekcje parowa i leczenie roslinami leczniczymi.
  * Skutek: strata populacji ograniczona do 15% (zamiast historycznych 80%).
* **Decyzja A03: Zelazne Imperium Mexikow**:
  * Wymogi: Posiadanie kopaln w Michoacan (28) lub Oaxaca (31), posiadanie technologii zelaza od jencow.
  * Efekt: `techgroup which = orthodox` (likwidacja kary pogańskiej!).
  * Powstanie formacji: **Rycerze Orla i Jaguara na Koniach** (`CAV value = 6000`) oraz kompanie arkebuzerow Mexica (`INF value = 10000`, `ART value = 20`).

### 2.4. Faza IV: Flota Zatoki Meksykańskiej i Wyparcie Hiszpanow
* **Decyzja A04: Arsenaly w Veracruz**:
  * Budowa pelnomorskich karaweli i galeonow na wzor hiszpanski.
  * Roszczenia do wysp Morza Karaibskiego (Kuba 138, Jamajka 140, Hispaniola 141).
  * Wyparcie hiszpanskich flot i zabezpieczenie wybrzezy Ameryki Srodkowej przed dalsza kolonizacja.

---

## 3. IMPERIUM INKOW / TAWANTINSUYU (Tag: INC)

```
                    [1337-1438: PACHACUTI I NARODZINY TAWANTINSUYU]
                                       │
                      [SYSTEM QHAPAQ ÑAN I SPICHLERZE QULLQA]
                                       │
                     [1525: UNIKNIECIE WOJNY DOMOWEJ W QUITO]
                     - Pojednanie Huascara i Atahualpy
                     - Brak rozbicia w przeddzien inwazji
                                       │
                     [1532: SPOTKANIE W CAJAMARCE - PULAPKA]
                     - Pojmanie Francisca Pizarra
                     - Krolewski okup w zbrojach, koniach i technologii
                                       │
                    ┌──────────────────┴──────────────────┐
                    ▼                                     ▼
        [REFORMA ANDYJSKIEGO ZELAZA]           [TALASOKRACJA PACYFIKU]
        - Zmiana techgroup -> orthodox         - Bazy w Callao i Guayaquil
        - Hodowla koni na Altiplano            - Szlak Tupaca Yupanqui
        - Odlewnictwo armat w Cusco            - Nawiazanie kontaktu z Azja
```

### 3.1. Faza I: Imperialna Infrastruktura Andyjska (XV w.)
* **Decyzja I01: Droga Krolewska Qhapaq Ñan**:
  * Wymogi: Pokoj, kontrolowane prowincje andyjskie od Quito do Cusco.
  * Efekt: Brukowane traktaty gorskie z wiszacymi mostami nad przepasciami. `infra = 500`, premia do podatkow i szybkosci przemieszczania armii.
* **Decyzja I02: Spichlerze Panstwowe (*Qullqa*) i System Biegaczy (*Chasqui*)**:
  * Potezny system magazynowania suszonej zywnosci i welny alpaki gwarantujacy brak klesk glodu.
  * W razie zarazy: stacje kurierskie natychmiast przenosza ostrzezenia i kordony sanitarne wzdluz calych Andow.

### 3.2. Faza II: Pojednanie w Quito (1525–1530)
W historii smierc cesarza Huayna Capaca wywolala niszczycielska wojne sukcesyjna pomiedzy Huáscarem (Cusco) a Atahualpą (Quito), co pozwolilo 168 Hiszpanom podbic imperium.
* **Event: Sukcesja Synow Slonca**:
  * Zamiast wojny domowej:
    - *Opcja A (Podzial diarchiczny)*: Atahualpa obejmuje dowodztwo polnocnych armii, Huascar wladze religijna i poludnie.
    - *Opcja B (Jednowladztwo w Cusco)*: Pokojowe przekazanie wladzy z poparciem rady arystokracji.
  * **Skutek**: Imperium wita Hiszpanow w pelni zmobilizowane, zjednoczone i z polmilionowa armia w gotowosci!

### 3.3. Faza III: Pulapka w Cajamarce (1532)
* **Event: Zasadzka na Hiszpanow w Cajamarce**:
  * Inka otacza oddzial Pizarra w gorskim wawozie.
  * Pizarro i jego zolnierze trafiaja do niewoli.
* **Event: Okup z Wiedzy i Stali**:
  * Inka daruje zycie Hiszpanom w zamian za:
    - Przekazanie wiedzy o kowalach stali i prochu,
    - Nauczenie andyjskich pasterzy ujezdzania i hodowli koni,
    - Przekazanie map morskich i nawigacji.

### 3.4. Faza IV: Zelazne Legiony Tawantinsuyu (1535–1570)
* **Decyzja I03: Odlewnie Armat w Cusco i Tiwanaku**:
  * Inkowie od stuleci byli mistrzami odlewnictwa brazu. Wykorzystujac złoża miedzi i cyny z Altiplano, uruchamiaja seryjne odlewanie armat polowych i fortecznych.
  * Fortece Sacsayhuamán i Ollantaytambo zostaja przeksztalcone w nowoczesne twierdze artyleryjskie.
* **Decyzja I04: Andyjska Konnica z Altiplano**:
  * Wyhodowanie odpornych na gorskie powietrze ras koni. Powstanie lekkiej kawalerii andyjskiej z lancami i bolami.
  * `techgroup which = orthodox`, `religion which = inti_reformed` (`annexable = no`).

### 3.5. Faza V: Talasokracja Pacyfiku
* **Decyzja I05: Dziedzictwo Tupaca Yupanqui (Galeony z Guayaquil)**:
  * Budowa stoczni wojennych na Pacyfiku z drewna lasow deszczowych Ekwadoru.
  * Opanowanie zachodniego wybrzeza Ameryki Poludniowej (od Chile po Paname).
  * Transpacyficzne wyprawy ku Polinezji i Azji – nawiazanie bezposredniego handlu z Cesarstwem Chin dynastii Ming lub Japonia, z pominieciem europejskich szlakow atlantyckich!

---

## 4. Reakcje Mocarstw Europejskich

1. **Hiszpania (SPA)**:
   * **Kleska Konkwisty**: Brak naplywu amerykanskiego srebra z Potosí i Zacatecas doprowadza Korone Hiszpanska do bankructwa 50 lat wczesniej.
   * **Wielka Armada na Zachod**: Proba wyslania regularnej armii hiszpanskiej w latach 1540–1560; gracz staje do regularnej wojny z imperium Habsburgow.
2. **Stolica Apostolska (PAP)**:
   * **Bulla o Obywatelach Nowego Swiata**: Po wykazaniu przez Mexikow i Inkow zaawansowanej wiedzy i odrzuceniu pogańskiego kanibalizmu papiez uznaje ich za suwerenne narody, zakazujac niewolnictwa i wojen eksterminacyjnych.
3. **Portugalia (POR)**:
   * Obawa przed ekspansja Inkow na wschod przez Amazonie w strone Brazylii.

---

## 5. Definicje Nowych Religii w Db/Religions/religions.txt

```
religion = {
	name = "nahua_reformed"
	group = "pagan"
	color = "DarkOrange"
	tech_speed = 5.00
	stability_cost = 45.00
	stability_bonus = 0.00
	missionary_placement_chance = 0.40
	missionaries = 1.00
	trade_efficiency = 5
	production_efficiency = 10
	land_morale = 0.10
	defender = yes
	annexable = no
}

religion = {
	name = "inti_reformed"
	group = "pagan"
	color = "Yellow"
	tech_speed = 5.00
	stability_cost = 40.00
	stability_bonus = 1.00
	missionary_placement_chance = 0.45
	missionaries = 1.00
	global_tax_modifier = 15
	production_efficiency = 10
	land_morale = 0.10
	defender = yes
	annexable = no
}
```

---

## 6. Alokacja ID i Integracja Techniczna

- **Decyzje**: Zakres ID **7200–7299** w pliku `Db/Decisions/americas.txt`.
- **Eventy**: Zakres ID **113000–113150** w pliku `Db/Events/americas_alt.txt`.
- **Kultury**: `nahuatl`, `tarascan`, `zapotec`, `quechua`, `aymara`, `chimu`.
- **Prowincje kluczowe Mexica**: 27 (Tenochtitlan), 26 (Michoacan), 28 (Zacatecas), 34 (Veracruz).
- **Prowincje kluczowe Inkow**: 168 (Cuzco), 164 (Quito), 167 (Lima/Callao), 169 (Arequipa), 192 (Potosi).
