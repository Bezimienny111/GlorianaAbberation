# Gloriana Alternate Destinies - Patch Applier
# Run this script after extracting a new upstream mod update to safely restore custom engine entries.

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ModDir = (Get-Item $ScriptDir).Parent.Parent.FullName

Write-Host "Applying Alternate Destinies engine database patches..." -ForegroundColor Cyan

# 1. Countries
$CountriesFile = Join-Path $ModDir "Db\countries.txt"
$CountriesPatch = Join-Path $ScriptDir "countries_patch.txt"
if (Test-Path $CountriesFile) {
    $content = Get-Content $CountriesFile -Raw
    if ($content -notmatch "WRE\s*=") {
        Write-Host "Adding WRE tag to Db\countries.txt..." -ForegroundColor Yellow
        "`r`n# --- Gloriana Alternate Destinies Additions ---`r`n" + (Get-Content $CountriesPatch -Raw) | Add-Content $CountriesFile -Encoding ascii
    } else {
        Write-Host "WRE tag already present in Db\countries.txt." -ForegroundColor Green
    }
}

# 2. Religions
$ReligionsFile = Join-Path $ModDir "Db\Religions\religions.txt"
$ReligionsPatch = Join-Path $ScriptDir "religions_patch.txt"
if (Test-Path $ReligionsFile) {
    $content = Get-Content $ReligionsFile -Raw
    if ($content -notmatch 'name\s*=\s*"roman_pagan"') {
        Write-Host "Adding custom religions to Db\Religions\religions.txt..." -ForegroundColor Yellow
        "`r`n# --- Gloriana Alternate Destinies Additions ---`r`n" + (Get-Content $ReligionsPatch -Raw) | Add-Content $ReligionsFile -Encoding ascii
    } else {
        Write-Host "Custom religions already present in Db\Religions\religions.txt." -ForegroundColor Green
    }
}

# 3. Cultures
$CulturesFile = Join-Path $ModDir "Db\cultures.txt"
$CulturesPatch = Join-Path $ScriptDir "cultures_patch.txt"
if (Test-Path $CulturesFile) {
    $content = Get-Content $CulturesFile -Raw
    if ($content -notmatch 'roman\s*=' -or $content -notmatch 'coptic\s*=') {
        Write-Host "Adding custom cultures (roman, coptic) to Db\cultures.txt..." -ForegroundColor Yellow
        "`r`n# --- Gloriana Alternate Destinies Additions ---`r`n" + (Get-Content $CulturesPatch -Raw) | Add-Content $CulturesFile -Encoding ascii
    } else {
        Write-Host "Custom cultures already present in Db\cultures.txt." -ForegroundColor Green
    }
}

# 4. Egypt Monarchs
$MonarchsEgyFile = Join-Path $ModDir "Db\Monarchs\monarchs_egy.txt"
$MonarchsEgyPatch = Join-Path $ScriptDir "monarchs_egy_patch.txt"
if (Test-Path $MonarchsEgyFile) {
    $content = Get-Content $MonarchsEgyFile -Raw
    if ($content -notmatch '39201') {
        Write-Host "Adding custom Ptolemaic/Kemetic dynasties to Db\Monarchs\monarchs_egy.txt..." -ForegroundColor Yellow
        "`r`n# --- Gloriana Alternate Destinies Additions ---`r`n" + (Get-Content $MonarchsEgyPatch -Raw) | Add-Content $MonarchsEgyFile -Encoding ascii
    } else {
        Write-Host "Custom Egypt dynasties already present in Db\Monarchs\monarchs_egy.txt." -ForegroundColor Green
    }
}

# 5. Localisation
$ReligionsCsv = Join-Path $ModDir "Localisation\English\religions.csv"
if (Test-Path $ReligionsCsv) {
    $content = Get-Content $ReligionsCsv -Raw
    if ($content -notmatch "RELIGION_MUTAZILITE") {
        Write-Host "Restoring custom religions to Localisation\English\religions.csv..." -ForegroundColor Yellow
        "RELIGION_MUTAZILITE;Mu'tazilite;x`r`nRELIGION_ROMAN_PAGAN;Cultus Deorum;x`r`nRELIGION_EGYPTIAN_PAGAN;Kemetic;x`r`nRELIGION_NAHUA_REFORMED;Reformed Nahua;x`r`nRELIGION_INTI_REFORMED;Reformed Inti;x" | Add-Content $ReligionsCsv -Encoding ascii
    }
}
$CulturesCsv = Join-Path $ModDir "Localisation\English\cultures.csv"
if (Test-Path $CulturesCsv) {
    $content = Get-Content $CulturesCsv -Raw
    if ($content -notmatch "CULTURE_COPTIC") {
        Write-Host "Restoring custom cultures to Localisation\English\cultures.csv..." -ForegroundColor Yellow
        "CULTURE_COPTIC;Coptic;x`r`nCULTURE_ROMAN;Roman;x" | Add-Content $CulturesCsv -Encoding ascii
    }
}
$CountriesCsv = Join-Path $ModDir "Localisation\English\countries.csv"
if (Test-Path $CountriesCsv) {
    $content = Get-Content $CountriesCsv -Raw
    if ($content -notmatch "WRE;") {
        Write-Host "Restoring WRE to Localisation\English\countries.csv..." -ForegroundColor Yellow
        "WRE;Western Roman Empire;x`r`nWRE_DESC;The Western Roman Empire, restored through the union of the Italian crown and the revived Senate of Rome, stands as the sovereign heir to Caesar and Augustus.;x" | Add-Content $CountriesCsv -Encoding ascii
    }
}

Write-Host "Patches verification complete!" -ForegroundColor Green
