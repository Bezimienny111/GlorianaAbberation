# PAP: trzy sciezki historii alternatywnej

Data: 2026-10-08.
Status: szczegolowy projekt uzgodniony z uzytkownikiem, zatwierdzony do implementacji.
Horyzont: kampania 1337-1838.
Alokacja ID: Decyzje 7000-7099 (nowy plik Db/Decisions/papal.txt); Eventy 296150+ (bufor 120+ ID po 296023, plik Db/Events/papal_alt.txt). Tagi: PAP -> ITA (Krolestwo) / WRE (Cesarstwo).

## 1. Zalozenia, audyt silnika i doswiadczenia z BYZ

- Wspolny poczatek: odbudowa niezaleznosci papiestwa i zjednoczenie polnocnych oraz srodkowych Wloch.
- Rozgalezienie: teokracja (PAP), Krolestwo Wloch (ITA) albo odrodzone Cesarstwo Zachodnie (nowy tag WRE).
- Decyzje sluza swiadomym wyborom i integracji; eventy sluza reakcjom, kryzysom, negocjacjom, flavor i konklawe.
- Podzial decyzji na wersje wczesne i dojrzale:
  - Wersja wczesna (przed graniczna data, np. 1450): bardziej restrykcyjne wymagania (wyzsza stabilnosc, wiekszy skarb, surowsze warunki dyplomatyczne).
  - Wersja dojrzala (po granicznej dacie): zlagodzone progi terytorialne do okolo 70-80% ziem (warunek `someof`), aby nie blokowac gracza z powodu pojedynczej obcej prowincji. Nie wymagac 100% prowincji.
- Audyt mechaniki religijnej i tagow:
  - W `religions_special.txt` tag PAP ma zdefiniowane `no_dynastic = { ... PAP ... }` (calkowity zakaz malzenstw krolewskich i brak mozliwosci elekcji HRE) oraz `religious_leader = { PAP = catholic }`.
  - Pozostawienie tagu PAP dla panstwa swieckiego uniemozliwiloby gre dynastyczna (brak mariazy). Zmiana tagu na ITA (posiadajace bonus elekcji HRE i pelne relacje dynastyczne) oraz nowy tag WRE jest technicznie niezbedna dla sciezek K i I.
  - W sciezkach K i I papiez nie jest monarcha panstwa; wybor papieza to periodyczny event `Habemus Papam` ze stabilnoscia +1 (bez tworzenia odrebnego panstwa PAP na mapie w Rzymie).
- Zasada integracji prowincji:
  - Decyzje regionalne przyznaja hegemonie i roszczenia (`core_claim` / flagi).
  - Nadanie pelnego rdzenia narodowego (`addcore_national`) odbywa sie za pomoca dedykowanego eventu dla kazdej prowincji z osobna, po minimum 10 latach nieprzerwanego posiadania (`owned`) i kontroli (`control`).
- Nie dodawac narzedzi, zaleznosci ani nowych mechanik spoza potwierdzonych mozliwosci FTG.
- Nie stosowac fikcyjnych zasobow "autorytet papieski", "legitymizacja" czy "prestiz" jako nieistniejacych komend. Ich fabularne znaczenie odwzorowac relacjami, stabilnoscia, badboy i flagami.

### Model zaleznosci

Wspolna sciezka -> zjednoczenie polnocy -> jeden wybor ustrojowy -> cele regionalne -> 10-letnia integracja prowincji -> final sciezki.

- Jedna flaga wyboru ustroju blokuje wszystkie pozostale opcje; osobna flaga wskazuje wybrana sciezke.
- Flaga roszczen nie oznacza natychmiastowego narodowego core'a. Narodowy core wymaga 10 lat stabilnego wladania prowincja.
- Jedna nagroda integracyjna na region, niezaleznie od kolejnosci kampanii.
- `potential`: tag/sciezka, czas, brak wykonania, umiarkowany prog widocznosci.
- `trigger`: faktyczne koszty, pokoj, niezaleznosc i wymagane ziemie (wariant wczesny lub zlagodzony 70-80%).
- Wymagania wasalne musza byc konsekwentnie dopuszczone w obu blokach, jesli sciezka dopuszcza wasali do zjednoczenia politycznego.
- Zakonczona decyzja nie uruchamia nagrody, jesli pokrewny stary event przyznal juz ten sam efekt; zaleznosci wymagaja audytu.

## 2. Geografia i tempo

Rdzen wspolny: Roma 399, Romagna 391, Marche 392, Siena 400, Firenze 401, Emilia 402.
Polnoc: Lombardia 389, Mantua 390, Veneto 370, Liguria 403, Piemonte 404.
Poludnie: Napoli 393, Apulia 394, Messina 395, Sicily 396.
Malta 819, Istria 368, Savoie 405, Korsyka i Sardynia: cele dodatkowe, nie automatyczne warunki zjednoczenia polnocy.

ID prowincji spoza tej wloskiej listy, nazwy lokalne, kultury i tagi partnerow trzeba sprawdzic w aktualnej mapie przed pisaniem skryptow. Nie przenosic w ciemno ID z vanilla EU2.

Proponowane okresy: wspolny etap 1337-1450; wybor ustroju od 1450; zjednoczenie poludnia od 1475; wyprawy oceaniczne od 1500; reformacja zgodnie z jej faktycznym rozpoczeciem; pozne finaly od 1650. Gracz moze dojsc do etapow pozniej.

## 3. Wspolna sciezka: Wlochy pod opieka Rzymu

### C01. Powrot do Rzymu [decyzja + reakcje]

- Widocznosc: PAP, etap jeszcze niezakonczony; pominac relokacje, jesli stolica juz jest w Rzymie.
- Wykonanie: posiada i kontroluje Rome, pokoj, niezaleznosc, stabilnosc >= 0.
- Propozycja efektow: stolica w Rzymie, koszt 100, infrastruktura +200, relacje z FRA -25; flaga odbudowy kurii.
- Event reakcji Francji: uznanie samodzielnosci albo nacisk dyplomatyczny; bez automatycznej wojny.

### C02. Legaci i zbuntowane komuny [decyzja + eventy]

- Cel: uporzadkowanie Romanii i Marche; roszczenia tylko do ziem nieobjetnych juz odpowiednimi core'ami.
- Wykonanie: C01, stabilnosc >= 1, skarbiec >= 75.
- Efekty: koszt 75, roszczenia, mozliwosc aktywacji Albornoza w jego okresie zycia/sluzby.
- Event lokalny: autonomia komunalna (mniejsze dochody, lagodniejszy opor) albo administracja legatow (centralizacja, czasowe niepokoje).

### C03. Liga pokoju wloskiego [decyzja + negocjacje]

- Cel: podporzadkowanie Toskanii i Emilii, poczatkowo jako protektorat polityczny.
- Wykonanie: opanowane Romagna i Marche, brak wasalizacji PAP, pokoj.
- Propozycja: koszt 100, dyplomaci +2, roszczenia do Siena/Firenze/Emilia.
- Eventy dla istniejacych panstw regionu: przyjecie wasalizacji i poprawa relacji albo odmowa i ograniczony casus belli. Nie anektowac panstw bez ich odpowiedzi.

### C04. Schizma i prawo do przewodzenia Italii [adaptacja eventow]

- Zachowac istniejacy historyczny rdzen Wielkiej Schizmy; dodac reakcje na wloska ekspansje.
- Wybory: francuska opieka, niezalezna kuria albo pojednanie soborowe.
- Bez nagrody "Habemus Papam" dla kazdego konkurencyjnego pretendenta.
- Zjednoczenie polityczne moze postepowac, ale wybor dziedzicznej korony wymaga zakonczonej schizmy i uznanego papieza.

### C05. Korona longobardzka [decyzja + koalicja]

- Widocznosc: po C03 i opanowaniu czesci srodkowych Wloch.
- Wariant wczesny (przed 1450): Roma oraz cztery z pieciu ziem Romagna/Marche/Siena/Firenze/Emilia wlasne lub wasalne; pokoj, stabilnosc >= 2, koszt 200.
- Wariant dojrzaly (od 1450): Roma oraz trzy z pieciu ziem (ok. 70%) wlasne lub wasalne; pokoj, stabilnosc >= 1, koszt 150.
- Efekty: roszczenia (`core_claim`) do Lombardia/Mantua/Veneto/Liguria/Piemonte.
- Eventy FRA, cesarskiego partnera i VEN: negocjacje, neutralnosc lub opor. Kontakty z cesarzem wymagaja poprawnej obslugi aktualnego posiadacza tytulu HRE.

