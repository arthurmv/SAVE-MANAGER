TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
FOR /F "tokens=3" %%G IN ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') DO (SET MyDoc=%%G)
SET "SAVE=..\..\..\SAVE\Windows\ATARI VAULT.sav"
SET "EXE=AtariVault.exe"
SET "DIR1=%AppData%\..\LocalLow\Atari_\"
SET "DIR2=%MyDoc%\SkidRow\"
RAR x -y -oni -- "%SAVE%" "Atari Vault" "%DIR1%"
RAR x -y -oni -- "%SAVE%" 400020 "%DIR2%"
START steam://rungameid/400020
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR1%Atari Vault" "%DIR2%400020"
EXIT