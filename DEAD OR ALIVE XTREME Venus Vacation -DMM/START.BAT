TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\DEAD OR ALIVE Xtreme Venus Vacation.sav"
SET "EXE0=DOAX_VV_Launcher.exe"
SET "EXE=DOAX_VV.exe"
SET "DIR=.\DX11_data\"
RAR x -y -oni -- "%SAVE%" savedata "%DIR%"
START dmmgameplayer://doaxvv/cl/general/doaxvv
:RUN
TASKLIST /fo:csv | FIND "%EXE0%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE0%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO EXE
:EXE
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR%savedata"
EXIT