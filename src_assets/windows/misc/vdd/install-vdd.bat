@echo off
setlocal enabledelayedexpansion

rem Get temp directory
set temp_dir=%temp%/Sunshine

rem Create temp directory if it doesn't exist
if not exist "%temp_dir%" mkdir "%temp_dir%"

rem Get system proxy setting
set proxy= 
	@@ -31,14 +29,20 @@ set browser_download_url="https://github.com/itsmikethetech/Virtual-Display-Driv
echo %browser_download_url%

rem Download the zip
curl -s -L !proxy! -o "%temp_dir%\vdd.zip" %browser_download_url%

rem unzip
powershell -c "Expand-Archive '%temp_dir%\vdd.zip' '%temp_dir%'"

rem Delete temp file
del "%temp_dir%\vdd.zip"

rem install
set "DRIVER_DIR=%temp_dir%\VDD HDR 23.12.2\IddSampleDriver"
echo %DRIVER_DIR%

rem install inf
set CERTIFICATE="%DRIVER_DIR%\Virtual_Display_Driver.cer"
certutil -addstore -f root %CERTIFICATE%
certutil -addstore -f TrustedPublisher %CERTIFICATE%
PNPUTIL /add-driver "%DRIVER_DIR%\IddSampleDriver.inf" /install /subdirs