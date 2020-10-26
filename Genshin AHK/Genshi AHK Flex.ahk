
 ;F1	+ Три карты
 ;F		+-Фаст лут
 ;Z		. Скип диалогов
 ;F3	. Автоходьба
 ;Space	+ Банихоп для станов
 ;F2	+-Оверлей с подсказками управления
 ;		. Отключить С'ЖАй кастсцены, если есть ветка в реестре
 ;		. Принудительно отключить драйвер античита
 ;		. Очистить логи античита

;===============================дерективы
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
setbatchlines,-1
PID := DllCall("GetCurrentProcessId")
Process, Priority, %PID%, High
SetKeyDelay,-1, 8
SetControlDelay, -1
SetMouseDelay, 0
SetWinDelay,-1
#SingleInstance force
DetectHiddenWindows, On
DetectHiddenText, On

;=====================Реестр расположение папки с игрой
;RegRead, DirVarGensh, HKEY_LOCAL_MACHINE, SOFTWARE\launcher, InstPath
;====================Подгрузка конфига
IniRead, Map2toggle, data\genConfig.ini, Setings, map

IniRead, key_map, data\genConfig.ini, Binds, key_map
IniRead, key_autowalk, data\genConfig.ini, Binds, key_autowalk
IniRead, key_overlay, data\genConfig.ini, Binds, key_overlay
;====================Положить хоткей в конфиг
Hotkey, %key_map%, Metkakey_map, on
Hotkey, %key_autowalk%, Metkakey_autowalk, on
Hotkey, %key_overlay%, Metkakey_overlay, on
;====================Настройки трея
Menu,Tray,NoStandard
Menu,Tray,DeleteAll
Menu,Tray, add, Setings, MetkaMenu1
Menu,Tray, Default , Setings
Menu,Tray, add
Menu,Tray, add, Info, MetkaMenu2
Menu,Tray, add, Exit, MetkaMenu0
Menu Tray, Icon, data\genicon.ico

;====================Gui настройки
Path = "%A_ScriptDir%\data\paimon.gif"
width := 184, height := 281
Gui, 1: Add, ActiveX, x155 y0 w%width% h%height% Disabled voIE, Shell.Explorer
oIE.Navigate("about:blank")
oIE.Document.Write("<body style=""overflow: hidden; margin: 0px""><img src=" Path " width=" width "px; height=" height "></body>" ) 
oIE.Document.close
Gui, 1: Add, Picture, x152 y0 w184 h281 gPicGithub, data\paimon.jpg
Gui, 1: Add, GroupBox, x8 y0 w139 h105, Карта
Gui, 1: Add, ListBox, x16 y16 w120 h43 vList1488 AltSubmit, 1 - Старая карта|2 - Новая карта|3 - Чайна карта
Gui, 1: Add, Button, gpickmap x32 y72 w80 h23, Выбрать
Gui, 1: Add, GroupBox, x8 y112 w138 h164, Бинды
Gui, 1: Add, Text, x16 y128 w120 h23 +0x200, Карта
Gui, 1: Add, Hotkey, x16 y152 w120 h21 vkey_map, %key_map%
Gui, 1: Add, Text, x16 y176 w120 h23 +0x200, Псевдооверлей
Gui, 1: Add, Hotkey, x16 y200 w120 h21 vkey_overlay, %key_overlay%
Gui, 1: Add, Text, x16 y224 w120 h23 +0x200, Автоходьба
Gui, 1: Add, Hotkey, x16 y248 w120 h21 vkey_autowalk, %key_autowalk%
Gui, 1: Add, Button, gcancelexit x424 y248 w67 h23, Cancel
Gui, 1: Add, Button, gsavegui x344 y248 w67 h23, Save
Gui, 1: Add, GroupBox, x344 y0 w152 h242, Дополнительные фишки
Gui, 1: Add, Text, x352 y16 w120 h23 +0x200, Путь к папке с игрой
Gui, 1: Add, Edit, x352 y64 w107 h21 vEditDir +Disabled, %DirVarGensh%
Gui, 1: Add, Button, ggameway x464 y64 w23 h21, ...
Gui, 1: Add, CheckBox, x352 y40 w120 h23 +Checked +Disabled, Автопуть с реестра
Gui, 1: Add, Text, x352 y88 w136 h23 +0x200, Отключить CGI кастсцены
Gui, 1: Add, Button, gcgioff x352 y112 w62 h23, CGI Off
Gui, 1: Add, Button, gcgion x424 y112 w62 h23, CGI On
Gui, 1: Add, Text, x352 y144 w135 h23 +0x200, Очистить логи (kmlog.log)
Gui, 1: Add, Button, gKmDelete x352 y168 w135 h18, KmDelete
Gui, 1: Add, Text, x352 y192 w136 h23 +0x200, Запаузить античит
Gui, 1: Add, Button, ganticheatpause x352 y216 w135 h18, Pause
;===============================Переменные
windowcemucik1:="ahk_exe GenshinImpact.exe" ;окно игры
xSkip:=A_ScreenWidth*.7328
ySkip:=A_ScreenHeight*.7465
var0ov:=1 ;оверлей обозначить переменную
;===============================Выбор карты
if (Map2toggle == 1)
{
GroupAdd, GroupNameMap1337, Genshin Impact Interactive World Map
GroupAdd, GroupNameMap1337, Интерактивная карта мира Genshin Impact
run_param:="https://genshin-impact-map.appsample.com/#/"
}
if (Map2toggle == 2)
{
GroupAdd, GroupNameMap1337, Genshin Impact Interactive Map | Map Genie
GroupAdd, GroupNameMap1337, Интерактивная карта воздействия Геншина | Карта Genie
run_param:="https://mapgenie.io/genshin-impact/maps/teyvat"
}
if (Map2toggle == 3)
{
GroupAdd, GroupNameMap1337, Оригинальная карта бога
GroupAdd, GroupNameMap1337, 原神地图
run_param:="https://yuanshen.site/"
}

