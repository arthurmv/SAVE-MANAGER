TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\Minesweep.sav"
SET "DIR=%AppData%\..\LocalLow\RewindApp\"
SET "EXE=MineSweep.exe"
RAR x -y -oni -- "%SAVE%" save.reg
RAR x -y -oni -- "%SAVE%" MineSweep %DIR%
REG IMPORT save.reg && DEL /f /q save.reg
START steam://rungameid/837440
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
REG EXPORT HKEY_CURRENT_USER\Software\RewindApp\MineSweep save.reg
REG DELETE HKEY_CURRENT_USER\Software\RewindApp\MineSweep /f
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" save.reg "%DIR%MineSweep"
EXIT