### C06. Zjednoczenie polnocnej Italii [decyzja integracyjna]

- Rozbicie na warianty czasowe:
  - Wariant wczesny (przed 1450): Roma i Lombardia bezposrednio; co najmniej osiem z dziewieciu pozostalych ziem rdzenia i polnocy wlasne lub wasalne (ok. 90%); pokoj, stabilnosc >= 2, niezaleznosc, koszt 250.
  - Wariant dojrzaly (od 1450): Roma bezposrednio; co najmniej siedem z dziesieciu ziem rdzenia i polnocy wlasne lub wasalne (ok. 70-75% via `someof`); pokoj, stabilnosc >= 1, niezaleznosc, koszt 150.
- Wasale zaliczaja sie do hegemonii politycznej, nie do natychmiastowej integracji narodowej.
- Efekty: flaga hegemonii, badboy -2, stabilnosc +1, infrastruktura +300.
- Integracja prowincjonalna: decyzja nie daje natychmiastowych core'ow narodowych na wszystkie ziemie; uruchamia ona mechanizm 10-letniej integracji (osobny event dla kazdej bezposrednio posiadanej prowincji, sprawdzajacy minimum 10 lat stabilnej wladzy).

### C07. Miecz i tiara [event otwierajacy trzy decyzje]

- Warunki: C06, rok >= 1450, zakonczona schizma, pokoj i niezaleznosc.
- Event opisuje spory kurii, komun, kupcow i dowodcow; sam nie wybiera ustroju za gracza.
- Decyzje T01/K01/I01 maja wspolna flage `pap_constitution_chosen` i trzy wzajemnie wykluczajace sie flagi sciezek.
- Pozostanie przy teokracji jest pelnoprawnym wyborem, nie kara za rezygnacje z ekspansji.

## 4. Sciezka T: wielka teokracja wloska

| Etap | Warunki i decyzja | Eventy, alternatywy i efekty |
|---|---|---|
| T01 Patrimonium Sancti Petri | Wybor teokracji po C07; PAP pozostaje tagiem i papieze monarchami | Koszt reorganizacji 100, centralizacja +1, stabilnosc +1; komuny bronia autonomii. |
| T02 Reforma Kurii | Pokoj, stabilnosc >= 1, 150 dukatow; przed reformacja lub jako opozniona odpowiedz | Ograniczyc sprzedaz urzedow i nepotyzm: infrastruktura +300, chwilowe niepokoje. Odmowa zachowuje pieniadze, lecz pogarsza przyszly kryzys. |
| T03 Patronat czy odpusty | Finansowanie bazyliki dopiero po uzgodnieniu z istniejacym eventem 3546 | Dotacja panstwowa kosztuje wiecej; fundusze rodow daja im wplywy; agresywna sprzedaz odpustow zaostrza reakcje na reformacje. |
| T04 Wystapienie Lutra | Event po faktycznym rozpoczeciu reformacji | Potepienie, rozmowy albo szybki sobor. Wczesniejsza reforma Kurii zmniejsza opor w posiadanych ziemiach, nie usuwa reformacji z Europy. |
| T05 Sobor powszechny | Decyzja: pokoj lub brak wojny na ziemiach soboru, stabilnosc >= 0, koszt 200 | Trzy warianty: kontrreformacja, umiarkowana reforma katolicka, supremacja soboru. Ostatni wywoluje wewnetrzny spor o kompetencje. |
| T06 Kolegia i zakony | Po wybranej odpowiedzi soborowej; wlasne miasta katolickie | Misjonarze +2, infrastruktura +250, koszt 125; napiecie miedzy szkolnictwem i kontrola doktryny. Powiazac z istniejacymi jezuitami 3547. |
| T07 Liga obrony wiary | Istnieje realny konflikt religijny; dobre relacje z zaproszonymi katolikami | Panstwa odpowiadaja osobno. Pomoc finansowa albo koalicja; wojna tylko wobec wskazanego przeciwnika, po zaakceptowanej eskalacji. |
| T08 Granice wladzy duchowej | Westfalia lub analogiczny pozny pokoj | Uznanie pluralizmu: lepsza dyplomacja; odmowa: konflikt z monarchiami i trudniejsza izolacja polityczna. |
| T09 Panstwo Ko?ciola po wojnach | Od 1650, stabilnosc >= 2, pokoj, utrzymany rdzen wloski | Jednorazowo badboy -3, infrastruktura +500, podatki +1 w dwoch zintegrowanych miastach; final polityczny, nie koniec wszystkich eventow. |

Teokracja moze podporzadkowac poludnie dyplomatycznie, ale nie otrzymuje automatycznie kolonialnej sciezki K ani cesarskich roszczen I. Konwersja poddanych i surowe represje musza miec realne koszty; nie kopiowac bezwarunkowo efektow starej inkwizycji na cudze prowincje.

## 5. Sciezka K: Krolestwo Wloch i oceany

| Etap | Warunki i decyzja | Eventy, alternatywy i efekty |
|---|---|---|
| K01 Korona Italii | C07, niezaleznosc, stabilnosc >= 2, brak ITA | Zmiana PAP -> ITA; Roma stolica; uspienie Transition Council (12150). Wybor rodu krolewskiego sposrod: Medyceusze (dyplomacja/kultura), Sforzowie (wojsko/centralizacja), Sabaudowie (militarny/alpejski), Colonna (tradycja kurialna). Koszt 200, stabilnosc -1; cesarz HRE kwestionuje koronacje. |
| K02 Pakt korony i tiary | Bezposredni event po K01 | Niezalezne konklawe albo prawo przedstawiania kandydatow przez krola. Pierwsze latwiejsze dyplomatycznie; drugie ryzykuje pozniejszy konflikt. Papiez pozostaje instytucja duchowa w Rzymie (eventy Habemus Papam). |
| K03 Od Alp do Sycylii | Roszczenia po K01; wariant wczesny/dojrzaly | NAP/SIC/ARG/SPA reaguje tylko gdy istnieje i ma interes w regionie. Przyznanie roszczen (`core_claim`); narodowe core'y nadawane w drodze 10-letniej stabilnej wladzy nad kazda prowincja. |
| K04 Krolewskie arsenaly | Wlasna Liguria lub Veneto, pokoj, 200 dukatow | Naval +500, handel +250; pierwsza flota wyprawowa wymaga oddzielnego finansowania. Spor Genui i Wenecji o kontrakty. |
| K05 Kompania oceaniczna | Zintegrowane poludnie, porty, rok >= 1500, skarbiec >= 250 | Koszt 250, kolonisci +2, czasowo dostepny odkrywca; polityka panstwowa albo udzial kupcow z wieksza pozniejsza autonomia. |
| K06 Przystan na Przyladku | Faktycznie odkryty region, zalozona kolonia i bezpieczna baza | Inwestycja 150, kolonisci +2, naval +250. Nie tworzyc automatycznie kolonii ani nie teleportowac armii do nieposiadanych ziem. |
| K07 Droga do Indii | Baza w poludniowej Afryce, port i srodki na nowa wyprawe | Drugi odkrywca, czasowe cele portowe; traktat handlowy lub podboj. Portugalia moze zawrzec umowe albo przeciwdzialac. |
| K08 Brama Malakki | Wlasny port na Oceanie Indyjskim, rok >= 1550 | Roszczenie do zweryfikowanego portu, nie do calego polwyspu; lokalny wladca wybiera dostep handlowy lub odmowe. |
| K09 Wyspy przypraw | Wlasny wezel przy Malakce lub rownowazna baza; finansowanie 200 | Wyprawy do Molukow oraz wybranych portow Jawy/Sumatry. Zgoda lokalnych elit, wojna lub wasalizacja jako odrebne warianty. |
| K10 Imperium handlowe | Od 1650, faktyczna siec: Przyladek + port indyjski + wezel malajski + port/kolonia w Indonezji | Trade +750, naval +500, badboy -2. Brak masowych narodowych core'ow i automatycznego dodania kultur azjatyckich. |
| K11 Rozrachunek z kompania | Eventy po K10 i podczas utraty baz | Kontrola korony: koszt, centralizacja; autonomia: tansze zarzadzanie, slabiej scentralizowane panstwo. Kryzys nie odpala stale bez przerwy. |

