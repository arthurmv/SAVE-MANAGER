TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
FOR /F "tokens=3" %%G IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') DO (SET MyDoc=%%G)
SET "SAVE=..\..\..\SAVE\Windows\FINAL FANTASY VII.sav"
SET "EXE1=ff7_es.exe"
SET "EXE2=FF7_Launcher.exe"
SET "DIR=%MyDoc%\Square Enix\"
RAR x -y -oni -- "%SAVE%" "FINAL FANTASY VII Steam" "%DIR%"
START steam://rungameid/39140
:BOOT
TASKLIST /fo:csv | FIND "%EXE2%" && GOTO RUN /F || GOTO BOOT
:RUN
TASKLIST /fo:csv | FIND "%EXE2%" || GOTO SAVE
TASKLIST /fo:csv | FIND "%EXE1%" || GOTO RUN
:EXIT_LAUNCHER
TASKKILL /IM FF7_Launcher.exe /F
:GAME
TASKLIST /fo:csv | FIND "%EXE1%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR%FINAL FANTASY VII Steam"
EXIT