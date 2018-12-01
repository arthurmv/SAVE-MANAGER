TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\THE TINY BANG STORY.sav"
SET "EXE=ttbs.exe"
SET "DIR1=%AppData%\Colibri Games\"
SET "DIR2=%ProgramData%\"
RAR x -y -oni -- "%SAVE%" "The Tiny Bang Story" "%DIR1%"
RAR x -y -oni -- "%SAVE%" "Colibri Games" "%DIR2%"
START steam://rungameid/96000
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR1%The Tiny Bang Story" "%DIR2%Colibri Games"
EXIT