Kryzysy dynastyczne i sukcesyjne w K:
- Dynastia nie panuje w prostej linii przez 500 lat bez zaklocen.
- XVI wiek: pierwszy kryzys sukcesyjny (wygasniecie linii zalozycielskiej, spor pretendentow, ryzyko wstrzasow wewnetrznych lub przejscia na linie boczna).
- XVII wiek: wielki spor sukcesyjny i nacisk obcych mocarstw (francuska lub cesarska pretensja do wloskiego tronu).
- XVIII wiek: kryzys oswieceniowy – rzady slabej linii, regencja lub restauracja nowej galezi narodowej.

### 5.1. Wloska Reformacja i kryzys papieski w K
- **Edykt Narodowy (ok. 1525-1550)**: Krolestwo Wloch moze przejsc na protestantyzm lub kalwinizm (`religion which = protestant / reformed`).
  - Skutki: sekularyzacja dobr koscielnych (`treasury = 600`), podatek prowincjonalny +1 w trzech miastach (`provincetax`), spadek inflacji (`inflation = -1`), ale szok wewnetrzny `stability = -4` i relacje z katolikami -150.
- **Konklawe jako wrog wewnetrzny**: Dopoki papiez przebywa w protestanckim Rzymie, eventy `Habemus Papam` zamieniaja sie w **Anateme Papieska**: zamiast stabilnosci daja `stability = -1`, spadek relacji ze swiatem katolickim oraz ryzyko powstania w Rzymie i Neapolu (`religiousrevolt`).
- **Decyzja Expulsio Papae (Wypedzenie Kurii)**:
  - Wymogi: protestantyzm/kalwinizm, posiadanie Rzymu 399.
  - Efekty: konwersja Rzymu na religie panstwowa (`conversion which = 399`), flaga `pope_expelled = yes` (blokuje negatywne konklawe), zysk ze skarbca bazyliki (`treasury = 300`).
  - Relacje z panstwami katolickimi spadaja o -200, katolickie mocarstwa zyskuja permanentny casus belli na ITA.
  - Uruchomienie lancucha uchodzstwa papieza za granice (do Hiszpanii, Austrii lub Francji).

### 5.2. Kolonie, faktorie handlowe i kreolizacja wloska w K
- **Model dwufazowy core'ow zamorskich**:
  - Faza 1: Zalozenie bazy handlowej w K06-K09 (Przyladek, Indie, Malakka, Moluki) nadaje prawny `addcore_claim` oraz buduje manufakture handlowa lub fort.
  - Faza 2: Po 10 latach ciaglego wladania (`ownerchange = { province = X years = 10 }`) oraz obecnosci fortu poziomu 2 odpala sie event wlaczenia faktorii do Ziem Korony, nadajacy pelny core narodowy `addcore_national`.
- **Nawracanie kolonialne**:
  - Wariant katolicki: kolegia jezuickie (3547), bonus misjonarzy (`missionaries = 2`), bezposrednie proby konwersji faktorii (`conversion which = X`).
  - Wariant protestancki: pragmatyczna tolerancja handlowa, brak przymusu wyznaniowego w faktoriach, premia do handlu (`merchants = 6`, `trade = 500`).
- **Wloska kreolizacja osadnicza (Przyladek Dobrej Nadziei)**:
  - Event "Emigracja z przeludnionych komun": zaciag osadnikow z Genui i Neapolu za 75 dukatow.
  - Prowincja afrykanska zyskuje populacje +1000 i przyjmuje kulture wloska (`provinceculture which = X value = italian`).
- **Asymilacja handlowa Azji**:
  - Po skompletowaniu sieci baz w K10 i utrzymaniu pokoju: decyzja asymilacji radzow i elit korzennych nadaje akceptowana kulture handlowa (`add_countryculture which = dravidian / malay`).

## 6. Sciezka I: odrodzenie Cesarstwa Zachodniego

| Etap | Warunki i decyzja | Eventy, alternatywy i efekty |
|---|---|---|
| I01 Renovatio Imperii Occidentalis | C07, stabilnosc >= 2, pokoj, niezaleznosc, koszt 250 | Koronacja swieckiego cesarza; zmiana tagu PAP -> WRE (zatwierdzony nowy tag, wolny od kolizji z ROM). Roma stolica. Tymczasowe uzycie istniejacych tarcz i flag cesarskich/rzymskich (bez ruszania grafik PAP). Stabilnosc -1, nowa dynastia, reakcje HRE/FRA/BYZ. Tytul nie przyznaje automatycznie funkcji cesarza HRE. |
| I02 Italia, serce cesarstwa | Roszczenia do poludnia; wariant wczesny/dojrzaly | Senat doradczy i administracja prowincjonalna albo dominacja arystokracji. Roszczenia regionalne, a core'y narodowe poprzez 10-letnie eventy integracji prowincji. |
| I03 Dwaj cesarze | BYZ istnieje; kontakt dyplomatyczny, nie automatyczna wojna | Wzajemne uznanie, uklad stref albo spor o tytul. Dobre relacje moga otworzyc wspolna polityke przeciw wspolnemu zagrozeniu. |
| I04 Africa Romana | Zintegrowana Italia, flota i srodki; etapowe roszczenia | Pierwszy cel Tunezja/okolice Kartaginy; pozniej dalsze wybrzeze. Po zdobyciu: autonomia miejscowych elit albo kosztowna centralizacja. Corowanie po 10 latach. |
| I05 Hispania | Afrykanski przyczolek i dostep do zachodniego Morza Srodziemnego | Najpierw roszczenia do poludniowego wybrzeza; potem kolejne regiony. CAS/ARG/SPA/POR osobno broni swoich interesow. Corowanie po 10 latach. |
| I06 Gallia | Baza w Ligurii/Piemontcie albo faktyczne opanowanie sasiadujacej Hispanii | Najpierw Prowansja, pozniej kolejne regiony; eventy koalicji francuskiej i cesarskiej. Nie przyznawac roszczen do calej Francji przy koronacji. Corowanie po 10 latach. |
| I07 Prawo cesarskie | Dwa zintegrowane regiony poza Italia, pokoj, koszt 250 | Infra +500, centralizacja +1, opor stanow. Zachowanie lokalnych praw lagodzi niepokoje kosztem dochodow i centralizacji. |
| I08 Konkordat cesarski | Reformacja trwa lub wybuchl spor inwestyturalny | Obrona jednolitosci albo tolerancja polityczna; papiez zachowuje wlasny wybor. Nie utozsamiac buntow religijnych z kazda prowincja innej kultury. |
| I09 Pax Romana Restaurata | Od 1650, zintegrowane 4 regiony (Italia/Afryka/Hispania/Galia), pokoj, stabilnosc >= 2 | Jednorazowo badboy -5, infra +750, trade +500; premie podatkowe w kilku stolicach regionalnych. Obowiazkowy glowny final epoki. |
| I10 Granice dawnego imperium | Opcjonalnie po I09 i rzeczywistym osiagnieciu granic | Brytania i granica renska jako zupelnie opcjonalny epilog i trudna kampania koncowa, nie warunki pierwszego finalu I09. |

### 6.1. Transsaharyjski szlak do Mali i Kraina Zlota w I
- **Odkrywcy Sahary**: Decyzja po opanowaniu Trypolitanii/Numidii budzi rzymskiego konkwistadora Lucio Africano (`wakeleader which = <ID>`) i odkrywa oazy Sahary (`discover which = 1597` Azaouad, `1488` Walata, `1495` Timbuktu, `1490` Bambuk, `1496` Gao).
- **Podporzadkowanie Mali (MAL)**:
  - Wariant A (Provincia Aethiopia Occidentalis): aneksja kopaln zlota Bambuk (1490) i Timbuktu (1495), roszczenia `core_claim`, skarbiec +800 dukatow, inflacja +2%, core narodowy po 10 latach wladania (`ownerchange = 10`).
  - Wariant B (Klientelizm pustynny): wasalizacja Mali (`vassal which = MAL`), wysoki trybut w zlocie, kupcy w CoT w Timbuktu (`merchants = 6`), ochrona przed koczownikami.

