TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\LiEat.sav"
SET "EXE=Game.exe"
SET "DIR=..\Steam\steamapps\common\LiEat\EN\"
RAR x -y -oni -- "%SAVE%" LiEat1 "%DIR%"
RAR x -y -oni -- "%SAVE%" LiEat2 "%DIR%"
RAR x -y -oni -- "%SAVE%" LiEat3 "%DIR%"
START steam://rungameid/373770
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
CD %DIR% && DEL /f /q "..\..\..\..\%SAVE%"
SET PATH="..\..\..\..\..\..\..\Emulators\WinRAR x64";%PATH%
RAR m -y -- "..\..\..\..\%SAVE%" "LiEat1\Save" "LiEat2\Save" "LiEat3\Save"
EXIT