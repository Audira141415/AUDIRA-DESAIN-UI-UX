@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ===================================================================
echo               AUDIRA - AUTO SAVE DAN PUSH GITHUB
echo   Repository: https://github.com/Audira141415/AUDIRA-DESAIN-UI-UX
echo   Founder: Agus Dwi Rianto (AUDIRA)
echo   Official Website: https://audira.my.id
echo ===================================================================
echo.

REM 1. Periksa apakah Git terinstal
where git >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Git tidak ditemukan di sistem. Pastikan Git sudah terinstal.
    pause
    exit /b 1
)

REM 2. Pastikan repository Git sudah diinisialisasi
if not exist ".git" (
    echo [INFO] Menginisialisasi Git repository...
    git init
)

REM 3. Konfigurasi Remote URL
set "REPO_URL=https://github.com/Audira141415/AUDIRA-DESAIN-UI-UX.git"

git remote get-url origin >nul 2>nul
if errorlevel 1 (
    echo [INFO] Menambahkan remote origin: %REPO_URL%
    git remote add origin %REPO_URL%
) else (
    echo [INFO] Memperbarui remote origin: %REPO_URL%
    git remote set-url origin %REPO_URL%
)

REM 4. Tetapkan branch utama ke main
git branch -M main

REM 5. Tentukan Pesan Commit
set "COMMIT_MSG=%*"
if "%~1"=="" (
    set "COMMIT_MSG=feat(audira): auto update and sync AUDIRA Desain UI/UX"
)

echo [INFO] Pesan commit: "!COMMIT_MSG!"
echo.
echo [1/3] Menambahkan file ke Git staging...
git add .

echo [2/3] Menyimpan commit...
git commit -m "!COMMIT_MSG!"

echo [3/3] Mengunggah (push) ke GitHub main...
git push -u origin main

if errorlevel 1 (
    echo.
    echo [INFO] Mencoba sinkronisasi dengan remote repository...
    git pull origin main --rebase --allow-unrelated-histories
    git push -u origin main
)

echo.
echo ===================================================================
echo   Selesai diproses. Silakan periksa status di atas.
echo ===================================================================
echo.
pause
