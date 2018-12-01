TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\Sakura Swim Club.sav"
SET "EXE=Sakura Swim Club.exe"
SET "DIR1=..\Steam\steamapps\common\Sakura Swim Club\game\"
SET "DIR2=%AppData%\RenPy\"
RAR x -y -oni -- "%SAVE%" saves "%DIR1%"
RAR x -y -oni -- "%SAVE%" Sakura_swim1499 "%DIR2%"
START steam://rungameid/402180
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR1%saves" "%DIR2%Sakura_swim1499"
EXIT