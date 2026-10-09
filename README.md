# Gloriana 1337: Alternate Destinies

An expansive alternate history total conversion module and framework for the **Gloriana 1337** mod on the **For The Glory (Engine 1.3)** platform.

---

## Overview

**Gloriana 1337: Alternate Destinies** expands the 1337 late-medieval start date into a rich, dynamic sandbox spanning 1337 to 1837. Designed with a modular **"Clean Overlay"** architecture, the project provides branching historical trajectories, deep economic modernizations, ideological and religious reformations, and period-authentic flavor across Eurasia, Africa, and the Americas.

The mod is fully integrated into a dedicated scenario:
- **`1337 - Alternate Destinies`**: Features our expanded nations prominently on the scenario selection screen, with full access to all alternate trees, decision matrices, events, and dynamic leader lists.
- The original vanilla scenario (**`1337 - The Storm Breaks`**) remains 100% intact and untouched.

---

## Global Statistics & Content Matrix

All content strictly utilizes collision-free ID allocation ranges within the global FTG 1.3 engine database. Every file conforms to 100% ASCII/Latin-1 encoding with zero unescaped characters or broken bracket blocks.

| Module / Nation | Primary Tag(s) | Decisions | Events | Leaders | Custom Monarchs | Primary Historical Themes |
|:---|:---|:---:|:---:|:---:|:---:|:---|
| **1. Byzantine Empire** | `BYZ` | 25 | 11 | Vanilla | Vanilla | Imperial Reconquista, Justinianic borders, Senate restoration, Greco-Roman navy |
| **2. Papal States & Central Italy** | `PAP` | 43 | 63 | 19 | Vanilla | Return to Rome, Egidian Constitutions, Catholic Theocracy, 31 Historical Conclaves |
| **3. Kingdom of Italy & SPQR** | `ITA`, `WRE` | 44 | 37 | 41 | 16 | Milan/Florence/Venice/Naples unifications, Western Roman Empire, Consuls of SPQR |
| **4. Mameluks & Ptolemaic Egypt** | `MAM`, `EGY` | 37 | 28 | 28 | 26 | Coptic emancipation, Ptolemaic thalassocracy, Kemetic revival, Mu'tazilite science |
| **5. Hanseatic League** | `HSA` | 12 | 15 | 10 | Vanilla | Grosser Hansetag, Sound Toll, Baltic grain monopoly, North Sea trade empire |
| **6. Pre-Columbian Americas** | `AZT`, `INC` | 13 | 18 | 16 | Vanilla | Iron & gunpowder adaptation, Nezahualcoyotl reform, Qhapaq Nan, trans-Pacific routes |
| **7. Celtic Union** | `SCO`, `WLS`, `EIR` | 7 | 17 | 8 | Vanilla | Glyndwr's revolt, liberation of Dublin, Arthurian crown vs Federal Celtic Council |
| **8. Solomonic Ethiopia** | `ETH` | 12 | 11 | 8 | Vanilla | Red Sea thalassocracy, Prester John embassy, liberation of Jerusalem, Axum revival |
| **9. Joseon Kingdom of Korea** | `KOR` | 6 | 8 | 16 | Vanilla | Hangul alphabet, early Geobukseon Turtle Ships, Hwacha artillery, Manchurian reconquest |
| **10. Mali Empire** | `MAL` | 20 | 15 | 8 | Vanilla | Trans-Saharan gold monopolies, Timbuktu university, Mansa Musa wealth, Atlantic fleet |
| **11. Great Zimbabwe** | `ZIM` | 16 | 11 | 7 | Vanilla | Stone enclosure citadel, Sofala gold trade, Indian Ocean emporiums, Swahili alliance |
| **12. Kingdom of Georgia** | `GEO` | 11 | 9 | 6 | Vanilla | Queen Tamar's legacy, Caucasian wall against Tamerlane, Pontic & Trebizond crusade |
| **13. Blue & Golden Horde** | `BHR`, `STE` | 10 | 9 | 5 | Vanilla | Sarai pax, reunification of the Kipchak steppe, silk trade stabilization, Volga canon |
| **TOTALS** | **14 Core Tags** | **256** | **252** | **172** | **42+** | **Comprehensive 1337-1837 alternate timelines** |

---

## Detailed Module Breakdown