### 6.2. Odrodzenie kultury rzymskiej (Romanitas) w I
- **Nowa kultura w Db/cultures.txt**: rejestracja kultury `roman` (`city = BYZ buildings = MIN color = Purple`).
- **Decyzja Lex de Civitate Romana**:
  - Zmiana kultury panstwowej z wloskiej na rzymska (`add_countryculture which = roman`, `remove_countryculture which = italian`).
  - Stolica Rzym oraz kluczowe miasta przeksztalcaja sie w kulture rzymska (`provinceculture which = 399 value = roman`).
  - Cesarstwo zyskuje kultury regionalne jako akceptowane (`add_countryculture which = french / iberian / berber`).
- **Asymilacja prowincjonalna**: Prowincje w Galii, Hiszpanii i Afryce po 30 latach stabilnych rzadow (`ownerchange = 30`), przy obecnosci fortu i braku buntu, moga w drodze eventow asymilacji przyjac kulture `roman`.

### 6.3. Odrodzenie starozytnych wierzen (Cultus Deorum) w I
- **Nowa religia w Db/Religions/religions.txt**:
  - Nazwa kodowa: `roman_pagan` (w lokalizacji: *Cultus Deorum*).
  - Grupa `pagan`, kolor `Gold`, `annexable = no`, `defender = yes` (Pontifex Maximus), `land_morale = 0.15`.
  - Bilans trudnosci: wysoki koszt stabilnosci (`stability_cost = 90.00`, `stability_bonus = -8.00`), kara do badan (`tech_speed = -10.00`), duza roczna liczba misjonarzy (`missionaries = 3.00`), wysoka bazowa szansa nawrocenia (`missionary_placement_chance = 0.55`).
- **Edykt z Palatynu**: Decyzja przywraca politeizm rzymski (`religion which = roman_pagan`), nawraca Rzym (`conversion which = 399`), powoduje kryzys ustrojowy `stability = -5`, wypedza papieza z Rzymu i wywoluje powszechne oburzenie chrzescijanskiej Europy (relacje -200, krucjata papieska).

### 6.4. Rewolucja Republikanska i rzady Konsulow (SPQR) w I
- W schylkowym okresie (lata 1775-1800 lub w czasie kryzysu despotyzmu): bunt Senatu i obywateli rzymskich przeciw autokracji cesarskiej.
- **Res Publica Restituta**:
  - Obalenie tronu: uspiecie monarchow cesarskich (`sleepmonarch`).
  - Wprowadzenie wybieralnych par Konsulow zdefiniowanych w `monarchs_wre.txt` na kadencje 10-letnie (`wakemonarch`).
  - Przesuniecie suwakow wewnetrznych: `domestic which = ARISTOCRACY value = -3`, `domestic which = INNOVATIVE value = 2`, `domestic which = SERFDOM value = -3`.
  - Zmiana ustroju cementuje wolnosc obywatelska i zbliza panstwo do nowozytnych republik.

Nie zakladac zdobycia Konstantynopola, Jerozolimy ani Egiptu jako obowiazkowego warunku odrodzenia Zachodu. To pozwala zachowac odrebnosc od sciezki BYZ i rozgrywac dyplomacje dwoch cesarstw.

## 7. Sukcesja i konklawe

### 7.1. Zasada monarchow

- T: zachowac historycznych papiezy jako monarchow PAP w `monarchs_pap.txt`.
- K: monarchowie w `monarchs_ita.txt`. Przy koronacji w K01 wybor rodu panujacego i aktywacja odpowiedniej galezi (dormant = yes budzone odpowiednim wyborem, przy jednoczesnym uspieciu 12150 `Transition Council`):
  - **Dom Medyceuszy (Medici)**: profil ADM/DIP (mecenat, bankowosc, sojusze).
  - **Dom Sforzow (Sforza/Visconti)**: profil MIL/ADM (kondotierzy, fortyfikacje, twarda reka).
  - **Dom Sabaudzki (Savoia)**: profil MIL/DIP (tradycja wojskowa, ekspansja alpejska).
  - **Dom Colonna**: profil DIP/ADM (powiazania z kuria rzymska, prestiz arystokratyczny).
  - W trakcie XVI, XVII i XVIII w. zaimplementowane eventy kryzysow sukcesyjnych: brak meskiego potomka, walka frakcji, mozliwosc przejscia korony na boczna linie lub regencje.
- I: dynastia Aurelia zdefiniowana w nowym pliku `monarchs_wre.txt` (dla nowego tagu WRE).
- Daty ponizszej tabeli to bazowa os czasu dla linii domyslnej / zarysu chronologicznego:

| Okres | Krol Wloch (zarys bazowy), ADM/DIP/MIL | Cesarz Zachodu, ADM/DIP/MIL | Motyw wydarzen |
|---|---|---|---|
| 1450-1482 | Giovanni I, 6/7/5 | Flavio I, 7/6/6 | Koronacja, kompromis z kuria, pierwszy spor o sukcesje |
| 1482-1515 | Lorenzo I, 5/6/7 | Claudio I, 5/5/8 | Zjednoczenie poludnia, kosztowne wojny |
| 1515-1548 | Francesco I, 7/6/4 | Marco I, 8/6/4 | Zegluga w K; prawo i poczatek reformacji w I |
| 1548-1580 | Carlo I, 7/5/5 | Aurelio I, 5/5/7 | Organizacja kolonii lub prowincji afrykanskich |
| 1580-1612 | Vittorio I, 6/7/6 | Flavio II, 6/4/7 | Kompania indyjska lub wojny hiszpanskie |
| 1612-1645 | Lorenzo II, 4/4/7 | Giuliano I, 4/5/8 | Wojny o przyprawy lub dlugi konflikt w Galii |
| 1645-1678 | Filippo I, 3/5/3 | Claudio II, 3/4/5 | Kryzys finansowy, opor elit i regencja |
| 1678-1710 | Carlo II, 8/6/4 | Marco II, 8/7/4 | Odbudowa skarbu, konsolidacja |
| 1710-1742 | Giovanni II, 6/8/3 | Aurelio II, 6/8/5 | Konkordat, dyplomacja i kompromisy |
| 1742-1774 | Vittorio II, 8/6/5 | Giuliano II, 8/5/5 | Reformy oswieceniowe |
| 1774-1805 | Francesco II, 4/4/6 | Flavio III, 4/3/7 | Rewolucja, cenzura lub ugoda ze stanami |
| 1805-1838 | Lorenzo III, 7/7/5 | Claudio III, 6/6/7 | Konstytucja albo restauracja absolutyzmu |

### 7.1.1. Przywodcy Republiki Rzymskiej (SPQR - Konsulowie, dormant w monarchs_wre.txt)

Jesli w schylkowym okresie (od ok. 1775 r.) panstwo wybierze obalenie tyranii cesarskiej i odrodzenie Republiki (*Res Publica Restituta*):
- Uspienie monarchow cesarskich (`sleepmonarch`).
- Aktywacja wybieralnych par Konsulow pelniacych wladze wykonawcza na 10-letnie kadencje senackie:

| Kadencja | Para Konsulow (Consules Rei Publicae) | Statystyki ADM/DIP/MIL | Motyw okresu |
|---|---|---|---|
| 1780-1790 | Consules Marco Valerio & Lucio Cornelio | 7/8/6 | Proklamacja Republiki, kompromis z arystokracja i plebsem |
| 1790-1800 | Consules Caio Gracco & Quinto Fabio | 8/6/7 | Reformy agrarne, zbrojna obrona Republiki przed monarchiami |
| 1800-1815 | Consules Giulio Cesare II & Marco Bruto | 6/6/8 | Wojny rewolucyjne i napoleonskie, obrona granic na Renie |
| 1815-1838 | Consules Scipione Africano & Lucio Aurelio | 7/7/7 | Konsolidacja pokoju, nowoczesne prawa rzymskie i oswiecenie |

### 7.2. Habemus Papam w K i I

- Jednorazowy event dla kazdego kolejnego uznanego konklawe, po wyborze swieckiej sciezki.
- Bazowy efekt wymagany przez uzytkownika: stabilnosc +1. Przy stabilnosci 3 brak nagrody zastepczej.
- Papiez wymieniany w nazwie/opisie; zadne `wakemonarch` nie zmienia swieckiego monarchy.
- Punktem wyjscia sa historyczne wybory i daty z monarchow PAP; po alternatywnej zmianie kalendarza wymagany osobny projekt.
- Przy poznej koronacji przyszle konklawe dzialaja normalnie; minione nie sa odtwarzane po zmianie tagu.
- Wybor papieza nie tworzy nowego armijnego leadera "monarch" dla ITA/cesarstwa.
- Spor o kandydata to osobny event polityczny; nie pozwala farmic kolejnych bonusow stabilnosci.
- Stara sciezka PAP nie moze automatycznie odtworzyc osobnego panstwa w Rzymie. Reguly restytucji papiestwa wymagaja przegladu zaleznosci.

