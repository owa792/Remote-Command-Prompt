# Remote Command Prompt
This tool will let you run Command prompt (cmd.exe) from computer 2 on computer 1 and it will let you do command remotely.

Be sure to Star and "Watch" this repository so you won't miss any updates ;)

<b>(This tool is still being developed. It can be buggy. If you discover any bug, please go to ![Issues](https://github.com/KcrPL/Remote-Command-Prompt/issues) and let me know about it</b>

[![License](https://img.shields.io/github/license/KcrPL/Remote-Command-Prompt.svg?style=flat-square)](http://www.gnu.org/licenses/agpl-3.0)
![Version Badge](https://img.shields.io/github/release/KcrPL/Remote-Command-Prompt.svg?style=flat-square)

# Instructions
1) Download the 2 files. Download it from ![here](https://github.com/KcrPL/Remote-Command-Prompt/releases)
2) On the Target computer (let's name it Computer 2) (the one that will do commands) run Server.bat. It will create a folder in `%appdata%` called `CMD`.
3) Open `%appdata%` (In start menu type `%appdata%` and press ENTER).
4) Find folder called `CMD`, right click it and go to `Proporties` -> go to `Sharing` tab -> `Advanced Sharing` -> Check "`Share this folder`" -> `Permissions` -> Check "`Full Controll`" -> `Save`.
5) Now if you want to make the Server.bat start on Startup please open folder `Server AutoStartup` and run `Startup Installer.bat`. It will copy the `Server.exe` to startup folder. After that, restart your computer. <b>THE SERVER.EXE WILL BE HIDDEN SO AFTER STARTUP NOBODY WILL NOTICE IT AND THE COMPUTER WILL BE READY TO RECEIVE COMMANDS</b>
6) On your computer (Computer 1) open `Remote_Console.bat`. Than configure it.
7) When configuring `Remote_Console.bat` (Right now) you can save up to 5 configurations. (Computer name stands for a name that will show in the main screen and login stands for IP address of the computer that your trying to access or name in network.) <b>IF YOU DON'T KNOW THE IP ADDRESS, YOU SHOULD SEE THE COMPUTER NAME ON SERVER.BAT</b>.
8) Wait for the computers to connect.
9) Have fun with remote Command Prompt. You can use it for troubleshooting or for trolling your friends ;).

<b>Soon i'm going to make a version of `Server.bat` so it can run in background without anybody noticing it.</b>

>Info: Every command takes about 3 to 5 seconds to send to Computer 2 and than get back to Computer 1. After 25 seconds you get <b>timeout error</b>.

If you have any problems, contact me! My email: kcrplkcrpl@gmail.com

![](https://i.imgur.com/jOcx8zH.png)
