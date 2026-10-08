# Instrukcje dla Copilota (Gloriana_1337)

## Jêzyk i komunikacja

- Odpowiadaj po polsku, krótko i konkretnie.
- Przy zmianach podawaj: co zmieniono, gdzie i po co.

## Zakres zmian

- Wprowadzaj tylko zmiany wymagane przez polecenie u¿ytkownika.
- Nie refaktoryzuj ani nie porz¹dkuj niepowi¹zanych plików.
- Zachowuj styl i format istniej¹cych plików moda FTG.

## Pliki i struktura moda

- Priorytetowo traktuj foldery: `AI/`, `Db/`, `Scenarios/`, `Localisation/`.
- Nie zmieniaj formatów plików gry ani separatorów u¿ywanych w istniej¹cych danych.
- Nie dodawaj nowych zale¿noœci ani narzêdzi buildowych bez wyraŸnej proœby.

## Bezpieczeñstwo zmian

- Przed edycj¹ sprawdzaj istniej¹c¹ zawartoœæ pliku.
- Dla wiêkszych modyfikacji proponuj ma³e, ³atwe do cofniêcia kroki.
- Jeœli wymaganie jest niejednoznaczne, zadawaj krótkie pytanie doprecyzowuj¹ce.

## Walidacja

- Po zmianach sprawdzaj, czy nie ma literówek w tagach, identyfikatorach i nazwach plików.
- Nie zmieniaj identyfikatorów eventów, leaderów, monarchów i krajów bez wyraŸnego polecenia.

## Eventy FTG - zasady pisania (Commands & Triggers)

- Traktuj w¹tek „Commands and triggers list” (Third Angel, pierwsze posty) jako g³ówne Ÿród³o sk³adni eventów FTG.
- W eventach u¿ywaj tylko komend i triggerów potwierdzonych w tej liœcie; przy niepewnoœci sprawdzaj istniej¹ce eventy moda.

### Minimalny wzorzec eventu

- Buduj eventy w klasycznym uk³adzie FTG: `trigger` -> `date/offset/deathdate` -> `action_a/b/...` -> `command`.
- Ka¿dy `command` zapisuj pe³n¹ sk³adni¹: `command = { type = ... which = ... value = ... }` (pola tylko gdy wymagane).
- Zachowuj czytelnoœæ: jeden efekt na jedn¹ liniê, bez mieszania niepowi¹zanych efektów w jednej akcji.

### Kluczowe komendy, które stosowaæ najpierw

- Dyplomacja i pañstwo: `relation`, `casusbelli`, `war`, `alliance`, `vassal`, `breakvassal`, `inherit`, `annex`, `independence`, `country`, `religion`, `technology`, `treasury`, `stability`, `inflation`, `domestic`.
- Prowincje: `addcore_national`, `addcore_claim`, `addcore_casusbelli`, `removecore_*`, `population`, `populationpercent`, `tax`, `manufactory`, `fortress`, `provincereligion`, `provinceculture`, `goods`, `cot`.
- Wojsko i zasoby: `INF`, `CAV`, `ART`, `manpower`, `diplomats`, `merchants`, `colonists`, `missionaries`.
- Sterowanie logik¹: `setflag`, `clrflag`, `trigger`, `sleepevent`, `ai`.

### Kluczowe triggery, które stosowaæ najpierw

- Dyplomacja: `war`, `alliance`, `vassal`, `dynastic`, `relation`, `truce`, `atwar`, `neighbour`.
- Stan kraju: `exists`, `event`, `flag`, `year`, `stability`, `badboy`, `treasury`, `inflation`, `ai`.
- Prowincje: `owned`, `control`, `provinceculture`, `provincereligion`, `core_national`, `core_claim`, `core_casusbelli`, `city`, `colony`, `cot`, `fortresslevel`.
- Logika: `AND`, `OR`, `NOT`, `someof`, `random`, oraz warunki w kontekœcie innego tagu: `TAG = { ... }`.

### Zasady praktyczne z FTG 1.3+

