#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
Menu,Tray, NoStandard
Menu,Tray, DeleteAll
Menu,Tray, Add, Exit, MetkaMenu2
Menu,Tray, Default , Exit
Menu,Tray, Icon, %A_ScriptDir%\timer_clock.ico,,1



SoundBeep, 400, 400
Sleep (3 * 60 * 1000) 	;==========3 минуты
ToolTip, 3 min, 0, 0
sleep 1000
SoundBeep, 600, 200
SoundBeep, 700, 200
ToolTip,, 0, 0
Sleep (1 * 60 * 1000) 	;==========4 минуты
ToolTip, 4 min, 0, 0
sleep 1000
SoundBeep, 700, 200
SoundBeep, 800, 200
ToolTip,, 0, 0
Sleep (1 * 60 * 1000) 	;==========5 минуты
ToolTip, 5 min, 0, 0
sleep 1000
SoundBeep, 800, 200
SoundBeep, 900, 200
ToolTip,, 0, 0
ExitApp
MetkaMenu2:
ExitApp
*~$End::
ExitApp



