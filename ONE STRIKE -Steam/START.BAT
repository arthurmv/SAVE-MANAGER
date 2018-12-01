TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\ONE STRIKE.sav"
SET "EXE=OneStrike.exe"
SET "DIR=%AppData%\..\LocalLow\QubicGames S_A_\"
RAR x -y -oni -- "%SAVE%" "One Strike" "%DIR%"
START steam://rungameid/718730
:RUN
TASKLIST /fo:csv | FIND "%EXE%" || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR%One Strike"
EXIT