## 8. Liderzy wojskowi i morscy

Statystyki: movement/fire/shock/siege. Dla admiralow i odkrywcow siege = 0. Rank i lokalizacja wymagaja osobnego doboru. Okna sluzby sa propozycjami, nie rozkazem zmiany istniejacych wpisow.

### 8.1. Istniejacy liderzy i historyczni kandydaci

| Lider | Status i okres | Rola w projekcie |
|---|---|---|
| Muzio Sforza | Juz w PAP, 1421-1424 | Wspolny etap; zachowac wpis i sprawdzic istniejece eventy, bez dodawania kopii |
| Gattamelata | Juz w PAP | Wspolna armia kondotierska; uzyc aktualnych dat i statystyk po przegladzie calego wpisu |
| Cesare Borgia | Juz w PAP, dormant, 1497-1504 | Event "Miecz Borgiow" moze udostepnic go teokracji, ale kosztem relacji i oporu rodow; nie powielac aktywacji |
| Julius II | Juz w PAP, leader typu monarch, 1503-1513 | Tylko teokracja; w K/I papiez nie dowodzi jako swiecki monarcha |
| M. Colonna | Juz w PAP, admiral 1550-1575 | Obrona Morza Srodziemnego w T; transfer do K/I dopiero po weryfikacji mechaniki, nigdy drugi rownolegly wpis |
| Giovanni delle Bande Nere | Juz w PAP, 1516-1522 | Istniejacy kondotier; warunki alternatywnej sluzby uzgodnic z pozostalymi panstwami |
| Gil Alvarez de Albornoz | Nowy kandydat historyczny, 1353-1367 | General 3/1/2/1; kampania legatow i odbudowa wladzy PAP; dodanie wymaga sprawdzenia globalnych duplikatow |
| Giovanni Vitelleschi | Nowy kandydat historyczny, 1431-1440 | General 3/1/3/1; sprawny, ale politycznie niebezpieczny kardynal; osobny event konfliktu z kuria |

Nie przedluzac zycia historycznych postaci tylko dlatego, ze gracz pozno wykonal decyzje. Nie dopisywac kopii istniejacych leaderow do ITA bez weryfikacji przejscia tagu, aktywnych liderow i globalnej przestrzeni ID.

### 8.2. Nowi liderzy teokracji [wszyscy fikcyjni]

| Lider | Okno | Typ i statystyki | Odblokowanie / funkcja |
|---|---|---|---|
| Paolo di Viterbo | 1545-1565 | general 3/2/3/1 | Obrona wloskiego rdzenia po soborze; nie nagroda za represje |
| Andrea del Porto | 1580-1600 | admiral 3/3/2/0 | Decyzja ochrony zeglugi przed korsarzami |
| Matteo Albani | 1625-1645 | general 2/3/3/1 | Reorganizacja armii po dlugiej wojnie religijnej |
| Carlo dei Legati | 1700-1720 | general 3/3/2/1 | Szkolenie wojsk panstwa koscielnego |
| Pietro di Ancona | 1795-1815 | general 3/3/3/1 | Obrona przeciw inwazji rewolucyjnej, gdy rzeczywiscie wystapi |

### 8.3. Nowi liderzy Krolestwa [wszyscy fikcyjni]

| Lider | Okno | Typ i statystyki | Odblokowanie / funkcja |
|---|---|---|---|
| Alessandro della Concordia | 1480-1500 | general 3/2/4/1 | K03, kampania poludniowa |
| Niccolo da Lerici | 1505-1520 | explorer 4/1/1/0 | K05, pierwszy etap zeglugi; finansowanie jednorazowe |
| Tommaso di Savona | 1535-1550 | explorer 4/2/1/0 | Druga wyprawa dla pozniejszego gracza; nie darmowe wskrzeszenie Niccola |
| Matteo del Capo | 1560-1580 | conquistador 3/2/2/0 | Wlasna baza afrykanska, rozpoznanie zaplecza kolonii |
| Andrea Malaspina | 1585-1605 | explorer 4/2/2/0 | K07, Ocean Indyjski |
| Giulio delle Spezie | 1610-1630 | admiral 3/3/3/0 | K08/K09, ochrona szlaku przypraw |
| Cesare Valdieri | 1630-1650 | general 3/3/3/1 | Wojny o porty; nie jednoczesny darmowy desant |
| Lorenzo di Porto Reale | 1680-1700 | admiral 4/3/3/0 | Obrona sieci kompanii po K10 |
| Vittorio Ligure | 1740-1760 | admiral 3/4/3/0 | Modernizacja floty |
| Carlo Ventimiglia | 1795-1815 | general 4/3/4/1 | Wojny rewolucyjne i obrona metropolii |

### 8.4. Nowi liderzy Cesarstwa [wszyscy fikcyjni]

| Lider | Okno | Typ i statystyki | Odblokowanie / funkcja |
|---|---|---|---|
| Lucio Orsini | 1480-1500 | general 3/2/4/1 | I02, zjednoczenie Italii |
| Marco di Ostia | 1510-1530 | admiral 3/2/3/0 | Finansowana flota afrykanska |
| Lucio Africano | 1520-1545 | conquistador 3/2/3/0 | 6.1, Odkrywca Sahary i szlaku do Mali |
| Giulio di Ravenna | 1540-1560 | general 3/3/3/1 | I04, zdobywanie miast Afryki |
| Aulo Severi | 1580-1600 | general 4/3/4/1 | I05, kampania hiszpanska |
| Flavio di Narbona | 1620-1640 | general 3/4/3/1 | I06, wojny galijskie |
| Claudio Valerio | 1660-1680 | general 3/3/3/2 | Kosztowna szkola inzynierii oblezniczej |
| Aurelio del Tirreno | 1690-1710 | admiral 4/3/3/0 | Kontrola zachodniego Morza Srodziemnego |
| Marco Aureliani | 1740-1760 | general 3/4/3/1 | Reforma armii prowincjonalnej |
| Giuliano Ferrati | 1795-1815 | general 4/4/4/1 | Obrona cesarstwa w wojnach rewolucyjnych; jedyny pozny wyraznie silny dowodca |

### 8.5. Ograniczenia balansu liderow

- Liderzy zwykle 2-4 w podstawowych statystykach; siege 2 rzadki, brak rutynowych liderow 5/5/5.
- Pojawienie sie leadera powiazac z finansowaniem, reforma albo etapem kampanii. Nie kazdy event flavor przyznaje generala.
- Pokrywajace sie okna kilku leaderow sa dozwolone; ich role sa rozne, ale nie tworzyc jednorazowej puli kilkunastu dowodcow.
- Odkrywcy maja ograniczone okna, z pozniejszymi alternatywnymi wyprawami dla opoznionej sciezki. Brak nieograniczonego odnawiania leadera.
- Przed implementacja sprawdzic obsluge dormant/zyjacych liderow w FTG oraz aktualne wpisy PAP/ITA i dostepne ID.

## 9. Wydarzenia flavor

Kazdy ponizszy event jest propozycja. Historyczne inspiracje sa oznaczone; wystapienie i skutki w alternatywnej sciezce nie sa twierdzeniem historycznym. Domyslnie jednorazowe, z warunkiem posiadania miasta albo wykonania odpowiedniej reformy.

### 9.1. Wspolne i ponadustrojowe

