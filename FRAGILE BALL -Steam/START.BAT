TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\FRAGILE BALL.sav"
SET "EXE=Ball.exe"
SET "DIR1=..\Steam\steamapps\common\Fragile Ball\"
SET "DIR2=%AppData%\..\LocalLow\DefaultCompany\"
RAR x -y -oni -- "%SAVE%" SaveData "%DIR1%"
RAR x -y -oni -- "%SAVE%" EQLauncher "%DIR2%"
START steam://rungameid/370510
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR1%SaveData" "%DIR2%EQLauncher"
EXIT