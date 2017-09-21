@echo off
cls
set version=1.0.0
set last_build=2017/09/21
set at=12:40

goto configuration_load

:configuration_load
title Remote Command Prompt (c) KcrPL. - Idle
if not exist %appdata%\CMDRemote md %appdata%\CMDRemote

if not exist %appdata%\CMDRemote\setting\device1\ md %appdata%\CMDRemote\setting\device1\
if not exist %appdata%\CMDRemote\setting\device2\ md %appdata%\CMDRemote\setting\device2\
if not exist %appdata%\CMDRemote\setting\device3\ md %appdata%\CMDRemote\setting\device3\
if not exist %appdata%\CMDRemote\setting\device4\ md %appdata%\CMDRemote\setting\device4\
if not exist %appdata%\CMDRemote\setting\device5\ md %appdata%\CMDRemote\setting\device5\

if not exist %appdata%\CMDRemote\setting\device1\name.txt set device1=Not_Set
if not exist %appdata%\CMDRemote\setting\device1\login.txt set device1=Not_Set
if not exist %appdata%\CMDRemote\setting\device2\name.txt set device2=Not_Set
if not exist %appdata%\CMDRemote\setting\device2\login.txt set device2=Not_Set
if not exist %appdata%\CMDRemote\setting\device3\name.txt set device3=Not_Set
if not exist %appdata%\CMDRemote\setting\device3\login.txt set device3=Not_Set
if not exist %appdata%\CMDRemote\setting\device4\name.txt set device4=Not_Set
if not exist %appdata%\CMDRemote\setting\device4\login.txt set device4=Not_Set
if not exist %appdata%\CMDRemote\setting\device5\name.txt set device5=Not_Set
if not exist %appdata%\CMDRemote\setting\device5\login.txt set device5=Not_Set

if exist %appdata%\CMDRemote\setting\device1\name.txt set /p device1=<%appdata%\CMDRemote\setting\device1\name.txt
if exist %appdata%\CMDRemote\setting\device2\name.txt set /p device2=<%appdata%\CMDRemote\setting\device2\name.txt
if exist %appdata%\CMDRemote\setting\device3\name.txt set /p device3=<%appdata%\CMDRemote\setting\device3\name.txt
if exist %appdata%\CMDRemote\setting\device4\name.txt set /p device4=<%appdata%\CMDRemote\setting\device4\name.txt
if exist %appdata%\CMDRemote\setting\device5\name.txt set /p device5=<%appdata%\CMDRemote\setting\device5\name.txt


:menu
cls
echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:
echo.
echo Choose device.
echo.
echo 1. %device1%
echo 2. %device2%
echo 3. %device3%
echo 4. %device4%
echo 5. %device5%
echo.
echo 61. Delete 1st entry, 62. Delete 2nd entry etc.
set /p s=Choose: 

set name=NUL
set login=NUL

if %s%==1 goto choose1
if %s%==2 goto choose2
if %s%==3 goto choose3
if %s%==4 goto choose4
if %s%==5 goto choose5
if %s%==61 rmdir /s /q %appdata%\CMDRemote\setting\device1\
if %s%==62 rmdir /s /q %appdata%\CMDRemote\setting\device2\
if %s%==63 rmdir /s /q %appdata%\CMDRemote\setting\device3\
if %s%==64 rmdir /s /q %appdata%\CMDRemote\setting\device4\
if %s%==65 rmdir /s /q %appdata%\CMDRemote\setting\device5\
goto configuration_load
:choose1
set /a selection=1
if %device1%==Not_Set goto set_new_device

if exist %appdata%\CMDRemote\setting\device%selection%\name.txt set /p device%selection%=<%appdata%\CMDRemote\setting\device1\name.txt
if exist %appdata%\CMDRemote\setting\device%selection%\login.txt set /p device%selection%=<%appdata%\CMDRemote\setting\device1\login.txt

goto login_screen

:choose2
set /a selection=2
if %device2%==Not_Set goto set_new_device

if exist %appdata%\CMDRemote\setting\device%selection%\name.txt set /p device%selection%=<%appdata%\CMDRemote\setting\device%selection%\name.txt
if exist %appdata%\CMDRemote\setting\device%selection%\login.txt set /p device%selection%=<%appdata%\CMDRemote\setting\device%selection%\login.txt

goto login_screen

:choose3
set /a selection=3
if %device3%==Not_Set goto set_new_device

if exist %appdata%\CMDRemote\setting\device%selection%\name.txt set /p device%selection%=<%appdata%\CMDRemote\setting\device%selection%\name.txt
if exist %appdata%\CMDRemote\setting\device%selection%\login.txt set /p device%selection%=<%appdata%\CMDRemote\setting\device%selection%\login.txt

