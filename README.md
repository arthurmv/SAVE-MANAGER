# SAVE-MANAGER
Save game manager scripts for keep some or all save games orderly and portables.

## Requirements
- Windows OS
- WinRAR CLI
- The game obviously

Download WinRAR CLI from [here](https://www.rarlab.com/download.htm).

## Instructions
Place START.BAT and START.VBS into root game directory. Run VBS file for play game with hidden manager.

I recommend use portable paths or make environment variables for keep all portable. Also tries same directory level in every game for use parent or grant-parent directory paths like examples located below.

- Find `SET PATH="..\..\..\Emulators\WinRAR x*"` and replace with your own **WinRAR** path. Use diferent folders for x86 and x64 binaries.
- Find `SET "SAVE=..\..\..\SAVE\Windows\*.sav"` and reaplce with your own **save** path.
