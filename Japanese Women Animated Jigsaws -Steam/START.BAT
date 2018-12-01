TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\Japanese Women - Animated Jigsaws.sav"
SET "EXE=Japanese_Women_Animated_Jigsaws.exe"
SET "DIR=%AppData%\..\LocalLow\jp_co_bottlecube\"
RAR x -y -oni -- "%SAVE%" "Japanese Women - Animated Jigsaws" "%DIR%"
START steam://rungameid/617610
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR%Japanese Women - Animated Jigsaws"
EXIT