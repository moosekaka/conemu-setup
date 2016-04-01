@echo off

:: Commands

DOSKEY ls=dir /d
DOSKEY np=notepad++.exe $*

:: Common directories

DOSKEY gh=cd "%USERPROFILE%\Documents\GitHub\$*"
DOSKEY ~= cd /d "%HOMEDRIVE%%HOMEPATH%"