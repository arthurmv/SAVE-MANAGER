TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\Master Levels for DOOM II.sav"
SET "EXE=dosbox.exe"
SET "DIR=..\Steam\steamapps\common\Master Levels of Doom\doom2\"
RAR x -y -oni -- "%SAVE%" "%DIR%"
START steam://rungameid/9160
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR%DOOMSAV0.DSG" "%DIR%DOOMSAV1.DSG" "%DIR%DOOMSAV2.DSG" "%DIR%DOOMSAV3.DSG" "%DIR%DOOMSAV4.DSG" "%DIR%DOOMSAV5.DSG"
EXIT