# SAVE-MANAGER
Save game manager scripts for keep some or all save games orderly and portables.

## Requirements
- Windows OS
- WinRAR CLI
- The game obviously

Download WinRAR CLI from [here](https://www.rarlab.com/download.htm).

## Instructions
Place START.BAT and START.VBS into root game directory. Run VBS file for play game with hidden manager.

I recommend use portable paths or make environment variables for keep all portable. Also tries same directory level in every game for use parent or grant-parent directory paths like examples located below, this way you only need to type one path and copy/paste everything else. 

- Find `SET PATH="..\..\..\Emulators\WinRAR x*"` and replace with your own **WinRAR** CLI path. Use diferent folders for x86 and x64 binaries.
- Find `SET "SAVE=..\..\..\SAVE\Windows\*.sav"` and reaplce with your own **save** path.
- Find `SET "DIR=..\Steam\userdata\*\"` and reaplce with your Steam user data folder path. This for **Steam games only**.

If you have same game but diferent game provider find `START steam://rungameid/*` or whatever you found with `START` command and reaplace with file name game or URL access like `dmmgameplayer://*/*/*/*`.
