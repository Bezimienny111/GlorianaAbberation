# For The Glory (FTG) - Engine Syntax & Modding Lessons Learned

This document serves as a self-instruction manual to avoid repeating common syntax errors and hallucinations caused by mixing EU2/FTG syntax with modern Paradox (EU3/EU4) conventions.

## 1. Trigger Syntax Quirks
* **War Trigger**: The `war = { country = TAG }` syntax is **invalid**. In FTG, war triggers must specify both belligerents. Use `war = { country = TAG1 country = TAG2 }`. If you need to check if a country is at war with *any* member of a specific alliance, you must list all possibilities inside an `OR = { ... }` block.
* **Relation Trigger**: Checking relations in a trigger uses `data`, NOT `value`. Correct: `relation = { country = TAG data = X }`. Incorrect: `relation = { country = TAG value = X }`. (Note: The *command* for relation still uses `value`).
* **Domestic Sliders (Trigger)**: In triggers, checking a domestic slider uses `type`, NOT `which`. Correct: `domestic = { type = innovative value = X }`. Incorrect: `domestic = { which = innovative value = X }`. (Note: The *command* for domestic sliders still uses `which`).
* **Flags**: Do NOT use EU4-style `has_global_flag` or `has_country_flag`. The FTG trigger is simply `flag = "flagname"`. Also, never use `hasflag = { which = "flagname" }`.

## 2. Command Syntax Quirks
* **Ownerchange (Province Age)**: To check how long a province has been owned, the syntax is `ownerchange = { province = X years = Y }`. Do NOT use `data = Y` or `months = Y` unless explicitly supported. `years = Y` is the standard for FTG 1.3+.
* **Domestic Sliders (Names)**: The 8 valid sliders are: `aristocracy`, `centralization`, `innovative`, `mercantilism`, `offensive`, `land`, `quality`, `serfdom`. Do NOT use `naval`, `free_trade`, etc. To shift towards naval, use `command = { type = domestic which = land value = -1 }`.
* **Add Core**: Use `addcore_national` or `addcore_claim`. Do NOT use `addcore` by itself or `add_core`.
* **Treasury/Stability/Cost as standalones**: Do NOT put `cost = X` or `treasury = X` as standalone parameters in a decision header. They must be inside the `action = {` block as commands: `command = { type = treasury value = -X }`.
* **Cultures**: Ensure culture tags match FTG's `Db/cultures.txt`. e.g., `mesoamerican` (not tarascan), `zapotek` (not zapotec), `brythonic` (not welsh/breton), `english` (not anglo_saxon).
* **Tags**: Verify tags match FTG's `Db/countries.txt`. For Kingdom of Jerusalem, the tag is `JER` (not KOJ). For Arabia/Hedjaz, it's `ARA` (not HED).

## 3. Decision Structure Quirks
* **Action Names**: In decisions, the `action = {` block **CANNOT** contain a `name = "..."` parameter. Naming options is strictly for events. Placing `name = "..."` inside a decision's action block will throw a critical engine parsing error `(unknown lhs in command)`. The name of the decision goes exclusively in the main `decision = {` block.

## 4. IDs and Duplicates
* **Uniqueness**: FTG enforces strict global uniqueness for Event IDs and Leader IDs. Always thoroughly search `Db/Events/` and `Db/Leaders/` before assigning new IDs. Overlapping IDs will cause a fatal `Database mismatch error: type = 7` (for events) or `type = 6` (for leaders/monarchs).

