# Trzy Zapomniane Potegi: Celci, Etiopia i Korea (1337–1838)

Data: 2026-10-08.
Status: szczegolowy projekt alternatywnej historii dla Wysp Celtyckich, Cesarstwa Etiopii oraz Krolestwa Korei.
Horyzont czasowy: 1337–1838.

---

# CZESC I: UNIA CELTYCKA (SCO / WLS / IRE) – Odrodzenie Narodow Brytanii

## 1. Kontekst historyczny i punkt wyjscia (1337–1415)

W 1337 roku Edward III Plantagenet rozpoczyna Wojne Stuletnia we Francji, drenujac finanse i garnizony angielskie z Wysp Brytyjskich. Stwarza to idealna, historyczna okazje dla ludow celtyckich:
- **Szkocja (SCO)**: rzadzi mlody Dawid II Bruce (syn wyzwoliciela Roberta Bruce'a); sojusz *Auld Alliance* z Francja wiaze sily angielskie.
- **Walia (WLS)**: w pamieci Walijczykow wciaz zyje krew ksiazat Gwynedd (Llywelyna); w 1400 r. wybuchnie wielkie powstanie **Owaina Glyndŵra**, ktory oglosi sie suwerennym Ksieciem Walii. W modzie istnieje juz przygotowana pula monarchow: `monarchs.WLS = 12280-12294`!
- **Irlandia (EIR / ULS, CON, MST, LEI)**: klanowi krolowie irlandzcy wypieraja anglo-normanskich osadnikow; wladza Anglii kurczy sie do malenkiego skrawka wokol Dublina (*The Pale*). W modzie istnieje plik [Db/Events/Celtic.txt](file:///d:/Steam/steamapps/common/For%20The%20Glory/Mods/Gloriana_1337/Db/Events/Celtic.txt) oraz [Db/Events/OAJF_celt.txt](file:///d:/Steam/steamapps/common/For%20The%20Glory/Mods/Gloriana_1337/Db/Events/OAJF_celt.txt).

```
                      [WOJNA STULETNIA (1337)]
                     Anglia angazuje sie we Francji
                                    │
               ┌────────────────────┼────────────────────┐
               ▼                    ▼                    ▼
       [SZKOCJA (SCO)]         [WALIA (WLS)]      [IRLANDIA (EIR)]
       Dawid II Bruce          Owain Glyndŵr      Klanowi Krolowie
       Odzyskanie granicy      Ksiestwo Walii     Upadek Pale (Dublina)
               │                    │                    │
               └────────────────────┼────────────────────┘
                                    │
                  [TRAKTAT W CAERNARFON / EDYNBURGU]
                 Konfederacja Trzech Narodow Celtyckich
                                    │
                  [ZJEDNOCZONE KROLESTWO CELTYCKIE]
                 - Kultury: gaelic, welsh, breton
                 - Wypchniecie Plantagenetow z Brytanii
                 - Redukcja Anglii do malego Wessex
```

## 2. Tabela Decyzji i Eventow Celtyckich

| ID / Kod | Nazwa | Wymogi silnika FTG | Skutki mechaniczne |
|---|---|---|---|
| **C01** | **Koronacja Owaina Glyndŵra** | Tag WLS, rok >= 1400, powstanie w Walii (243) | Niepodleglosc Walii (`country which = WLS`), aktywacja monarchow w `monarchs_wls.txt`. Sojusz z FRA i SCO. Casus belli na Anglie. |
| **C02** | **Oczyszczenie Irlandzkiego Pale** | Posiadanie Meath (233 / Dublin), brak wasalizacji od ENG | Likwidacja angielskiej administracji kolonialnej. Proklamacja Wysokiego Krola Irlandii (*Ard Rí na hÉireann*) pod tagiem `EIR`. |
| **C03** | **Pakt w Caernarfon (Auld Alliance 2.0)** | Istnienie SCO, WLS i EIR; brak wojen miedzy nimi; wojna z ENG | Wzajemny sojusz obronny i wojskowy (`alliance`), wzajemne relacje +150. Francja przysyla zloto (`treasury = 300`) i posilki. |
| **C04** | **Unia Koron Celtyckich (Alba, Cymru, Éire)** | Kontrola nad Szkocja (236-239), Walia (243) i Irlandia (231-235); pokoj, stabilnosc >= 2 | Zjednoczenie w jedno panstwo pod wybranym tagiem (np. SCO lub EIR). Kultury panstwowe: `gaelic`, `welsh` oraz opcjonalnie `breton` (Bretania). Stolica w Edynburgu lub Dublinie. |
| **C05** | **Marsz na Londyn (Bitwa o Brytanie)** | Zjednoczeni Celci, posiadanie Yorkshire (245) i Marches (242) | Przelamanie oporu Anglikow. Zdobycie Londynu (247), cede prowincji celtyckich: Kornwalia (249), Kumbria (241), Northumberland (240). |
| **C06** | **Restauracja Brytanii Artura** | Kontrola nad wiekszoscia Wysp Brytyjskich | Anglia zepchnieta do malego krolestwa Wessex. Celtycka renesansowa kultura jezykowa, nowa flota atlantycka dominujaca szlaki do Ameryki Polnocnej. |

---

# CZESC II: CESARSTWO ETIOPII (ETH) – Krolestwo Ksieza Jana i Poludniowa Krucjata

## 1. Kontekst historyczny i punkt wyjscia (1337–1468)

W 1337 roku na tronie w gorskich twierdzach Abisynii zasiada potężny cesarz **Amda Seyon I** (1314–1344) – najwybitniejszy wladca wojenny dynastii salomonskiej. Rozbija on muzulmanskie emiraty Ifat i Adal, tworzac fundamenty pod zlote panowanie cesarza **Zara Yaqoba** (1434–1468):
- **Wschodnie chrzescijanstwo**: Etiopia wyznaje ortodoksyjny monofizytyzm koptyjski (`religion = orthodox`).
- **Mit Ksieza Jana (*Prester John*)**: W Europie trwa poszukiwanie legendarnego chrzecijanskiego krola zorientowanego za liniami islamu. W plikach moda istnieje juz event [Db/Events/major_eth.txt](file:///d:/Steam/steamapps/common/For%20The%20Glory/Mods/Gloriana_1337/Db/Events/major_eth.txt) (event 5302).
- **Punkt zwrotny**: Zamiast zamykac sie w gorskiej izolacji przed najazdami Ahmada Grana, Etiopia buduje flote, opanowuje Morze Czerwone i wyprowadza uderzenie w dol Nilu i na Synaj!

```
                  [CESARSTWO SALOMONSKIE (1337)]
                     Cesarz Amda Seyon I w Aksum
                                   │
              [DECYZJA: OTWARTIE WROT MORZA CZERWONEGO]
              - Zdobycie portow Massawa i Zeila
              - Budowa stoczni na wyspach Dahlak
                                   │
              ┌────────────────────┴────────────────────┐
              ▼                                         ▼
   [SOJUSZ PRESTER JOHNA]                     [POŁUDNIOWA KRUCJATA]
   - Misja dyplomatyczna do Rzymu/Wenecji     - Marsz w dol Nilu (Nubia)
   - Odlewnicy armat z Europy                 - Desant na polwysep Synaj
   - Europejska bron palna                    - Wyzwolenie Jerozolimy
              │                                         │
              └────────────────────┬────────────────────┘
                                   │
                    [RESTAURACJA CESARSTWA AKSUM]
                 Talasokracja Morza Czerwonego i Rogu
```

## 2. Tabela Decyzji i Eventow Etiopskich

| ID / Kod | Nazwa | Wymogi silnika FTG | Skutki mechaniczne |
|---|---|---|---|
| **E01** | **Wrota Morza Czerwonego (Port Massawa)** | Kontrola prowincji nadmorskiej (np. 753 / Massawa), 150 dukatow | Budowa stoczni (`shipyard`) i portu handlowego. `naval = 300`, odkrycie szlakow Morza Czerwonego i Adenu. |
| **E02** | **Blokada Bab al-Mandab (Twierdza w Adenie)** | Posiadanie Massawy, flota >= 15 galer, rok >= 1380 | Opanowanie ciesniny Aden (prowincja 500 / Aden). Nalozenie cel na handel z Indiami: `trade = 400`, coroczny skarb +15 dukatow. |
| **E03** | **Poselstwo Ksieza Jana do Europy** | Pokoj, kontakt z WEN/BYZ/POR/PAP (nawiazanie do eventu 5302) | Przybycie wloskich i portugalskich inzynierow: `infra = 500`, przejscie z lancy na wczesna bron palna (`land = 400`, kompanie muszkieterow gwardii cesarskiej). |
| **E04** | **Reconquista Nubii (W dol Nilu)** | Wojna z Mamelukami lub ich upadek, armia >= 20000 | Odbicie dawnych chrzecijanskich krolestw Nubii (Dongola 750, Batn al-Hajar). Dodanie kultury `nubian` jako kultury panstwowej. |
| **E05** | **Poludniowa Krucjata ku Synajowi** | Kontrola nad Nubia i Morzem Czerwonym, rok >= 1450 | Desant na Synaj (746) i marsz na Judeę (490 / Jerozolima). Wyzwolenie Grobu Panskiego od poludnia! |
| **E06** | **Imperium Aksumicko-Salomonskie** | Posiadanie Jerozolimy, Synaju, Adenu i Aksum | Tytul Obroncy Chrzescjan Wschodu (`defender = yes`, `vp = 250`). Sojusz ze swiatem zachodnim, dominacja nad Oceanem Indyjskim. |

---

# CZESC III: KROLESTWO KOREI (KOR) – Oswiecenie Joseon i Pancerne Zolwie

## 1. Kontekst historyczny i punkt wyjscia (1337–1450)

W 1337 roku Korea znajduje sie u schylku dynastii Goryeo, cierpiac od dominacji mongolskiej dynastii Yuan. W 1392 r. general **Yi Seong-gye** dokonuje przewrotu i zaklada dynastie Joseon, przenoszac stolice do Hanseongu (Seulu).
- **Zloty Wiek Krola Sejonga (1418–1450)**: Sejong Wielki dokonuje jednej z najwiekszych rewolucji naukowych epoki przednowozytnej:
  * Wynalezienie i wdrozenie alfabetu narodowego **Hangul** (event [Db/Events/major_kor.txt](file:///d:/Steam/steamapps/common/For%20The%20Glory/Mods/Gloriana_1337/Db/Events/major_kor.txt) ID 3890),
  * Ruchoma czcionka drukarska 200 lat przed Gutenbergiem,
  * Rewolucja w astronomii, medycynie i zegarach wodnych.
- **Rewolucja morska admirała Yi**: Historycznie pancerne okręty ze stalowym dachem (*Geobukseon* – Okrety Zolwie, event 3891) powstaly w 1592 r. do odparcia inwazji Hideyoshiego. Gracz moze wdrozyc je **150 lat wczesniej**!
- **Wielki Marsz na Polnoc**: Wykorzystanie upadku Mongołow do wskrzeszenia dawnego krolestwa Goguryeo i podboju Mandzurii.

```
                   [1337: SCHYŁEK GORYEO POD JOGIEM YUAN]
                                     │
                   [1392: NARODZINY DYNASTII JOSEON (SEUL)]
                                     │
                 [1418-1450: ERA SEJONGA WIELKIEGO]
                 - Instytut Medrcow (Jiphyeonjeon)
                 - Alfabet Hangul i ruchoma czcionka
                 - Deszczomierze i astronomia cesarska
                                     │
               ┌─────────────────────┴─────────────────────┐
               ▼                                           ▼
   [GEOBUKSEON: OKRETY ZOLWIE (1430)]         [REKONKWISTA GOGURYEO]
   - Pancerne lodzie z armatami               - Przekroczenie rzeki Yalu
   - Monopol na Morzu Zoltym                  - Podboj Mandzurii i Dzurzenow
   - Odparcie piratow Wōkō                    - Granica na rzece Amur
               │                                           │
               └─────────────────────┬─────────────────────┘
                                     │
                     [MORSKIE IMPERIUM WSCHODU]
                  Kontrola nad szlakami handlu z Japonia
```

## 2. Tabela Decyzji i Eventow Korei

| ID / Kod | Nazwa | Wymogi silnika FTG | Skutki mechaniczne |
|---|---|---|---|
| **K01** | **Instytut Medrcow (Jiphyeonjeon)** | Seul (642), wladca ADM >= 7, rok >= 1420 | Utworzenie akademii nauk krolewskich: `infra = 500`, `tech_speed = 15.00`, `domestic which = INNOVATIVE value = 3`. |
| **K02** | **Alfabet Hangul dla Ludu** | Event 3890 (adaptacja i rozwiniecie) | `domestic which = SERFDOM value = -2`, `provincetax which = 642 value = 2`, zniesienie analfabetyzmu, spadek inflacji. |
| **K03** | **Wczesne Okręty Żółwie (Geobukseon 1430)** | Porty na poludniu (641 / Pusan), technologia naval >= 2, 200 dukatow | Rewolucja stoczniowa 150 lat przed czasem! `naval = 600`, budowa 10 pancernych okretow `Geobukseon` z dzialami brazowymi. Monopol morski nad ciesnina Tsushima. |
| **K04** | **Zniszczenie Baz Piratow Wōkō** | Posiadanie floty wojennej po K03, rok >= 1435 | Karna ekspedycja na bazy pirackie na wyspie Tsushima i wybrzezach Kiusiu. Spadek piractwa do zera, wzrost dochodow z handlu (`trade = 300`). |
| **K05** | **Rekonkwista Goguryeo (Marsz za Rzeke Yalu)** | Upadek dynastii Yuan w Chinach (ok. 1368) lub kryzys Ming | Decyzja wojenna: roszczenia do poludniowej Mandzurii (prowincje 636, 637, 638). Pokonanie koczownikow Dżurdżenow, wlaczenie kultury `manchu`. |
| **K06** | **Złoty Wiek Półwyspu i Mandżurii** | Zintegrowana Mandzuria i Korea, pokoj, stabilnosc 3 | Granica cesarstwa na rzece Amur. Korea jako niezalezne mocarstwo naukowo-militarne, nieuznajace zwierzchnictwa Pekinu ani Kioto. |

---

# CZESC IV: Integracja Techniczna i Alokacja Zasobow

Wszystkie trzy moduly wykorzystuja zarezerwowane i wolne pule identyfikatorow:

| Moduł | Plik decyzji | Zakres ID decyzji | Plik eventow | Zakres ID eventow |
|---|---|---|---|---|
| **Celci (SCO/WLS/IRE)** | `Db/Decisions/celtic.txt` | **7300–7349** | `Db/Events/celtic_alt.txt` | **120686–120699** (kontynuacja po `Celtic.txt`) |
| **Etiopia (ETH)** | `Db/Decisions/ethiopia.txt` | **7350–7399** | `Db/Events/ethiopia_alt.txt` | **5303–5350** (kontynuacja po `major_eth.txt`) |
| **Korea (KOR)** | `Db/Decisions/korea.txt` | **7400–7449** | `Db/Events/korea_alt.txt` | **3892–3950** (kontynuacja po `major_kor.txt`) |

Wszystkie mechaniki (przesuniecia suwakow `domestic`, przeskoki grup technologicznych `techgroup`, budowa unikalnych flot i armii oraz integracje kulturowe) sa w 100% natywne dla silnika FTG 1.3.
