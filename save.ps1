# AUDIRA - Auto Save and Push to GitHub (PowerShell)
param (
    [string]$Message = ""
)

$ErrorActionPreference = "Continue"

Write-Host "===================================================================" -ForegroundColor Cyan
Write-Host "              AUDIRA - AUTO SAVE & PUSH GITHUB                     " -ForegroundColor Cyan
Write-Host "  Repository: https://github.com/Audira141415/AUDIRA-DESAIN-UI-UX  " -ForegroundColor Gray
Write-Host "  Founder: Agus Dwi Rianto (AUDIRA)                                " -ForegroundColor Gray
Write-Host "  Official Website: https://audira.my.id                           " -ForegroundColor Gray
Write-Host "===================================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Pastikan Git repository diinisialisasi
if (-not (Test-Path ".git")) {
    Write-Host "[INFO] Menginisialisasi Git repository..." -ForegroundColor Yellow
    git init
}

# 2. Remote URL
$RepoUrl = "https://github.com/Audira141415/AUDIRA-DESAIN-UI-UX.git"
$remoteExists = git remote get-url origin 2>$null
if (-not $remoteExists) {
    Write-Host "[INFO] Menambahkan remote origin: $RepoUrl" -ForegroundColor Green
    git remote add origin $RepoUrl
} else {
    Write-Host "[INFO] Memperbarui remote origin: $RepoUrl" -ForegroundColor Green
    git remote set-url origin $RepoUrl
}

# 3. Set branch ke main
git branch -M main

# 4. Tentukan pesan commit
if ([string]::IsNullOrWhiteSpace($Message)) {
    $inputMsg = Read-Host "Masukkan pesan commit (Tekan ENTER untuk pesan default)"
    if ([string]::IsNullOrWhiteSpace($inputMsg)) {
        $Message = "feat: update and sync AUDIRA Desain UI/UX - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
    } else {
        $Message = $inputMsg
    }
}

Write-Host ""
Write-Host "[1/3] Menambahkan file ke Git staging..." -ForegroundColor Yellow
git add .

Write-Host "[2/3] Menyimpan commit: '$Message'..." -ForegroundColor Yellow
git commit -m "$Message"

Write-Host "[3/3] Mengunggah (push) ke GitHub main..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host ""
    Write-Host "[INFO] Sinkronisasi dengan repository remote..." -ForegroundColor Yellow
    git pull origin main --rebase --allow-unrelated-histories
    git push -u origin main
}

Write-Host ""
if ($LASTEXITCODE -eq 0) {
    Write-Host "===================================================================" -ForegroundColor Green
    Write-Host "  [SUKSES] Berhasil di-push ke GitHub!" -ForegroundColor Green
    Write-Host "  URL: https://github.com/Audira141415/AUDIRA-DESAIN-UI-UX" -ForegroundColor Green
    Write-Host "===================================================================" -ForegroundColor Green
} else {
    Write-Host "===================================================================" -ForegroundColor Red
    Write-Host "  [INFO] Periksa pesan di atas untuk detail error push." -ForegroundColor Red
    Write-Host "===================================================================" -ForegroundColor Red
}
