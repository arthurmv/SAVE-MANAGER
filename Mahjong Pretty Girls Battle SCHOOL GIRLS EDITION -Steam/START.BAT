TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\Mahjong Pretty Girls Battle SCHOOL GIRLS EDITION.sav"
SET "EXE=MahjongPrettyGirlsBattle[SchoolGirlsEdition].exe"
SET "DIR=..\Steam\steamapps\common\MPGB [School Girls Edition]\"
RAR x -y -oni -- "%SAVE%" save "%DIR%"
START steam://rungameid/379960
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR%save"
EXIT