- Dopuszczaj `trigger` nie tylko na poziomie eventu, ale te¿ na poziomie `action` i pojedynczego `command`.
- `persistent = yes` stosuj tylko gdy event ma móc odpalaæ siê wielokrotnie do `deathdate`.
- `random = x` traktuj jako procent szansy przy ka¿dym sprawdzeniu eventu.
- `offset` wp³ywa na pierwsze sprawdzenie po `startdate`; kolejne sprawdzenia s¹ cykliczne wg mechaniki FTG.
- Dla `which`/`value` z losowaniem pamiêtaj o wartoœciach specjalnych (np. `-1` random, `-2` capital, `-3` last_random, `-4` random_distinct, `-5` random_not_capital; dla krajów tak¿e m.in. `-6` emperor).

### Ograniczenia i ostro¿noœæ

- Nie u¿ywaj `breakdynastic` jako pewnej komendy (w¹tek wskazuje problemy z dzia³aniem).
- Przy komendach na leaderach/monarchach zak³adaj ograniczenia stanu „¿yj¹cy/dormant” i weryfikuj efekt w praktyce.
- Przy komendach demograficznych (np. `populationpercent`) zak³adaj limity silnika dla miast/kolonii.
- Nie zgaduj nazw triggerów/komend z EU2/EU3 - u¿ywaj dok³adnie nazw z FTG.

### Standard pracy przy nowych eventach

- Najpierw wybierz logikê triggerów, potem dopiero efekty (`command`).
- Dla trudnych warunków preferuj ma³e eventy ³¹czone przez `trigger` zamiast jednego bardzo z³o¿onego.
- Gdy to mo¿liwe, opieraj warunki o `flag`/`event`, ¿eby unikn¹æ niezamierzonego wielokrotnego odpalenia.
- Po ka¿dej zmianie w eventach sprawdzaj zgodnoœæ tagów/prowincji i spójnoœæ zakresu dat.

## Decyzje FTG - zasady pisania (Readme Decisions)

- Traktuj `Db/Decisions/Readme.txt` (MichaelM) jako Ÿród³o zasad dla sk³adni i logiki decyzji.
- Decyzje i eventy nie wspó³dziel¹ przestrzeni ID: `id` decyzji musi byæ unikalne tylko wœród decyzji.

### Minimalny wzorzec decyzji

- Buduj decyzjê jako: `decision` -> `id` -> `major/persistent/unique` -> `name/desc` -> `potential` -> `trigger` -> `ai_trigger` -> `action`.
- W decyzji dopuszczalne jest tylko jedno `action`.
- W `action` u¿ywaj standardowych komend eventowych (`command = { type = ... }`).

### Znaczenie kluczowych pól

- `major = yes`: decyzja ma notifier i wyró¿nienie w UI, gdy `potential` jest spe³nione.
- `persistent = yes`: decyzja nie trafia do historii kraju po wykonaniu (mo¿e wymagaæ flag, by unikn¹æ natychmiastowego ponowienia).
- `unique = yes`: decyzja globalnie jednorazowa (po wykonaniu niedostêpna dla wszystkich krajów).
- `potential`: warunki widocznoœci na liœcie decyzji.
- `trigger`: warunki natychmiastowego wykonania (wraz z `potential`).
- `ai_trigger`: dodatkowe warunki wymagane, by AI mog³o wykonaæ decyzjê.

### Historia decyzji i triggery scenariusza

- W scenariuszach u¿ywaj `decisionhistory = { ... }` z wpisami `unique = { ... }` i listami per tag kraju.
- Sprawdzanie wykonania decyzji: `decision = <id>`.
- Sprawdzanie wykonania decyzji przez konkretny kraj: `decision = { country = <tag> data = <id> }`.
- Dla `country` w triggerze decyzji dopuszczaj wartoœci specjalne: `-1/this`, `-2/overlord`, `-6/emperor`.

### Zasady praktyczne dla decyzji

- Przy `persistent = yes` preferuj kontrolê przez `flag`, by unikn¹æ zapêtleñ AI.
- Komendy losowe (`which = -1` i podobne) traktuj jako rozstrzygane dopiero przy wykonaniu decyzji.- W bloku `someof = { }` u?ywaj **`number`** jako podklucza (np. `someof = { number = 2 ... }`), nigdy `value` — `value` jest b??dem sk?adniowym FTG.- Zachowuj identyczny styl formatowania jak w istniej¹cych plikach decyzji moda.