;===============================Оверлей создание
HpBarW:=A_ScreenWidth
HpBarH:=A_ScreenHeight
HpBarX:=0
HpBarY:=0
Gui, 99: +AlwaysOnTop +ToolWindow -Caption +LastFound
WinSet, TransColor, 12345
Gui, 99: Color, 12345
Gui, 99: Add, Picture, w%HpBarW% h%HpBarH% x0 y0 vMyPictureVar1, data\genOverlay1.png
Gui, 99: Show, w%HpBarW% h%HpBarH% x%HpBarX% y%HpBarY%,
Gui, 99: Cancel
;===============================Банихоп
*~$Space::
IfWinActive, ahk_exe GenshinImpact.exe		;возможно конфликт с картой
{
Sleep 130
Loop
{
    GetKeyState, SpaceVar1, Space, P
    If SpaceVar1 = U
        break 
    Sleep 1
    Sendplay, {Blind}{Space}
}
}
return
;===============================Карта
Metkakey_map:
sleep 50
toggle1 := !toggle1
if (toggle1)
{
WinMinimize %windowcemucik1% ;свернуть
IfWinExist, ahk_group GroupNameMap1337 ;если найдено окно с катрой то..
	{
WinMaximize ahk_group GroupNameMap1337 ;развернуть окно карты
WinActivate ahk_group GroupNameMap1337 ;сделать окно карты активным
	}
IfWinNotExist, ahk_group GroupNameMap1337 ;если окно карты не найдено то..
	{
run_path	:= "chrome.exe -maximized"
Run,%run_path%  %run_param% ;подрубить хром и завести карту
loop 7
{
IfWinExist, ahk_group GroupNameMap1337 ;ожидание окна карты
{
sleep 100
WinMaximize ahk_group GroupNameMap1337 ;максимизировать окно
sleep 100
WinActivate ahk_group GroupNameMap1337 ;сделать активным
break
}
sleep 900
}
	}
}
else
{
WinMinimize ahk_group GroupNameMap1337
WinMaximize %windowcemucik1%
WinActivate %windowcemucik1%
}
return
;===============================Оверлей с подсказками
Metkakey_overlay:
sleep 50
overlay1toggle := !overlay1toggle
if (overlay1toggle)
{
WinMinimize ahk_exe GenshinImpact.exe
Gui, 99: Show, NoActivate
}
else
{
Gui, 99: Cancel
WinMaximize ahk_exe GenshinImpact.exe
}
return
;===============================Фастлут
*~$F::
IfWinActive, ahk_exe GenshinImpact.exe
{
Sleep 75
Loop
{
    GetKeyState, SpaceVar2, F, P
    If SpaceVar2 = U
        break 
    Sleep 1
    Sendplay, {Blind}{F}
	SendInput, {Blind}{WheelDown}
}
}
return
;===============================Автоходьба
Metkakey_autowalk:
sleep 50
sendplay {W down}
return
;===============================Скип диалогов
*~$Z::
IfWinActive, ahk_exe GenshinImpact.exe
{
Sleep 130
Loop
{
    GetKeyState, SpaceVar2, Z, P
    If SpaceVar2 = U
        break 
    Sleep 1
Click %xSkip% %ySkip%
}
}
return

