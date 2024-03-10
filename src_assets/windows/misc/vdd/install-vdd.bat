@echo off
setlocal enabledelayedexpansion

rem Get sunshine root directory
for %%I in ("%~dp0\..") do set "OLD_DIR=%%~fI"

rem Create the config directory if it didn't already exist
set "NEW_DIR=%OLD_DIR%\vdd"
if not exist "%NEW_DIR%\" mkdir "%NEW_DIR%"
icacls "%NEW_DIR%" /reset

rem Get system proxy setting
set proxy= 
for /f "tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^| find /i "ProxyEnable"') do (
  set ProxyEnable=%%a
    
  if !ProxyEnable! equ 0x1 (
  for /f "tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" ^| find /i "ProxyServer"') do (
      set proxy=%%a
      echo Using system proxy !proxy! to download Virtual Gamepad
      set proxy=-x !proxy!
    )
  ) else (
    rem Proxy is not enabled.
  )
)

rem Strip quotes
set browser_download_url="https://github.com/itsmikethetech/Virtual-Display-Driver/releases/download/23.12.2HDR/VDD.HDR.23.12.zip"

echo %browser_download_url%

rem Download the zip
curl -s -L !proxy! -o "%NEW_DIR%\vdd.zip" %browser_download_url%

rem unzip
powershell -c "Expand-Archive '%NEW_DIR%\vdd.zip' '%NEW_DIR%'"

pause

rem Delete temp file
del "%NEW_DIR%\vdd.zip"

pause