| Event | Warunki / inspiracja | Wybor i skala efektow |
|---|---|---|
| Archiwa Lateranu | Roma wlasna, po C01 | Koszt 40 za infra +100 albo oszczednosc bez bonusu |
| Kondotierzy przed bramami | Okres 1350-1450, toczy sie wojna w Italii | Kontrakt za 75 i ograniczony zaciag albo odmowa; lider tylko jesli jego osobne warunki sa spelnione |
| Dzwony pojednanego soboru | Faktyczne zakonczenie schizmy | Stabilnosc +1 jednorazowo, bez duplikowania istniejacej nagrody |
| Drukarnie nad Tybrem | Od 1470, Roma i pokoj | Patronat za 60: infra +150; cenzura: bardziej restrykcyjna polityka, bez tego samego bonusu |
| Marmury dawnego Rzymu | Roma, od 1450 | Ochrona zabytkow za 50 albo uzycie materialu do tanszej budowy; ma?y efekt ekonomiczny, bez core'ow |
| Mistrzowie perspektywy | Wlasna Firenze lub Roma, 1450-1550 | Mecenat za 75 i drobny rozwoj infrastruktury; konkurencja lokalnych warsztatow |
| Kamienice i fontanny | Rozwinieta stolica, pokoj | Koszt 80 za podatek +1 w stolicy, maksymalnie raz |
| Wylew Tybru | Roma, ustalone jednorazowe okno poznego okresu | Dora?na pomoc kosztuje 50; nowa infrastruktura 100 lagodzi skutki, zamiast darmowego rozwoju |

### 9.2. Teokracja

| Event | Warunki / inspiracja | Wybor i skala efektow |
|---|---|---|
| Biblioteka Watykanska | Inspiracja historyczna, po reformie kurii | Koszt 100, infra +200; zamkniety zbior albo szerszy dostep uczonych |
| Gwardia szwajcarska | Inspiracja historyczna, po 1506, dobry kontakt z HEL | Kontrakt za 75, niewielki zaciag w stolicy; bez magicznej stalej premii do wszystkich wojsk |
| Nepot papieza | T, nowy pontyfikat, brak reformy kurii | Faworyzowanie rodu daje pieniadze i opor innych elit; profesjonalna nominacja kosztuje, lecz wspiera administracje |
| Spory o kalendarz | Inspiracja reformy gregorianskiej, od 1582 | Reforma za 50, infra +100; czesc panstw uznaje ja w osobnych reakcjach |
| Misje poza Europa | Po T06, kontakt z panstwem kolonialnym | Dotacja 75, misjonarze +1 i poprawa relacji z partnerem; brak darmowych kolonii PAP |
| Astronom przed trybunalem | XVII wiek, restrykcyjna polityka doktrynalna | Ochrona badan lub proces; alternatywne skutki administracyjne i dyplomatyczne, bez wymuszania historycznej osoby |
| Jubileusz w Rzymie | Jeden wybrany jubileusz, pokoj i stabilna stolica | Przychod 50 albo przeznaczenie go na pomoc ubogim z mala poprawa stabilnosci |

### 9.3. Krolestwo i oceany

| Event | Warunki / inspiracja | Wybor i skala efektow |
|---|---|---|
| Genue?czycy czy Wenecjanie? | K04 | Jeden kontrakt z flota handlowa: trade +150, koszt 75, poprawa relacji z wybranym istniejacym partnerem |
| Liny, zagiel i suchary | Przed pierwsza wyprawa | Koszt 40 za naval +100; niedofinansowanie nie przyznaje leadera na identycznych warunkach |
| Ogrody Przyladka | Wlasna rzeczywista kolonia afrykanska | Osadnictwo za 60: population +300 lub kolonisci +1, po sprawdzeniu limitow dla kolonii |
| Tlumacze Oceanu Indyjskiego | Po K07, wlasny port | Koszt 40, dyplomaci +1 i trade +100; lokalny kontrakt zamiast wymuszonej konwersji |
| Mapy monsunow | Po azjatyckiej wyprawie | Naval +150 za 50; nie traktowac flavor jako automatycznego odkrycia wszystkich wod azjatyckich |
| Zapach gozdzikow | Pierwsza rzeczywista baza na wyspach przypraw | Handel krolewski lub koncesja kupiecka; jednorazowy maly przychod, nie coroczna renta z eventu |
| List z faktorii | Siec K10 i konflikt z lokalnym wladca | Ratowac faktorie za 100 lub negocjowac; wojna wymaga jawnego dodatkowego wyboru |
| Proces rady kompanii | Po kryzysie finansowym | Audyt kosztuje 100 i poprawia infra; sprzedaz urzedow daje 100, ale pogarsza stabilnosc |

### 9.4. Cesarstwo

| Event | Warunki / inspiracja | Wybor i skala efektow |
|---|---|---|
| Senat nowego Rzymu | I02 | Rada prowincji albo rada rodow; inne skutki centralizacji i relacji elit |
| Nowe prawo, stare przywileje | I07 | Wdrozenie za 100, infra +200 i czasowy opor; kompromis bez tej samej premii |
| Granary Afryki | Zintegrowana ziemia rolnicza Afryki | Koszt 100, podatek +1 w jednej wlasnej prowincji; nie w nieposiadanej dawnej prowincji rzymskiej |
| List basileusa | BYZ istnieje, po I03 | Uznanie tytulow poprawia wzajemne relacje; odmowa rozpoczyna spor dyplomatyczny, nie natychmiastowa wojne |
| Luki triumfalne | Po zakonczonej duzej kampanii, pokoj | Monument za 100 albo pomoc weteranom za 75; drobne efekty, nie drugie badboy -5 |
| Drogi miedzy prowincjami | I07, zintegrowane dwa regiony | Koszt 150, infra +300; brak nieistniejacego modyfikatora predkosci wszystkich armii |
| Miejscowy prawnik, rzymski urzad | Nowo zintegrowana Galia/Hispania | Awans miejscowych elit lagodzi opor; monopol Italii wzmacnia centralizacje, ale wywoluje niepokoje |
| Orzel na nowym sztandarze | I09 | Nazwa i opis ceremonii; naval lub land research +100 za 50, bez wymuszonej zmiany wszystkich grafik |
| Weterani i opuszczone gospodarstwa | Po duzej wojnie | Osadnictwo za 80, niewielka populacja w jednej wlasnej prowincji; nie tworzy nowej kolonii |

## 10. Kryzysy, reakcje i koniec kampanii

- Koalicja wloska: po nadaniu roszczen, nie dopiero po calkowitej aneksji przeciwnikow. Uczestnicy moga odmowic.
- Spory konklawe: mozliwe w K/I przy ingerencji swieckiego wladcy; oddzielne od rutynowego +1 stabilnosci.
- Kryzys kompanii: jeden glowny event i zakonczona flaga rozwiazania, nie persistentny lancuch farmienia pieniedzy.
- Kryzys cesarski: oslabiona sukcesja + duzy zasieg panstwa; ugoda prowincjonalna, regencja lub represje, z realnymi kosztami.
- Wojny rewolucyjne: reakcja na faktyczna rewolucje/zagrozenie i wojne, nie automatyczne napady w 1795 niezaleznie od swiata.
- Final ustrojowy 1805-1838: konstytucja lub restauracja. Nie odblokowuje ponownie wyboru T/K/I.
- Utrata rdzenia: event ostrzegawczy i wstrzymanie nowych integracji. Nie usuwac automatycznie wszystkich dotychczasowych nagrod.
- Utrata wszystkich kolonii/regionow: brak kolejnych nagrod gospodarczych; historia wykonanych decyzji pozostaje historia.

### 10.1. Reakcje i wydarzenia dla panstw osciennych

Wszystkie kluczowe zwroty akcji w Italii wywoluja dedykowane lancuchy reakcji u sasiadow:

#### 1. Hiszpania (SPA) / Aragonia (ARG):
- **Papiez blaga o schronienie w Madrycie** (po wygnaniu papieza z Rzymu w K lub I):
  - *Opcja A (Nowe Panstwo Koscielne na Balearach)*: SPA oddaje Baleary prowincja 821 pod tag PAP (`cedeprovince which = PAP value = 821`), wasalizuje PAP (`vassal which = PAP`) i zawiera sojusz (`alliance which = PAP`). Tytul Najwierniejszego Obroncy Wiary (`vp = 200`, `stability = 1`), zaciag krzyzowcow i permanentny casus belli na okupanta Rzymu.
  - *Opcja B (Tylko azyl dworski)*: papiez rezyduje w Madrycie/Escorialu bez suwerennego terytorium.
  - *Opcja C (Odmowa)*: papiez zmuszony jest szukac schronienia w Austrii.
- **Wojna o poludniowe krolestwa**: reakcja na roszczenia ITA/WRE do Neapolu i Sycylii – hiszpanska mobilizacja floty i obrona posiadlosci aragonskich.
- **Widmo Cezara w Iberii**: reakcja na inwazje WRE w Katalonii i Andaluzji – koalicja hiszpansko-portugalska w obronie polwyspu.

