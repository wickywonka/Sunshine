@echo off
setlocal enabledelayedexpansion

rem Get temp directory
set temp_dir=%temp%/Sunshine

rem Create temp directory if it doesn't exist
if not exist "%temp_dir%" mkdir "%temp_dir%"

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

rem Download the zip
curl -s -L !proxy! -o "%temp_dir%\vdd.zip" %browser_download_url%

rem unzip
powershell -c "Expand-Archive '%temp_dir%\vdd.zip' '%temp_dir%'"

rem Delete temp file
del "%temp_dir%\vdd.zip"

rem install
set "DRIVER_DIR=%temp_dir%\VDD HDR 23.12.2\IddSampleDriver"
echo %DRIVER_DIR%

set DIST_OPTIONS="C:/IddSampleDriver"
if not exist %DIST_OPTIONS% mkdir %DIST_OPTIONS%
move "%DRIVER_DIR%\option.txt" %DIST_OPTIONS%

rem install inf
set CERTIFICATE="%DRIVER_DIR%\Virtual_Display_Driver.cer"
certutil -addstore -f root %CERTIFICATE%
certutil -addstore -f TrustedPublisher %CERTIFICATE%

pause
@REM PNPUTIL /add-driver "%DRIVER_DIR%\IddSampleDriver.inf" /install /subdirs
"%~dp0\nefconw.exe" --create-device-node --hardware-id ROOT\\iddsampledriver --class-name Display --class-guid 4d36e968-e325-11ce-bfc1-08002be10318",
"%~dp0\nefconw.exe" --install-driver --inf-path \"%DRIVER_DIR%\\IddSampleDriver.inf\"
pause
