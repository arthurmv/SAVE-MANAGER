TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH%
SET "EXE=HoneySelect_32.exe" && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
SET "EXE=HoneySelect_64.exe"
:START
SET "SAVE=..\..\..\SAVE\Windows\HONEY SELECT.sav"
SET "DIR=.\UserData\"
RAR x -y -oni -- "%SAVE%" "%DIR%"
IPA %EXE% --launch
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR%Config" "%DIR%save" "%DIR%studioSave"
EXIT