@echo off
SETLOCAL EnableDelayedExpansion
::set /p path=Enter path 
if not exist %1\ (
echo Not exist
exit
)
set filename=
set filesize=0
for /f "delims=" %%i in ('dir /b /S %1\*.txt') do (
	if %%~zi GTR !filesize! (
		set filesize=%%~zi
		set filename=%%i
	)
)
echo Bytes: %filesize% > result2.txt
for /f "tokens=3 delims=:" %%i in ('find /v /c "" %filename%') do (set words=%%i)
echo Words: %words% >> result2.txt
::for /f "tokens=3 delims=:" %%i in ('find /c /v "" %filename%') do set lines=%%i
echo Characters: %filesize% >> result2.txt
for /f %%i in (%filename%) do (set /a lines+=1)
echo Lines: %lines% >> result2.txt