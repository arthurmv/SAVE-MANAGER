TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\SONIC ADVENTURE 2.sav"
SET "EXE=sonic2app.exe"
SET "DIR1=..\Steam\steamapps\common\Sonic Adventure 2\resource\gd_PC\"
SET "DIR2=..\Steam\steamapps\common\Sonic Adventure 2\"
RAR x -y -oni -- "%SAVE%" SAVEDATA "%DIR1%"
RAR x -y -oni -- "%SAVE%" Config "%DIR2%"
START steam://rungameid/213610
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR1%SAVEDATA" "%DIR2%Config"
EXIT