### 1. Byzantine Empire (`BYZ`)
- **Imperial Reconquista**: Structured progression from Morea and Thrace to Macedonia, Greece, Western Anatolia, Antioch, Jerusalem, and Alexandria.
- **Civic & Military Overhauls**: Re-establishment of the Theme System, Varangian Guard reforms, restoring the Golden Gate of Constantinople, and refounding the Imperial High Admiralty.
- **Imperial Diplomatic Balance**: Decisions regarding the Council of Florence, Orthodox primacy, and peaceful partition of spheres with Italian or Levantine powers.

### 2. Papal States, Kingdom of Italy & Western Empire (`PAP`, `ITA`, `WRE`)
- **Branch T (Catholic Theocracy)**: Return from Avignon to Rome (1378 Schism averted), Albornoz citadels, Egidian Constitutions, Papal League of Italy, and dynamic conclave system with 31 individual papal election events (1417-1831).
- **Branch K (Kingdom of Italy)**: Unification of the peninsula from Milan (`MLO`), Florence (`FLO`), Venice (`VEN`), Genoa (`GEN`), Naples (`NAP`), or Savoy (`SAV`). Dynasty choices between the Medici, Sforza, or Savoyard royal houses.
- **Branch R (Western Roman Empire)**: Resurrecting the Western Empire in Rome, Latin-Italian linguistic unification, Julian civic reforms, and the option to restore ancient Hellenic-Roman paganism (`roman_pagan`).
- **Branch S (Consuls of SPQR)**: Re-establishment of the Roman Republic with the *Comitia Centuriata* electing Consuls every 5 years in recurring constitutional cycles.

### 3. Mameluks & Ptolemaic Egypt (`MAM`, `EGY`)
- **Internal Emancipation**: Purging the Citadel of Cairo, abolishing foreign slave-warrior monopolies, and elevating native fellahin and Christian Copts (adding accepted `coptic` culture).
- **Four Distinct Religious & Political Paths (1500-1800)**:
  1. *Ptolemaic Thalassocracy (`EGY`)*: Capital in Alexandria, accepted `greek` culture, Pharos lighthouse reconstruction, Ancient Canal of the Pharaohs, Mouseion Enlightenment, and Mediterranean naval doctrine.
  2. *Kemetic Paganism (`egyptian_pagan`)*: Crowning of the living Pharaoh, Amun-Ra cult restoration, Giza Pyramids and Luxor renovations, Opet festivals, Abydos necropolis, facing a Pan-Islamic defensive Holy War.
  3. *Mu'tazilite Rationalism (`mutazilite`)*: The Imperial Edict of Reason, Bayt al-Hikma (House of Wisdom) translation bureau, Kalam theological court, and Al-Azhar Academy of Natural Sciences.
  4. *Traditional Sunni Sultanate (`sunni`)*: Al-Azhar orthodox patronage, modernized Royal Mameluk Cavalry corps with firearms, and Custodianship of Mecca and Medina.
- **Universal Nile Modernization**: Red Sea Armada & Battle of Diu (1509), Mocha coffee monopoly, Calicut spice entrepot, long-staple cotton revolution, and Cairo Citadel artillery foundries.

### 4. Hanseatic League (`HSA`)
- **Proclamation of Statehood**: Convening the *Grosser Hansetag* in Luebeck (1356), uniting northern merchant cities into a sovereign league state (`HSA`).
- **Governmental Paths**: Plutocratic Merchant Republic (Senate and 4 Quarters) vs Maritime Sovereign Stadtholderate.
- **Trade Dominance**: Peace of Stralsund (1370), seizure of the Sound Toll from Denmark, Danzig grain monopoly, Baltic herring trade cartels, and Atlantic charter outposts.

### 5. Pre-Columbian Americas (`AZT`, `INC`)
- **Mexica / Aztec Empire (`AZT`)**: Night of Retribution on the Tenochtitlan causeways, capturing European firearms and horses, quarantine cordons against Old World pestilence, Nezahualcoyotl's philosophical reformation (`nahua_reformed`), obsidian-iron metallurgy, and trans-Atlantic diplomatic embassies.
- **Inca Empire / Tawantinsuyu (`INC`)**: Reconciliation of Huascar and Atahualpa at Quito, ambush of conquistadors in Cajamarca, stone highway network (*Qhapaq Nan*), solar reformation (`inti_reformed`), Altiplano mountain cavalry, and trans-Pacific voyages of Tupac Yupanqui establishing trade with Asia.

