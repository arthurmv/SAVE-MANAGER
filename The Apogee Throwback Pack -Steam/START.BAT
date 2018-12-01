TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "EXE=ThrowbackPackLauncher.exe"
SET "SAVE=..\..\..\SAVE\Windows\The Apogee Throwback Pack.sav"
SET "DIR=..\Steam\steamapps\common\The Apogee Throwback Pack\"
RAR x -y -oni -- "%SAVE%" "%DIR%"
START steam://rungameid/238050
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -ap"Planet Strike" -- "%SAVE%" "%DIR%Planet Strike\CONFIG.VSI" "%DIR%Planet Strike\SAVEGAM0.VSI"
EXIT