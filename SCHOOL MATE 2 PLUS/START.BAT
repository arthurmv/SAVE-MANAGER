TASKLIST /NH /FI "WINDOWTITLE EQ SAVE MANAGER" | FIND "cmd" && EXIT /F || TITLE SAVE MANAGER
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" GOTO 64
:32
SET PATH="..\..\..\Emulators\WinRAR x86";%PATH% && GOTO START
:64
SET PATH="..\..\..\Emulators\WinRAR x64";%PATH%
:START
SET "SAVE=..\..\..\SAVE\Windows\Ç∑Ç≠Ç£Å`ÇÈÉÅÉCÉgÇQÇ’ÇÁÇ∑!.sav"
SET "EXE=School Mate 2 Special.exe"
SET "DIR=.\data\"
RAR x -y -oni -- "%SAVE%" save "%DIR%"
RAR x -y -oni -- "%SAVE%" reg.reg .\
REG IMPORT reg.reg && DEL /f /q reg.reg
START "" "%EXE%"
:RUN
TASKLIST /fo:csv | FIND "%EXE%" && GOTO GAME /F || GOTO RUN
:GAME
TASKLIST /fo:csv | FIND "%EXE%" && TIMEOUT /T 3 && GOTO GAME /F || GOTO SAVE
:SAVE
REG EXPORT HKEY_CURRENT_USER\Software\illusion\SchoolMate2Special reg.reg
REG DELETE HKEY_CURRENT_USER\Software\illusion\SchoolMate2Special /f
DEL /f /q "%SAVE%" && RAR m -y -ep1 -- "%SAVE%" "%DIR%save" reg.reg
EXIT