### Potential vs trigger - praktyka

- `potential` traktuj jako warunki widocznoœci decyzji w UI (kto mo¿e j¹ widzieæ i kiedy).
- Do `potential` dawaj warunki „sta³e” i filtruj¹ce listê: `tag`, `exists`/`NOT exists`, zakres lat (`year = X`, `NOT = { year = Y }`), wzajemne wykluczenia (`flag`/`decision`).
- `trigger` traktuj jako warunki wykonania „tu i teraz”; umieszczaj tam wymagania sytuacyjne: `atwar`, `isvassal`, `stability`, `religion`, `owned`, `control`, `someof`.
- `ai_trigger` stosuj jako dodatkowy filtr tylko dla AI; nie zastêpuje `potential` ani `trigger`.
- Przy decyzjach alternatywnych/konkurencyjnych blokuj ponowne lub równoleg³e wykonanie przez `flag` ustawian¹ w `action`.
- Dla ograniczeñ czasowych preferuj umieszczenie ich w `potential` (kontrola widocznoœci), a w `trigger` dodawaj tylko gdy ma to znaczenie gameplayowe dla samego wykonania.

## Zasady ogólne edycji plików eventów i decyzji

- Je?eli dana komenda lub linijka okazuje si? zb?dna, **nie usuwaj jej — zakomentuj** (poprzed? znakiem `#`). Usuwanie tylko na wyra?ne polecenie u?ytkownika.

## Changelog zmian w eventach i decyzjach (obowi?zkowy)

- Po ka?dej edycji w plikach eventów lub decyzji dopisujesz wpis do changeloga w pliku `Work Folder/CHANGELOG_events.txt`.
- `CHANGELOG_events.txt` jest utrzymywany wy??cznie w j?zyku angielskim.
- Changelog nie ma numeracji wersji — ka?da zmiana to osobny wpis z dat?.
- Format wpisów:
  - **Zmiana linijki w evencie:** `[data] Event <ID eventu> (<plik>): zmieniono lini? „<stara tre??>" ? „<nowa tre??>". Powód: <krótki opis>.`
  - **Dodanie linijki/komendy:** `[data] Event <ID eventu> (<plik>): dodano komend?/lini? „<tre??>". Powód: <krótki opis>.`
  - **Przekszta?cenie eventu w decyzj?:** `[data] Event <ID eventu> (<plik>) ? Decyzja <ID decyzji> (<plik decyzji>). Powód: <krótki opis>.`
- Nie pomijaj changeloga przy ?adnej iteracji zmieniaj?cej plik eventu lub decyzji.

## Przekszta?canie eventów w decyzje

- Przed przekszta?ceniem eventu w decyzj? sprawd?, czy dany event by? **triggerem innych eventów** (szukaj `trigger = { event = <ID> }` w ca?ym modzie). Je?li tak — zast?p te triggery flag?: w przekszta?canym evencie/decyzji dodaj `setflag`, a w eventach zale?nych zamie? `event = <ID>` na `flag = <nazwa_flagi>`.
- Przed przekszta?ceniem sprawd?, czy dany event by? **wywo?ywany przez inne eventy lub decyzje** (szukaj `sleepevent`, `event = <ID>` w `command`). Uwzgl?dnij te zale?no?ci jako warunki w `potential` lub `trigger` nowej decyzji (np. przez flag? ustawian? przez wywo?uj?cy event).
- Je?eli event mia? `startdate` — przenie? ograniczenie daty do `potential` (np. `year = X`, `NOT = { year = Y }`).
- Je?eli event mia? w `trigger` prowincje wymagane do jego wywo?ania:
  - Wszystkie wymagane prowincje umie?? w `trigger` (twarda blokada wykonania).
  - W `potential` dodaj konstrukcj? `someof`, obejmuj?c? rozs?dn? cz??? tych prowincji (np. po?ow? lub kluczowe), tak by decyzja by?a widoczna zanim gracz spe?ni wszystkie warunki, ale nie za wcze?nie.
