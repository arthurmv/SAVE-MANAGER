TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\VÉJÉc.sav"
SET "EXE=VKatsu.exe"
SET "DIR1=..\Steam\steamapps\common\v_katsu\"
SET "DIR2=%AppData%\..\LocalLow\IVR\"
RAR x -y -oni -- "%SAVE%" UserData "%DIR1%"
RAR x -y -oni -- "%SAVE%" Vkatsu "%DIR2%"
START steam://rungameid/856620
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR1%UserData" "%DIR2%Vkatsu"
EXIT