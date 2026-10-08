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
    if ($content -notmatch 'roman\s*=') {
        Write-Host "Adding roman culture to Db\cultures.txt..." -ForegroundColor Yellow
        "`r`n# --- Gloriana Alternate Destinies Additions ---`r`n" + (Get-Content $CulturesPatch -Raw) | Add-Content $CulturesFile -Encoding ascii
    } else {
        Write-Host "Roman culture already present in Db\cultures.txt." -ForegroundColor Green
    }
}

Write-Host "Patches verification complete!" -ForegroundColor Green