goto login_screen
:choose4
set /a selection=4
if %device4%==Not_Set goto set_new_device

if exist %appdata%\CMDRemote\setting\device%selection%\name.txt set /p device%selection%=<%appdata%\CMDRemote\setting\device%selection%\name.txt
if exist %appdata%\CMDRemote\setting\device%selection%\login.txt set /p device%selection%=<%appdata%\CMDRemote\setting\device%selection%\login.txt

goto login_screen
:choose5
set /a selection=5
if %device5%==Not_Set goto set_new_device

if exist %appdata%\CMDRemote\setting\device%selection%\name.txt set /p device%selection%=<%appdata%\CMDRemote\setting\device%selection%\name.txt
if exist %appdata%\CMDRemote\setting\device%selection%\login.txt set /p device%selection%=<%appdata%\CMDRemote\setting\device%selection%\login.txt

goto login_screen

:set_new_device
cls
echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:
echo Set new remote device.
echo.
echo 1. Computer name (on the device list): (%name%)
echo 2. Login (computer name or IP in network): (\\%login%)
echo.
echo 3. Save
echo 4. Return to menu.
set /p s=
if %s%==1 goto nazwa_komputera
if %s%==2 goto login_komputera
if %s%==3 goto save_new_device
if %s%==4 goto menu
goto set_new_device

:nazwa_komputera
cls
echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:
echo Set new remote device:
echo :----:
set /p name=Computer name: 
goto set_new_device
:login_komputera
cls
echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:

echo Set new remote device:
echo :----:
set /p login=Login: \\
goto set_new_device

:save_new_device
cls	
if exist %appdata%\CMDRemote\setting\device%selection%\name.txt del /q %appdata%\CMDRemote\setting\device%selection%\name.txt
if exist %appdata%\CMDRemote\setting\device%selection%\login.txt del /q %appdata%\CMDRemote\setting\device%selection%\login.txt

echo %name%>>%appdata%\CMDRemote\setting\device%selection%\name.txt
echo %login%>>%appdata%\CMDRemote\setting\device%selection%\login.txt

goto configuration_load

:login_failed
cls
echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:

echo Connecting failed.
echo :---------------------:
echo SMB Share: [%smb_login_status%]
echo Testing if target is responding: [%responding_login_status%]
echo Checking Admin permissions on target: [%admin_login_status%]
pause>NUL
goto configuration_load

:login_screen

set /p login=<%appdata%\CMDRemote\setting\device%selection%\login.txt

cls
echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:

echo Connecting
echo :---------------------:
echo SMB Share: [..]
echo.
if exist \\%login%\CMD\online.txt goto connected_screen

set smb_login_status=FAIL
set responding_login_status=...
set admin_login_status=...
goto login_failed

:connected_screen
cls
echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:

echo Connecting
echo :---------------------:
echo SMB Share: [OK]
timeout 5 /nobreak >NUL
set target=Not_Set
goto connection_test_answer

:connection_test_answer
cls
echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:

echo Connecting
echo :---------------------:
echo SMB Share: [OK]
echo Testing if target is responding: [..]
set /a output=0
if exist \\%login%\CMD\command\answer.txt del /q \\%login%\CMD\command\answer.txt
if exist \\%login%\CMD\command\query.txt del /q \\%login%\CMD\command\query.txt

echo echo Working>>\\%login%\CMD\command\query.txt
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt set /p output=<\\%login%\CMD\command\answer.txt
if %output%==Working goto check_permissions_smb
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt set /p output=<\\%login%\CMD\command\answer.txt
if %output%==Working goto check_permissions_smb
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt set /p output=<\\%login%\CMD\command\answer.txt
if %output%==Working goto check_permissions_smb
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt set /p output=<\\%login%\CMD\command\answer.txt
if %output%==Working goto check_permissions_smb

set smb_login_status=OK
set responding_login_status=FAIL
set admin_login_status=...
goto login_failed

:check_permissions_smb
cls
echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:

echo Connecting
echo :---------------------:
echo SMB Share: [OK]
echo Testing if target is responding: [OK]
echo Checking Admin permissions on target: [..]
if exist \\%login%\CMD\command\answer.txt del /q \\%login%\CMD\command\answer.txt
if exist \\%login%\CMD\command\query.txt del /q \\%login%\CMD\command\query.txt	

echo AdminPerm>>\\%login%\CMD\command\query.txt

timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto check_permissions_smb_read
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto check_permissions_smb_read
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto check_permissions_smb_read
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto check_permissions_smb_read

set smb_login_status=OK
set responding_login_status=OK
set admin_login_status=FAIL

goto login_failed
:check_permissions_smb_read
set /p permission=<\\%login%\CMD\command\answer.txt

if exist \\%login%\CMD\command\answer.txt del /q \\%login%\CMD\command\answer.txt
if exist \\%login%\CMD\command\query.txt del /q \\%login%\CMD\command\query.txt

goto choose_menu_function
:choose_menu_function
if "%permission%"=="1 " title Remote Command Prompt (c) KcrPL. - Connected to \\%login% (Admin Permission on Target - Full Access)
if "%permission%"=="0 " title Remote Command Prompt (c) KcrPL. - Connected to \\%login% (Admin Permission on Target - Limited Access)
cls
echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:

echo Connected to (\\%login%) (Local - %username%, Target - %target%)
echo.
echo SMB Share: [OK]
echo Testing if target is responding: [OK]
if "%permission%"=="1 " echo Checking Admin permissions on target: [Full access]
if "%permission%"=="0 " echo Checking Admin permissions on target: [Limited access]
echo.
echo What to do now?
echo.
echo 1. Access Command Prompt
echo 2. Get remote user name
echo 3. Shutdown remote PC

set /p s=Choose:
if %s%==1 goto connection_test_ok
if %s%==2 goto get_target_user_name
if %s%==3 goto shutdown_remote_pc
goto choose_menu_function
:shutdown_remote_pc
cls
echo Do you really want to shutdown the remote PC? You will get disconnected.
echo.
echo 1. Yes
echo 2. NO NO NO
set /p s=Choose: 
if %s%==1 goto shutdown_do_it
if %s%==2 goto choose_menu_function
:shutdown_do_it
cls
echo Sending shutdown command...
echo.
if exist \\%login%\CMD\command\query.txt del /q \\%login%\CMD\command\query.txt
echo shutdown /s /t -1>>\\%login%\CMD\command\query.txt
goto shutdown_wait
:shutdown_wait
cls
echo Sending shutdown command... [OK]
echo.
echo PC status: ONLINE
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\online.txt goto shutdown_wait
goto shutdown_ok
:shutdown_ok
cls
echo Sending shutdown command... [OK]
echo.
echo PC status: OFFLINE [OK]
pause>NUL
goto configuration_load
:get_target_user_name
cls
echo Please wait...
echo.
echo Local: %username%
echo Target: Getting...

echo GetUSRname>>\\%login%\CMD\command\query.txt
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto set_target_user_name
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto set_target_user_name
timeout 5 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto set_target_user_name
echo Failed...
pause>NUL
goto choose_menu_function
:set_target_user_name
cls
set /p target=<\\%login%\CMD\command\answer.txt 
goto choose_menu_function

:connection_test_ok
cls

echo Remote Command Prompt (c) KcrPL. - v%version% (Compiled on %last_build% at %at%)
echo :-----------------------------:
echo OK! Ready. Type in exit to disconnect.
echo.
set /a connected_test=0
goto cmd_screen

:send_command
if "%s%"=="exit" goto choose_menu_function

if exist \\%login%\CMD\command\answer.txt del /q \\%login%\CMD\command\answer.txt
if exist \\%login%\CMD\command\query.txt del /q \\%login%\CMD\command\query.txt
echo.
echo %username% ---^> Target. (Sending command)
echo %s%>>\\%login%\CMD\command\query.txt
echo %username% ^<-- Target.  OK! (now, Waiting for output)
echo.
timeout 3 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto say_answer
timeout 3 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto say_answer
timeout 3 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto say_answer
timeout 3 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto say_answer
timeout 3 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto say_answer
timeout 3 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto say_answer
timeout 3 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto say_answer
timeout 3 /nobreak >NUL
if exist \\%login%\CMD\command\answer.txt goto say_answer

goto connection_error
:connection_error
echo.
echo ERROR: Connection error.
pause>NUL
goto configuration_load
:say_answer
echo (Target) %target%^>
type \\%login%\CMD\command\answer.txt

if exist \\%login%\CMD\command\exitcode.txt echo.
if exist \\%login%\CMD\command\exitcode.txt type \\%login%\CMD\command\exitcode.txt

if exist \\%login%\CMD\command\exitcode.txt del /q \\%login%\CMD\command\exitcode.txt
del /q \\%login%\CMD\command\answer.txt
goto cmd_screen
:cmd_screen
if %connected_test%==1 goto connection_test_answer
set /p s=(Local) %username%^>
goto send_command