#### 2. Austria (HAB) i Cesarstwo Niemieckie (HRE):
- **Papiez u bram Wiednia** (gdy Hiszpania odmowi przyjecia):
  - *Opcja A (Nowy Rzym w Alpach)*: oddanie Salzburga/Karyntii pod odrodzony tag PAP pod protektoratem Habsburgow.
  - *Opcja B (Dotacja finansowa)*: pomoc bez terytorium, odeslanie do Francji.
- **Spór Dwóch Cesarzy Zachodu**: po koronacji w I01 cesarz rzymsko-niemiecki w Wiedniu odmawia uznania tytulu wladcy WRE; casus belli, napiecia graniczne w Tyrolu i Lombardii.
- **Swieta Liga Przeciwko Antychrystowi**: jesli WRE przyjmie wiare `roman_pagan`, Habsburgowie staja na czele koalicji wszystkich niemieckich panstw (katolickich i protestanckich) w celu obrony chrzestu Europy.

#### 3. Francja (FRA):
- **Drugi Awignon** (gdy Hiszpania i Austria odmowia):
  - Odtworzenie suwerennego Papiestwa w Awinionie (prowincja 406 Provence/Rhone) jako francuskiego klienta (`cedeprovince which = PAP value = 406`, `vassal which = PAP`).
- **Obrona Galii**: w wypadku inwazji WRE na poludniowa Francje – edykt powszechnej obrony ojczyzny, mobilizacja arystokracji i armii krolewskiej przeciw rzymskim legionom.
- **Sojusz z protestanckim Krolestwem Wloch**: jesli Francja jest pod rzadami hugenotow/protestantow – dyplomatyczne przymierze parysko-rzymskie przeciwko Habsburgom.

#### 4. Cesarstwo Bizantyjskie (BYZ):
- **Traktat w Rawennie (Uklad Dwoch Cesarstw)**: po koronacji WRE, jesli Konstantynopol istnieje:
  - *Opcja A (Renesansowe uznanie braterstwa cesarstw)*: podzial stref (Zachod dla WRE, Wschod dla BYZ), sojusz (`alliance which = WRE`), poparcie dyplomatyczne (`relation = 150`).
  - *Opcja B (Jedyny prawowity Basileus)*: odrzucenie zachodnich uzurpatorow, spor o tytuly.
- **Szok Ortodoksji**: po odrodzeniu kultu `roman_pagan` w Rzymie – patriarcha Konstantynopola potepia powrot poganstwa, spadek relacji do -150, lecz zachowanie pragmatycznego rozejmu morskiego.

#### 5. Imperium Osmanskie (TUR) i panstwa Maghrebu (MOR, TUN, TRI):
- **Dżihad w obronie Maghrebu**: po inwazji WRE na Kartagine/Trypolis – wladcy berberyjscy jednocza sily, korsarze z Algieru i Trypolisu atakuja zegluge WRE.
- **Flota Kapudana Paszy**: interwencja floty osmanskiej w obronie polnocnoafrykanskich emirato?w przeciwko rzymskiej dominacji na Morzu Srodziemnym.

#### 6. Krolestwo Mali i Songhaj (MAL / SON):
- **Biale Legiony zza Piaskow**: reakcja na przybycie rzymskich odkrywcow i armii do Timbuktu.
  - *Opcja A (Zgoda na protektorat)*: Mali akceptuje wasalizacje w zamian za ochrone przed koczownikami pustynnymi i zbyt na zloto.
  - *Opcja B (Swieta wojna o Bambuk)*: mobilizacja wojsk krolestwa i obrona kopaln zlota.

#### 7. Portugalia (POR):
- **Rywalizacja o Przyladek i Indie**: reakcja na pojawienie sie wloskich ekspedycji oceanicznych w Afryce i na Oceanie Indyjskim.
  - *Opcja A (Uklad w Lizbonie)*: rozgraniczenie stref faktorii z Krolestwem Wloch, wolny handel w portach.
  - *Opcja B (Wojna o monopol przypraw)*: zbrojne starcia flot o kontrole nad szlakiem do Malakki i Goa.

## 11. Integracja z istniejacym modem i alokacja zasobow

- [Monarchowie PAP](../Db/Monarchs/monarchs_pap.txt): daty pontyfikatow i konklawe dla eventow Habemus Papam.
- [Monarchowie ITA](../Db/Monarchs/monarchs_ita.txt): dopisanie rodow krolewskich (Medyceusze, Sforza, Sabaudia, Colonna) oraz kryzysow sukcesyjnych; uspienie Transition Council (12150) przy koronacji.
- [Monarchowie WRE](../Db/Monarchs/monarchs_wre.txt): nowy dedykowany plik dla cesarzy zachodnich (dynastia Aurelia).
- [Liderzy PAP](../Db/Leaders/leaders_pap.txt) i [liderzy ITA](../Db/Leaders/leaders_ita.txt): ponowne uzycie wpisow, audyt dormant i przejscia tagu; ewentualny plik liderow WRE.
- [Kraje](../Db/countries.txt): rejestracja nowego tagu `WRE` (Western Roman Empire), uzycie istniejacych tarcz i flag cesarskich/rzymskich (np. zestawu rzymskiego), bez ruszania zasobow graficznych PAP.
- [Decyzje](../Db/Decisions/papal.txt): nowy plik decyzji z zakresem ID **7000-7099** (najwyzsze istniejace ID w modzie to 6107).
- [Eventy](../Db/Events/papal_alt.txt): nowy plik eventow z zakresem ID **296150+** (bezpieczny odstep ponad 120 wolnych ID po ostatnim istniejacym evencie 296023).
- [Religie](../Db/Religions/religions_special.txt): uwzglednienie faktu, ze PAP ma regule `no_dynastic`, dlatego zmiana tagu na ITA/WRE jest konieczna dla relacji malzenskich swieckich dynastii.
- [Loader eventow](../Db/events.txt): zarejestrowanie nowych plikow:
  `decision = "db\decisions\papal.txt"`
  `event = "db\events\papal_alt.txt"`
- [Major PAP](../Db/Events/major_pap.txt): bazylika 3546, jezuici 3547, inkwizycja 3548 oraz Liga Swieta 3549 zachowuja bramki sciezkowe.
- [Country forming](../Db/Decisions/country_forming.txt): standardowa decyzja formowania ITA nie koliduje z dedykowana sciezka papieska.
- [Analiza warunkowania czasowego](PAP_decisions_time_analysis.md): szczegolowa specyfikacja techniczna triggerow czasowych silnika FTG.
- [Kultury](../Db/cultures.txt): definicja nowej kultury `roman`.
- [Religie](../Db/Religions/religions.txt): definicja nowej religii `roman_pagan` (Cultus Deorum).

## 12. Ustalenia i decyzje zatwierdzone z uzytkownikiem

1. **Wymagania czasowe przed i po dacie (warianty decyzji)**:
   - Zastosowanie rozbicia na decyzje wczesne i dojrzale. Wariant wczesny (przed 1450) posiada restrykcyjne wymagania (wyzsza stabilnosc, wiekszy skarb, surowsze warunki dyplomatyczne).
   - Wariant dojrzaly (od 1450) lagodzi progi prowincjonalne do okolo 70-80% wymaganych ziem (warunek `someof`), tak aby gra nie wymagala sztucznie 100% ziem i nie blokowala rozwoju przez pojedyncza prowincje.
2. **Wybor rodow i kryzysy dynastyczne dla Krolestwa Wloch (ITA)**:
   - W momencie koronacji w K01 gracz wybiera wiodacy rod panujacy sposrod czołowych domow wloskich (Medyceusze, Sforzowie, Sabaudowie, Colonna), z ktorych kazdy ma unikalny profil cech ADM/DIP/MIL.
   - W kolejnych stuleciach (XVI, XVII, XVIII w.) wprowadzono zawirowania dynastyczne i kryzysy sukcesyjne (brak meskiego potomka, spory rodow, wojny sukcesyjne, mozliwosc zmiany linii lub regencji).
3. **Nowy tag dla Cesarstwa Zachodniego (WRE)**:
   - Zatwierdzono utworzenie nowego tagu `WRE` (Western Roman Empire), co calkowicie eliminuje konflikt z zajetym tagiem `ROM` (Romagna).
   - Tymczasowo przypisany zostaje istniejacy zestaw flag i tarcz cesarskich/rzymskich, pozostawiajac grafiki PAP w stanie nienaruszonym.