;==================================================Работа с Gui метками
;==================================================Работа с Gui метками
MetkaMenu1:
Gui, 1: Show
Return

;==================================================Открыть гитхаб
PicGithub:
MsgBox Заглушка Открыть гитхаб
Return

;==================================================приостановить античит
anticheatpause:
Run,%comspec% /c sc stop mhyprot2.sys & TIMEOUT 3
Return

;==================================================чистим логи
KmDelete:
FileDelete, c:\windows\kmlog.log
Run,%comspec% /c cd c:\windows & del kmlog.log kmlog.log & TIMEOUT 3
Return

cgioff:
MsgBox Заглушка Отключить сжай
Return

cgion:
MsgBox Заглушка Включить сжай
Return
;==================================================Сохраниться
savegui:
Gui, 1: Submit, NoHide
IniWrite, %key_map%, data\genConfig.ini, Binds, key_map
IniWrite, %key_autowalk%, data\genConfig.ini, Binds, key_autowalk
IniWrite, %key_overlay%, data\genConfig.ini, Binds, key_overlay
Reload
Return

cancelexit:
Gui, 1: Cancel
Return

gameway:
MsgBox Заглушка Путь к папке с игрой
Return
;==================================================Выбор карты
pickmap:
Gui, 1: Submit, nohide
if list1488 = 1
IniWrite, 1, data\genConfig.ini, Setings, map
if list1488 = 2
IniWrite, 2, data\genConfig.ini, Setings, map
if list1488 = 3
IniWrite, 3, data\genConfig.ini, Setings, map
Return
;==================================================Переключить оверлей
~Left::
var0ov -= 1
if (var0ov > 6)
var0ov -= 1
if (var0ov < 1)
var0ov += 1

;===============переключение оверлея Left
if (var0ov == 1)
{
if (zaglushka == 0)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay1.png
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=1
}
}
if (var0ov == 2)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay2.png
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 3)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay3.png
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 4)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay4.png
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 5)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay5.png
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 6)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay6.png
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
;tooltip %var0ov%
Return


~Right::
var0ov += 1
if (var0ov > 6)
var0ov -= 1
if (var0ov < 1)
var0ov += 1
;===============переключение оверлея Right
if (var0ov == 1)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay1.png
GuiControl, 99: +Redraw, MyPictureVar1
}
if (var0ov == 2)
{
GuiControl, 99: -Redraw, MyPictureVar2
GuiControl, 99: ,MyPictureVar1, data\genOverlay2.png
GuiControl, 99: +Redraw, MyPictureVar2
zaglushka:=0
}
if (var0ov == 3)
{
GuiControl, 99: -Redraw, MyPictureVar3
GuiControl, 99: ,MyPictureVar1, data\genOverlay3.png
GuiControl, 99: +Redraw, MyPictureVar3
zaglushka:=0
}
if (var0ov == 4)
{
GuiControl, 99: -Redraw, MyPictureVar4
GuiControl, 99: ,MyPictureVar1, data\genOverlay4.png
GuiControl, 99: +Redraw, MyPictureVar4
zaglushka:=0
}
if (var0ov == 5)
{
GuiControl, 99: -Redraw, MyPictureVar5
GuiControl, 99: ,MyPictureVar1, data\genOverlay5.png
GuiControl, 99: +Redraw, MyPictureVar5
zaglushka:=0
}
if (var0ov == 6)
{
if (zaglushka == 0)
{
GuiControl, 99: -Redraw, MyPictureVar6
GuiControl, 99: ,MyPictureVar1, data\genOverlay6.png
GuiControl, 99: +Redraw, MyPictureVar6
zaglushka:=1
}
}
;tooltip %var0ov%
Return





MetkaMenu0:
exitapp
Return
MetkaMenu2:
MsgBox Genshin Impact AHK flex by Kramar1337`n`nF1 - Карта`nF2 - Оверлей`nF3 - Автоходьба`nF - Фастлут`nZ - Скип диалогов`nSpace - Банихоп`nHome - Перезагрузка`nEnd - Завершить работу скрипта
Return





Home::
Reload
End::
Exitapp
