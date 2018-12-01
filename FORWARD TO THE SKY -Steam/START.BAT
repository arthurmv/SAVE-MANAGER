TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\FORWARD TO THE SKY.sav"
SET "EXE=ForwardToTheSky.exe"
RAR x -y -oni -- "%SAVE%" save.reg
REG IMPORT save.reg && DEL /f /q save.reg
START steam://rungameid/333250
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
REG EXPORT HKEY_CURRENT_USER\Software\AnimuGame\ForwardToTheSky save.reg
REG DELETE HKEY_CURRENT_USER\Software\AnimuGame\ForwardToTheSky /f
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" save.reg
EXIT