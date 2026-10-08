# MAM & EGY: Cztery Sciezki Renesansu Nilu (1337–1838)

Data: 2026-10-08.
Status: szczegolowy projekt alternatywnej historii dla Mamelukow i Egiptu.
Tagi: `MAM` (Mamelukowie), `EGY` (Egipt / Nowe Panstwo Ptolemeuszy).
Horyzont czasowy: 1337–1838.

---

## 1. Kontekst historyczny i punkt zwrotny (1337–1348)

W 1337 roku Egiptem i Lewantem rzadzi sułtan **An-Nasir Muhammad** (jego trzecie, zlote panowanie). W Kairze kwitnie architektura i handel ze swiatem srodziemnomorskim, lecz fundamenty panstwa sa smiertelnie chore:
- **Kasta mamelucka**: niewolnicy-wojownicy z Kaukazu i Kipczaku tworza zamknieta oligarchie wojskowa, gardzaca rdzennymi fellahami (arabska wiekszoscia) i Koptami (rdzenna ludnoscia chrzescijanska).
- **Stagnacja i rozpad**: w 1341 r. sułtan umiera (istniejacy juz w modzie event `112000 Death of al-Nasir` w [Db/Events/mameluks.txt](file:///d:/Steam/steamapps/common/For%20The%20Glory/Mods/Gloriana_1337/Db/Events/mameluks.txt)). Frakcje Kipczakow i Czerkiesow rzucaja sie sobie do gardel, a Czarna Smierc (1348) dziesiatkuje Kair.
- **Punkt zwrotny**: Gracz moze podtrzymac feudalny marazm mamelukow LUB dokonac rewolucyjnej reformy panstwa – obalic kaste wojskowa, zintegrowac ludnosc rodzima i skierowac Egipt ku nowej epoce.

---

## 2. Wspolny etap reformy ustrojowej: Zmierzch Kasty Mameluckiej

### Event 112001: Czystka w Cytadeli Kairskiej (ok. 1345–1360)
*Nastepstwo eventu 112000 (wybor B: "Try to stop the chaos!")*.

Gracz gromadzi wierne oddzialy gwardii, fellahow oraz miejskie elity Kairu i decyduje sie na fizyczna likwidacje zrewoltowanych emirów mameluckich:
- **Opcja A (Krwawy przewrot i emancypacja rodzima)**:
  - Likwidacja przywilejow wojskowych niewolnikow.
  - Skutki: wybuch rebelii w Damaszku i Aleksandrii (`revolt`), wstrzas ustrojowy (`stability = -4`).
  - Zysk ze skonfiskowanych skarbow emirów (`treasury = 500`).
  - Reformy spoleczne: `domestic which = ARISTOCRACY value = -3`, `domestic which = SERFDOM value = -3`, `domestic which = CENTRALIZATION value = 2`.
  - Integracja rdzennej ludnosci: dodanie kultury panstwowej `coptic` obok `arabic`.
  - Odblokowanie wyboru sciezki przyszlosci panstwa.
- **Opcja B (Kompromis z emirami)**:
  - Historyczna sciezka stagnacji burdzyjskiej (Mamelukowie Czerkiescy).
  - Brak reform, podtrzymanie dominacji kasty mameluckiej.

---

## 3. Sciezka Nowych Ptolemeuszy (Tag EGY): Zwrot ku Morzu Srodziemnemu

Gracz porzuca tradycyjny kairski ladowy militaryzm i wzorujac sie na starozytnej dynastii Ptolemeuszy przeksztalca Egipt w srodziemnomorska talasokracje.

| Krok | Decyzja / Event | Warunki silnika FTG | Skutki mechaniczne |
|---|---|---|---|
| **E01** | **Koronacja w Aleksandrii** | Pokoj, stabilnosc >= 2, posiadanie prowincji 744 (Alexandria) | Zmiana tagu: `country which = EGY`. Przeniesienie stolicy: `capital which = 744`. Uspienie monarchow MAM, aktywacja dynastii Nowych Ptolemeuszy w `monarchs_egy.txt`. Flaga `egy_ptolemaic = yes`. |
| **E02** | **Odbudowa Latarni na Faros** | Alexandria (744), skarbiec >= 150 | `treasury = -150`, `infra = 300`, `trade = 200`. Prowincja 744 zyskuje stocznie (`shipyard`) i port o statusie metropolii. |
| **E03** | **Nowa Biblioteka Aleksandryjska** | Pokoj, innowacyjnosc >= 5, 200 dukatow | `treasury = -200`, `tech_speed = 10.00`, `domestic which = INNOVATIVE value = 2`. Naplyw uczonych greckich, wloskich i zydowskich. |
| **E04** | **Pradawny Kanal Faraonow (Suez)** | Alexandria, Delta i Kair w pelni kontrolowane, technologia infra >= 3 | `treasury = -350`, `inflation = 2`. Polaczenie Nilu z Morzem Czerwonym: natychmiastowe utworzenie CoT w Delcie/Suezie, odkrycie szlaku ku Morzu Czerwonemu i Oceanowi Indyjskiemu. |
| **E05** | **Talasokracja Wschodniego Srodziemnomorza** | Posiadanie Cypru (484) lub Krety (480), flota >= 40 galer | `naval = 500`, claimy na wyspy Morza Egejskiego i wybrzeza Lewantu. Rywalizacja z Wenecja i Genua o handel lewantynski. |

---

## 4. Sciezka Religijna A: Odrodzenie Starozytnego Egiptu (Kemet / Cultus Aegypti)

Radykalna, w 100% alternatywna sciezka wskrzeszenia dawnych wierzen politeistycznych nad Nilem.

### 4.1. Definicja religii w Db/Religions/religions.txt
```
religion = {
	name = "egyptian_pagan"
	group = "pagan"
	color = "DarkYellow"
	tech_speed = -10.00
	stability_cost = 100.00
	stability_bonus = -10.00
	missionary_placement_chance = 0.50
	missionaries = 3.00
	global_tax_modifier = 20
	land_morale = 0.20
	defender = yes
	annexable = no
}
```

### 4.2. Edykt z Memfis: Powrot Zywiacego Horusa
- **Wymogi**: Sciezka EGY, brak wasalizacji, innowacyjnosc wysoka lub bunt przeciw ulemom, rok >= 1370.
- **Efekty**:
  - Wladca oglasza sie **Faraonem – Synem Ra**: `religion which = egyptian_pagan`.
  - Konwersja religijna stolicy (Aleksandria 744) oraz Delty (745).
  - Szok spoleczny: `stability = -5`, liczne powstania islamskie w Kairze i Damaszku (`revolt`).
  - Monumentalna architektura: decyzje *Odnowienie Piramid w Gizie*, *Swiatynie w Karnaku i Luksorze*, *Swieto Opet*.
- **Reakcja Swiata Islamskiego**:
  - Utrata kontroli nad Mekka i Medyna (emiry Hedżazu wypowiadaja posluszenstwo).
  - Powszechny Dżihad ogłoszony przez Damaszek, Bagdad i Turkow Osmańskich: permanenty casus belli przeciwko apostacie na tronie Faraonow!

---

## 5. Sciezka Religijna B: Racjonalistyczna Reforma Islamu (Mu'tazilizm)

Oparta na historycznym nurcie racjonalizmu muzułmanskiego (szkola *Mu'tazila*, popularna za Kalifatu Abbasydow w IX w.).

### 5.1. Zalozenia doktrynalne
- Prymat rozumu (*'aql*) w interpretacji Koranu i teologii.
- Odrzucenie scislego fatalizmu na rzecz wolnej woli czlowieka (*qadar*).
- Zgoda na nauki scisle, anatomie, astronomie i tlumaczenie dziel starozytnych filozofow.

### 5.2. Definicja religii w Db/Religions/religions.txt
```
religion = {
	name = "mutazilite"
	group = "muslim"
	color = "LightGreen"
	tech_speed = 15.00
	stability_cost = 60.00
	stability_bonus = 0.00
	missionary_placement_chance = 0.35
	missionaries = 1.00
	trade_efficiency = 10
	production_efficiency = 10
	annexable = no
}
```

### 5.3. Edykt Rozumu i Zloty Wiek Nauki w Kairze
- **Wymogi**: Religia sunnicka, wladca o cesze ADM >= 7, innowacyjnosc >= 6.
- **Efekty**:
  - Przejscie panstwa na `mutazilite`.
  - Potezny skok innowacyjnosci: `domestic which = INNOVATIVE value = 3`, bonus badawczy `infra = 500`, `trade = 500`.
  - Pelen pokoj religijny z poddanymi chrzescijanskimi i zydowskimi (brak kar za roznice wyznaniowe w prowincjach).
- **Konflikt wewnetrzny**:
  - Konserwatywni ulemowie aszaryccy i beduini oskarżaja sułtana o herezje – bunty fundamentalistow (`religiousrevolt`).
  - Rozwoj medycyny, kartografii i uniwersytetow (Al-Azhar przeksztalcony w akademie nauk scislych) wyprzedza renesans europejski o ponad 100 lat!

---

## 6. Reakcje Mocarstw Osciennych

1. **Imperium Osmanskie (TUR)**:
   - Zaniepokojenie potega nowego Egiptu; proby podbicia Syrii i zablokowania egipskich wplywow w Lewancie.
   - W przypadku Kemetu (`egyptian_pagan`) – Osmanowie mianuja sie zbrojnym ramieniem islamu majacym zniszczyc Faraona.
2. **Republika Wenecka (VEN) i Genua (GEN)**:
   - W sciezce ptolemejskiej: wielkie traktaty handlowe w Aleksandrii lub krwawe wojny o dominacje nad szlakami przypraw.
3. **Etiopia (ETH)**:
   - Wspolnota wyznaniowa z Koptami aleksandryjskimi; sojusz chrzescjan poludnia z ptolemejskim Egiptem i zabezpieczenie zrodel Nilu.
4. **Kalifat / Persja (ABB / PER)**:
   - Reakcja na reforme mu'tazilicka: czesc perskich uczonych emigruje do Kairu, co tworzy nowa os kultury wschodu.

---

## 7. Alokacja ID i Integracja Techniczna

- **Decyzje**: Zakres ID **7100–7149** w pliku `Db/Decisions/egypt.txt`.
- **Eventy**: Zakres ID **112001–112099** w pliku `Db/Events/mameluks.txt` (bezposrednia kontynuacja po wolnym ID 112001).
- **Monarchowie**:
  - `monarchs_egy.txt` – zaadaptowanie zarezerwowanego zakresu ID **12010–12025** dla dynastii Nowych Ptolemeuszy.
- **Tag**: `EGY` (juz obecny w `Db/countries.txt`, kolor DarkBlue).