### 6. Celtic Union (`SCO`, `WLS`, `EIR`)
- **National Awakenings**: Owain Glyndwr's Welsh Parliament, liberation of the Dublin Pale by the High King of Ireland (*Ard Ri*), and Franco-Scottish diplomatic alliance (*Auld Alliance*).
- **The Celtic Union**: Unification of Alba, Cymru, and Eire; choice between a Federal Commonwealth Council or Arthurian High Empire at Caerleon; liberation of Cornwall and Northumbria; revival of the Insular Celtic Church.

### 7. Solomonic Empire of Ethiopia (`ETH`)
- **Highland & Red Sea Dominance**: Permanent capital in Gondar, Massawa deep-water naval arsenal, securing the Dahlak archipelago, and trade factories in Zeila.
- **Crusade of Prester John**: Formal diplomatic alliance with Rome and Venice, reconquest of Nubia, and a southern naval expedition liberating the Kingdom of Jerusalem.

### 8. Joseon Kingdom of Korea (`KOR`)
- **Joseon Renaissance**: Promulgation of the phonetic *Hangul* alphabet by King Sejong the Great, Royal Academy of Hall of Worthies, and mass introduction of *Hwacha* rocket carts.
- **Maritime Hegemony**: Early invention of ironclad *Geobukseon* (Turtle Ships), suppression of Wokou pirates, naval supremacy in the Tsushima Strait, and reconquest of ancient Goguryeo lands in Manchuria.

### 9. African & Eurasian Empires (`MAL`, `ZIM`, `GEO`, `BHR`)
- **Mali (`MAL`)**: Gold monopoly regulation, Timbuktu intellectual academies, trans-Saharan commercial routes, and Atlantic naval exploration.
- **Great Zimbabwe (`ZIM`)**: Great Enclosure masonry expansion, Sofala gold trade, Swahili Coast naval alliances, and Indian Ocean emporiums.
- **Georgia (`GEO`)**: Defense of the Caucasus passes, Bagrationi dynastic consolidation, alliance with Trebizond, and Pontic crusades.
- **Blue & Golden Horde (`BHR`, `STE`)**: Sarai trade revitalization, integration of Volga river commerce, and reuniting the Eurasian steppe clans.

---

## Custom Religions & Cultures

### Religions (`Db/Religions/religions.txt`)
- `roman_pagan`: Revival of classical Greco-Roman polytheism for the Western Roman Empire.
- `egyptian_pagan`: Sacred Kemetic faith of the Pharaohs and solar cult of Amun-Ra.
- `mutazilite`: Rationalist Islamic school upholding human free will, science, and empirical inquiry.
- `nahua_reformed`: Monotheistic/philosophical reform of Quetzalcoatl, ending human sacrifice. Non-annexable.
- `inti_reformed`: Reformed Andean worship of the Sun Father Inti, emphasizing civic order. Non-annexable.

### Cultures (`Db/cultures.txt`)
- `roman`: Classical Romanitas culture for the restored Western Empire (`WRE`) and unified Italy.
- `coptic`: Native Christian Egyptian culture for Egypt (`MAM` and `EGY`), bridging the Nile valley fellahin.
- `brythonic`: Celtic Brythonic identity across Wales, Cornwall, and Brittany.
- `mesoamerican`: High civilized Mesoamerican culture for reformed Aztec imperial administration.
- `mali`: Mandinka imperial culture for West African dominance.

---

## FTG 1.3 Technology Scales & Progression Architecture

For The Glory (Engine 1.3) features fundamentally asymmetric technology trees. A common pitfall in mod scripting is treating military technologies on the same 0-10 scale as civil ones:

1. **Civil & Economic Branches (`infra` and `trade`)**:
   - Scaled strictly from **Level 0 to 10**.
   - Every tier represents a massive historical epoch:
     - **Level 0 (1337)**: Medieval baseline; placement of merchants and early colonists.
     - **Level 1 (~1380)**: Tax collectors (`bailiff`).
     - **Level 2 (~1440)**: Fine arts academies (`luxury`) and trading posts.
     - **Level 3 (~1490-1500)**: Refineries / breweries and trade monopolies.
     - **Level 4 (~1535-1540)**: Chief judges (`courthouse`) and trade embargoes.
     - **Level 5 (~1600)**: Mayors and governors (`cityrights`).
     - **Level 6 (~1640)**: Goods manufactories.
     - **Level 7 (~1700)**: Late baroque administration.
     - **Level 8 (~1750)**: Enlightenment economic reforms.
     - **Level 9 (~1850)**: Proto-industrial modernization.
     - **Level 10 (Max cap)**: Industrial zenith.

