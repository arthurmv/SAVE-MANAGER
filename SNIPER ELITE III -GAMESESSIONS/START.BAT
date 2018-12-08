TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\SNIPER ELITE III.sav"
SET "EXE=GSLauncher.exe"
SET "DIR=%UserProfile%\Saved Games\GameSessions\"
RAR x -y -oni -- "%SAVE%" "Sniper Elite 3" "%DIR%"
START LaunchGame.lnk
:BOOT
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO BOOT
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR%Sniper Elite 3"
EXIT
