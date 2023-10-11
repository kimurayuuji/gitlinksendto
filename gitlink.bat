@echo off
set current=%~dp0

cmd /c ""C:\Program Files\Git\bin\bash.exe" -i %current%gitlab.sh %1"