2. **Military & Naval Branches (`land` and `naval`)**:
   - Scaled across **61 levels (Level 0 to 60)**.
   - Granular progression mapped to tactical and weapon developments:
     - **Levels 0-10 (1337-1508)**: Late Medieval & Transition. Level 2 enables Level 2 fortresses (1440); Level 5 enables assaults (1485); Level 7 enables field artillery (1497); Level 9 introduces arquebus firearms (1502). In Naval, Level 4 unlocks troop transports (1475); Level 9 introduces bronze naval cannon (1502); Level 11 unlocks provincial shipyards (1520).
     - **Levels 11-20 (1510-1620)**: Renaissance Warfare. Musket armament CRT (Land 14, ~1540); naval equipment manufactories (Naval 16, ~1560); ocean galleons (Naval 17, ~1580); weapons manufactories (Land 18, ~1600).
     - **Levels 21-30 (1620-1714)**: Baroque & Thirty Years' War. Level 4 fortresses (Land 21); iron naval cannon (Naval 21); professional standing army doctrine (Land 26, ~1670); global naval exploration (Naval 27, ~1680); Vaisseaux line-of-battle warships (Naval 31, ~1714).
     - **Levels 31-45 (1715-1770)**: 18th Century Linear Warfare. Maneuver warfare (Land 35, ~1730); storm immunity (Naval 38, ~1740); naval supply network (Naval 41, ~1750); conscription centers and Level 6 fortresses (Land 41, ~1750).
     - **Levels 46-60 (1771-1820+)**: Napoleonic Era. Levee en masse (Land 51, ~1791); carronades (Naval 51); triple-decker first-rate flagships (Naval 49).

### Decision Calibration Audit
All 256 Alternate Destinies decisions have been audited and calibrated to respect this dual-scale engine architecture. Military and naval prerequisites (e.g., Alexandria Grand Arsenal requiring `naval = 18`, Horn of Africa Expedition requiring `naval = 25`, Cairo Citadel Royal Artillery requiring `land = 30`, Lubeck Grand Arsenal requiring `naval = 11`) accurately match expected historical attainment years, eliminating early-game premature unlocks while maintaining authentic progression.

---

## Required Graphical Assets Checklist

The FTG engine requires specific bitmap assets for newly introduced religions and country tags. The game remains fully playable without crashes, but adding the following assets will provide complete visual polish in the interface and map:

### 1. Religion Icons (`Gfx/Religions/`)
*Format: 32 x 34 pixels, 24-bit uncompressed Windows BMP (`.bmp`)*

| Religion ID | In-Game Name | Target File | Suggested Visual Motif |
|:---|:---|:---|:---|
| `roman_pagan` | Cultus Deorum | `Gfx/Religions/roman_pagan.bmp` | Roman Aquila (golden eagle), Jupiter's thunderbolt (*fulmen*), or SPQR laurel wreath on imperial crimson. |
| `egyptian_pagan` | Kemetic | `Gfx/Religions/egyptian_pagan.bmp` | Golden Ankh (*Key of Life*), Eye of Horus (*Wedjat*), or winged solar disk of Ra on lapis lazuli. |
| `mutazilite` | Mu'tazilite | `Gfx/Religions/mutazilite.bmp` | The Scales of Justice (*Mizan*) or calligraphic emblem representing theological reason (*'Aql*) on emerald green. |
| `nahua_reformed` | Reformed Nahua | `Gfx/Religions/nahua_reformed.bmp` | Plumed Serpent (*Quetzalcoatl*) head or turquoise solar calendar stone, symbolizing philosophical purification. |
| `inti_reformed` | Reformed Inti | `Gfx/Religions/inti_reformed.bmp` | Golden Sun of Tawantinsuyu with stylized human face and flaming solar rays on Inca gold. |

### 2. Country Banners & Shields (`Gfx/Map/`)

