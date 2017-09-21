set /a correctsmb=0
set version=1.0.0
set last_build=2017/09/21
set at=12:41


@echo off
title Remote Command Prompt Server (c) KcrPL. - Working.
cls
echo Remote Command Prompt Server (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:
if exist \\%USERDOMAIN%\CMD\online.txt set /a correctsmb=1
if %correctsmb%==1 echo SMB Share [OK]
if %correctsmb%==0 echo SMB Share [ERROR]
echo.
if %correctsmb%==0 echo [INFO]: This program may work incorrectly.
echo [INFO]: This computer name is: \\%userdomain%
set /a command=0
if not exist %appdata%\CMD\command md %appdata%\CMD\command
if not exist %appdata%\CMD\online.txt echo online>>%appdata%\CMD\online.txt

if exist %appdata%\CMD\command\query.txt del /q %appdata%\CMD\command\query.txt
if exist %appdata%\CMD\command\answer.txt del /q %appdata%\CMD\command\answer.txt

set HH=%TIME: =0%
set HH=%HH:~0,2%
set MI=%TIME:~3,2%

echo.
echo Boot proccess successfull. (%hh%:%mi% / %date%)

:listening
timeout 5 /nobreak >NUL
if exist %appdata%\CMD\command\query.txt goto query
goto listening
:query
if exist %appdata%\CMD\command\exitcode.txt del %appdata%\CMD\command\exitcode.txt
set /p command=<%appdata%\CMD\command\query.txt
if "%command%"=="GetUSRname" goto user_name
if "%command%"=="AdminPerm" goto admin_perm_check
echo [INFO]: (Received)^>%command%
%command%>>%appdata%\CMD\command\answer.txt
set /a temperrorlev=%errorlevel%
del /q %appdata%\CMD\command\query.txt
if %temperrorlev%==0 goto listening
echo [Warning] Exit code: %temperrorlev%>>%appdata%\CMD\command\exitcode.txt
echo [Warning] Exit code: %temperrorlev%
goto listening


:admin_perm_check
if exist %appdata%\CMD\command\answer.txt del /q %appdata%\CMD\answer.txt
if exist %appdata%\CMD\command\query.txt del /q %appdata%\CMD\command\query.txt
echo [INFO] Checking permissions
net session>NUL
set /a temperrorlev=%errorlevel%


if "%temperrorlev%"=="0" echo 1 >>%appdata%\CMD\command\answer.txt
if "%temperrorlev%"=="0" goto listening
if "%temperrorlev%"=="2" echo 0 >>%appdata%\CMD\command\answer.txt
if "%temperrorlev%"=="2" goto listening

echo [Error] Admin Perm check variables skipped.
goto listening
:user_name
echo [INFO] Sending User Name (%username%)
if exist %appdata%\CMD\command\answer.txt del /q %appdata%\CMD\command\answer.txt
if exist %appdata%\CMD\command\query.txt del /q %appdata%\CMD\command\query.txt
echo %username%>>%appdata%\CMD\command\answer.txt
goto listening
