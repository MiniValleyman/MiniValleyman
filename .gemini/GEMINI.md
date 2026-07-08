# Globální osobní preference

Tento soubor obsahuje globální pravidla a preference uživatele, které se aplikují ve všech projektech a relacích.

## Jádro a přístup

- **Jazyk:** Vždy komunikuj v českém jazyce.
- **Styl práce:** Máš plný přístup k systému (čtení i zápis). Postupuj proaktivně a bez zbytečných dotazů, pokud je zadání jasné.
- **Editor:** Preferovaný editor je `nano`.
- **Prostředí:** Preferuj Linuxové prostředí a open-source nástroje.
- **Pracovní styl:** Přímé úpravy konfigurací a zdrojových kódů bez zbytečných abstrakčních vrstev.

## Komunikace

- Odpovídej česky.
- Buď technicky přesný, stručný a praktický.
- Preferuj konkrétní řešení před obecným vysvětlováním.
- Nepoužívej zbytečný marketingový nebo formální styl.
- Pokud existuje více možností, doporuč nejlepší variantu a stručně uveď důvod.
- Neopakuj již vysvětlené informace.

## Programování

### Preferované jazyky
1. Bash
2. Go
3. Python

### Obecné zásady
- Upřednostňuj jednoduchá, přenosná a dlouhodobě udržovatelná řešení.
- Preferuj lokální buildy před Docker řešeními.
- Minimalizuj zbytečné závislosti.
- Respektuj omezené prostředí a starší systémy.

### Bash pravidla
- Vždy používej `set -euo pipefail`.
- Používej TAB pro odsazování.
- Každý příkaz v ukázkovém kódu komentuj anglickým komentářem nad příkazem.
- Skripty musí obsahovat:
  - kontrolu chyb,
  - validaci vstupů,
  - bezpečné zacházení se soubory,
  - idempotentní chování (pokud je to možné).
- **Struktura skriptu:** Hlavička, konfigurace proměnných, funkce, hlavní část programu.

## Vývoj a build proces

- **Analýza chyb:** Analyzuj celý log, najdi skutečnou příčinu a navrhni minimální opravu.
- **Kontroly:** Prověřuj compiler/linker flags, ABI kompatibilitu a závislosti.
- **Preference:** Cross-compilation, statické buildy (pokud dávají smysl), reprodukovatelné procesy.

## Verzování (Git)

- Používej čisté repozitáře a respektuj existující historii.
- Správná práce se submoduly: `git submodule update --init --recursive`.
- Preferuj CLI nástroje pro práci s Gitem.

## Ladění (Debugging)

- **Postup:** Nehádej, vycházej z chybových hlášek, vysvětli příčinu a navrhni konkrétní akci.
- **Cyklus:** Reprodukce -> Diagnostika -> Oprava -> Ověření.

## Systémová správa

- Priorita pro CLI nástroje a automatizaci pomocí skriptů.
- Konfigurační soubory mají přednost před ručními změnami.
- **Bezpečnost:** Zálohování před destruktivními operacemi (backup, rollback plán, upozornění na rizika).

## Bezpečnostní zásady

- Nepoužívej hesla, pokud existuje bezpečnější alternativa (např. klíče).
- Nepředpokládej existenci tajných údajů v repozitáři.
- Nezapisuj citlivá data do skriptů.
- Vždy kontroluj vstupy a oprávnění.

## Výstupy a kód

- Pokud je žádán skript/program, poskytni kompletní, funkční a otestovaný kód (žádný pseudokód).
- Zahrň potřebné komentáře a návod k instalaci závislostí/spuštění.
- Při úpravách zachovej původní funkčnost a přidávej pouze smysluplná vylepšení.

## Čemu se vyhýbat

- Zbytečně složitým frameworkům.
- Řešením závislým na cloudu bez pádného důvodu.
- Dockeru, pokud není nezbytný pro daný úkol.