4. **Status Papiestwa i mechanika religijna**:
   - W oparciu o analize `religions_special.txt` potwierdzono, ze tag PAP posiada zablokowane malzenstwa krolewskie (`no_dynastic`). Dlatego zmiana tagu na ITA oraz WRE jest niezbedna dla swieckich monarchii.
   - Papiestwo pozostaje instytucja duchowa w Rzymie (brak oddzielnego panstwa PAP na mapie w sciezkach K/I); zmiane papiezy obsluguja periodyczne eventy konklawe `Habemus Papam` dajace +1 stabilnosci.
5. **Integracja prowincji i warunkowanie czasowe (zgoda uzytkownika z rekomendacjami)**:
   - Uzytkownik formalnie zatwierdzil rekomendacje techniczne zawarte w dokumencie [PAP_decisions_time_analysis.md](PAP_decisions_time_analysis.md):
     - **Integracja prowincjonalna**: bezwzgledne uzycie w 100% natywnych triggerow silnika FTG `ownerchange = { province = <ID> years = 10 }` oraz `controlchange = { province = <ID> years = 10 }` dla eventow nadajacych pelny core (`addcore_national`).
     - **Uplyw czasu miedzy decyzjami**: stosowanie metody staged flags (decyzja A -> flaga -> event posredni z parametrem `offset` -> flaga dojrzalosci -> odblokowanie decyzji B) lub `ownerchange` na kluczowej stolicy prowincjonalnej.
6. **Harmonogram konklawe**:
   - Konklawe odpala sie periodycznie zgodnie z historycznymi datami pontyfikatow z `monarchs_pap.txt`.
7. **Zasieg finalu cesarskiego (WRE)**:
   - Glowny final epoki (*Pax Romana Restaurata*, I09) wymaga 4 zintegrowanych regionow: Italia, Afryka Romana, Hispania i Gallia.
   - Granice renska i Brytania (I10) stanowia zupelnie opcjonalny epilog kampanii.
8. **Alokacja ID**:
   - Decyzje: pula **7000-7099** w `Db/Decisions/papal.txt`.
   - Eventy: pula **296150+** w `Db/Events/papal_alt.txt` (ponad 120 wolnych ID odstepu po 296023).
   - Monarchowie: `monarchs_ita.txt` dla ITA oraz `monarchs_wre.txt` dla WRE.
9. **Alternatywne sciezki religijne**:
   - **Dla ITA**: Wloska Reformacja (sekularyzacja), konklawe jako wrog wewnetrzny (anathema), decyzja Expulsio Papae i odrodzenie tagu PAP na uchodzstwie (Hiszpania na Balearach, Austria w Alpach, Francja w Awinionie).
   - **Dla WRE**: Odrodzenie starozytnych wierzen rzymskich (*Cultus Deorum* / `roman_pagan`), cesarz jako Pontifex Maximus, krucjata panstw chrzescijanskich.
10. **Mechanika kolonialna i zamorska ITA**:
    - Dwufazowe corowanie faktorii: prawny claim handlowy (`addcore_claim`), a po 10 latach rzadow (`ownerchange = 10`) pelny core narodowy (`addcore_national`).
    - Wloska kreolizacja osadnicza na Przyladku Dobrej Nadziei (emigracja z Genui/Neapolu -> populacja +1000 i kultura `italian`).
    - Asymilacja azjatyckich kultur handlowych (`dravidian` / `malay`).
11. **Podboj Sahary, kultura rzymska i Konsulowie WRE**:
    - Transsaharyjski marsz na Mali: odkrycie oaz Sahary (1597, 1488, 1495, 1490, 1496), konkwistador Lucio Africano, podboj kopaln zlota Bambuk lub trybut handlowy.
    - Odrodzenie kultury rzymskiej (*Lex de Civitate Romana*): kultura `roman`, romanizacja prowincji, akceptacja kultur regionalnych.
    - Res Publica Restituta: obalenie tyrana, ustrzemienie cesarzy i powolanie Konsulow Senatu i Ludu Rzymskiego (SPQR) z relatywnymi przesunieciami suwakow ku wolnosciom obywatelskim.
12. **Zgodnosc ze specyfikacja silnika FTG**:
    - Wycofanie fikcyjnych/nieistniejacych komend i zastapienie ich w 100% natywnymi komendami FTG: `missionaries = 2`, `merchants = 6`, `trade = 500`, relatywne przesuniecia `domestic`, `wakeleader`, `discover`, `cedeprovince`, `vassal`, `alliance`, `add_countryculture`, `provinceculture`, `ownerchange = 10`.

## 13. Etapy wdrozenia i walidacja

1. **Etap A (Infrastruktura techniczna)**:
   - Utworzenie pliku decyzji `Db/Decisions/papal.txt` (ID 7000+) i pliku eventow `Db/Events/papal_alt.txt` (ID 296150+).
   - Rejestracja obu plikow w `Db/events.txt`.
   - Rejestracja nowego tagu `WRE` w `Db/countries.txt` i przypisanie zestawu graficznego tarcz/flag.
   - Definicja kultury `roman` w `Db/cultures.txt` oraz nowej religii `roman_pagan` w `Db/Religions/religions.txt`.
2. **Etap B (Wspolny etap C01-C07)**:
   - Implementacja decyzji C01-C06 z wariantami wczesnymi (przed 1450) oraz dojrzalymi (od 1450, 70-80% via `someof`).
   - Implementacja eventu C07 ("Miecz i tiara") odblokowujacego trzy sciezki ustrojowe oraz eventow reakcji mocarstw osciennych.
3. **Etap C (Sciezka T - Teokracja)**:
   - Decyzje T01-T09 dla tagu PAP, powiazanie z bazylika i kryzysem reformacji.
4. **Etap D (Sciezka K - Krolestwo Wloch ITA)**:
   - Koronacja w K01 z wyborem rodu (Medyceusze, Sforza, Sabaudia, Colonna), uspienie Transition Council.
   - Monarchowie w `monarchs_ita.txt` i lancuchy kryzysow sukcesyjnych (XVI-XVIII w.).
   - Eventy konklawe `Habemus Papam` w Rzymie.
   - Sciezka Wloskiej Reformacji: sekularyzacja, anathema z konklawe, decyzja `Expulsio Papae` oraz uchodzstwo papieza za granice (odrodzenie PAP w SPA/HAB/FRA).
   - Kompania zamorska: dwufazowe corowanie faktorii, wloska kreolizacja Przyladka oraz asymilacja kultur azjatyckich.
5. **Etap E (Sciezka I - Cesarstwo Zachodnie WRE)**:
   - Koronacja w I01, monarchowie w `monarchs_wre.txt`, uklad dyplomatyczny z BYZ.
   - Decyzje integracji 4 glownych regionow i final Pax Romana Restaurata.
   - Wyprawa transsaharyjska do Mali (odkrycie oaz, konkwistador Lucio Africano, podboj kopaln Bambuk lub trybut).
   - Odrodzenie kultury rzymskiej (*Lex de Civitate Romana*) i provincjalna romanizacja.
   - Przywrocenie politeizmu (*Cultus Deorum* / `roman_pagan`) i reakcja chrzescijanskiej Europy.
   - Schylkowa Republika (*Res Publica Restituta*): wybieralni Konsulowie SPQR (1780-1838) w `monarchs_wre.txt`.
6. **Etap F (Reakcje sasiadow, 10-letnia integracja prowincji i liderzy)**:
   - Implementacja lancuchow reakcji sasiadow z Sekcji 10.1 (SPA, HAB, FRA, BYZ, TUR/TUN/TRI, MAL/SON, POR).
   - Generowanie eventow prowincjonalnych integracji (sprawdzanie 10 lat stabilnego wladania `ownerchange = 10` -> `addcore_national`).
   - Rejestracja i implementacja liderow wojskowych, morskich i odkrywcow (w tym Lucio Africano).
7. **Etap G (Flavor i walidacja)**:
   - Wydarzenia kulturalne, architektoniczne i gospodarcze.
   - Weryfikacja skladniowa i parserem nawiasow, poprawnosci tagow, brak duplikatow ID i rejestracja zmian w `Work Folder/CHANGELOG_events.txt`.