#### Western Roman Empire (`WRE`) -- *Critical: New Tag*
- **Flag**: `Gfx/Map/Flags/flag_WRE.bmp` *(51 x 30 pixels, 24-bit BMP)* -- Imperial Roman Palatine Labarum: Golden double-headed or single Aquila with SPQR / Chi-Rho wreath on imperial purple.
- **Shields**:
  - `Gfx/Map/Shields/Classic/shield_WRE.bmp` & `Classic/Small/shield_WRE.bmp`
  - `Gfx/Map/Shields/Glory/shield_WRE.bmp` & `Glory/Small/shield_WRE.bmp`
  - `Gfx/Map/Shields/Glorious/shield_WRE.bmp` & `Glorious/small/shield_WRE.bmp`

#### Thematic / Cosmetic Banner Enhancements *(Optional)*
- **United Steppe Empire (`STE`)**: Custom unified golden Mongol *Soyombo* / Golden Horde falcon *tamga* banner for `Gfx/Map/Flags/flag_STE.bmp`.
- **Kemetic / Ptolemaic Egypt (`EGY`)**: Alternative ancient Kemetic solar barque / Ptolemaic eagle flag when adopting pagan or Greek paths for `Gfx/Map/Flags/flag_EGY.bmp`.
- **Arthurian Celtic Empire (`WLS` / `SCO`)**: Alternative high imperial red dragon crowned with a golden Celtic torc.

---

## Engine Database & Localization Integrity

All custom additions have been verified and registered across the engine database:

1. **Religions (`Db/Religions/religions.txt`)**:
   - `roman_pagan`, `egyptian_pagan`, `mutazilite`, `nahua_reformed`, `inti_reformed` defined with custom modifiers, missionary parameters, and stability cost curves.
   - Mapped to valid map-mode colors in both `Db/Map/Colorscales/Gloriana/colorscales_religions.txt` and `Glory/colorscales_religions.txt` (including custom `DarkYellow` and `Gold` palettes).
   - Fully localized in `Localisation/English/religions.csv`.

2. **Cultures (`Db/cultures.txt`)**:
   - Registered cultures: `roman`, `coptic`, `brythonic`, `mesoamerican`, `mali`.
   - Configured with city sprites, architecture sets, and political colors.
   - Fully localized in `Localisation/English/cultures.csv`.

3. **Countries (`Db/countries.txt`)**:
   - Tag `WRE` registered with Latin tech group, Roman army gfx, and Italian monarch language.
   - Fully localized in `Localisation/English/countries.csv`.

---

## Technical Architecture & "Clean Overlay" System

The mod is engineered from the ground up to be **completely immune to being overwritten** when the base mod author releases updates (e.g. `Gloriana_1337_v1.06.zip`):
1. **Isolated File Names**: All decisions and events live in dedicated `alt_*.txt` files (`Db/Decisions/alt_*.txt` and `Db/Events/alt_*.txt`).
2. **Master Loaders**: Included via a clean 2-line hook in `Db/events.txt` and `Db/Decisions/decisions.txt` pointing to `events_alt_master.txt`.
3. **Automated Re-application**: If upstream zip files overwrite base files, running `Work Folder/Alt_Patches/Apply-AltPatches.ps1` instantly restores all hooks, cultures, religions, and scenario definitions.

### Git Branching Model
- **`main`**: Clean, pristine base of Gloriana 1337 tracking author upstream releases.
- **`alternate-destinies`**: The active feature branch containing all alternate destiny content.

---

## Upstream Update Procedure (Fast Reference)

When an official update for Gloriana 1337 is released:

```bash
# 1. Ensure working directory is clean
git status

# 2. Switch to vanilla upstream branch
git checkout main

# 3. Extract the author's new zip, overwriting files, then commit:
git add .
git commit -m "Upstream Gloriana vX.XX"
git push origin main

# 4. Return to Alternate Destinies and merge upstream changes:
git checkout alternate-destinies
git merge main

# 5. Re-apply database hooks automatically:
powershell -ExecutionPolicy Bypass -File "Work Folder\Alt_Patches\Apply-AltPatches.ps1"

# 6. Commit and push:
git commit -am "Merge upstream vX.XX and re-apply Alternate Destinies hooks"
git push origin alternate-destinies
```

For full documentation and workflow details, see [UPDATING_AND_GIT_WORKFLOW.md](Work%20Folder/UPDATING_AND_GIT_WORKFLOW.md).
