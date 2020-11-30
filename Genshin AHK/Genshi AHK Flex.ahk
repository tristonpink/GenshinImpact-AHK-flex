 ;F1	+ Три карты
 ;F		+-Фаст лут
 ;Z		. Скип диалогов
 ;F3	. Автоходьба
 ;Space	+ Банихоп для станов
 ;F2	+-Оверлей с подсказками управления
 ;		. Отключить С'ЖАй кастсцены, если есть ветка в реестре
 ;		. Ведьмачье чутье
;===============================дерективы
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
setbatchlines,-1
Process, Priority,, High
SetKeyDelay,-1, -1
SetControlDelay, -1
SetMouseDelay, 0
SetWinDelay,-1
#SingleInstance force
DetectHiddenWindows, On
DetectHiddenText, On


;====================Подгрузка конфига: бинды
IniRead, key_map, data\genConfig.ini, Binds, key_map
IniRead, key_autowalk, data\genConfig.ini, Binds, key_autowalk
IniRead, key_overlay, data\genConfig.ini, Binds, key_overlay
IniRead, key_fastlyt, data\genConfig.ini, Binds, key_fastlyt
IniRead, key_skipNPS, data\genConfig.ini, Binds, key_skipNPS
IniRead, key_bhop, data\genConfig.ini, Binds, key_bhop
IniRead, key_vi4er_sens, data\genConfig.ini, Binds, key_vi4er_sens
IniRead, key_rapidfire, data\genConfig.ini, Binds, key_rapidfire ; 

;====================Подгрузка конфига: основные
IniRead, Brauzer, data\genConfig.ini, Setings, Brauzer ; выбор браузера

IniRead, Map2toggle, data\genConfig.ini, Setings, map
IniRead, sliderw, data\genConfig.ini, Setings, sliderw ; положение слайдера в гуи
IniRead, ONrapidfire, data\genConfig.ini, Setings, ONrapidfire ; рапидфаер вкл-выкл
IniRead, gameexe1337, data\genConfig.ini, Setings, GameExe	; исполняемый файл игры

IniRead, ONregreadDir, data\genConfig.ini, Setings, ONregreadDir ; поиск папки в реестре для откл кастсцен

IniRead, CheckboxRegDir, data\genConfig.ini, Setings, ONregreadDir

IniRead, DirGame, data\genConfig.ini, Setings, DirGame



If (ONregreadDir == 1) ; Если в конфиге путь к игре реестр вкл, то:
{
;=====================Реестр расположение папки с игрой
RegRead, DirVarGensh, HKEY_LOCAL_MACHINE, SOFTWARE\launcher, InstPath
}
If (ONregreadDir == 0)
{
DirVarGensh = %DirGame%
}

;Убрать рапидфаер
;If (ONrapidfire == 1) ; Если в конфиге рапидфаер вкл, то:
;{
;=====================Реестр рапидфаер сейв
;RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE, SOFTWARE\AHKflexGenshi, GUID, 1 ;записать в начале
;sleep 100
;======================запустить 2й поток для отзывчивости рапидфаера
;Run data\New-Thread.ahk
;Hotkey, Rbutton, Metkakey_rapidfire, on ; рапидфаер вкл
;}

;====================Положить хоткей в конфиг
Hotkey, ~%key_bhop%, Metkakey_bhop, on
Hotkey, ~%key_skipNPS%, Metkakey_skipNPS, on
Hotkey, ~%key_fastlyt%, Metkakey_fastlyt, on
Hotkey, %key_map%, Metkakey_map, on
Hotkey, %key_autowalk%, Metkakey_autowalk, on
Hotkey, %key_overlay%, Metkakey_overlay, on
Hotkey, ~%key_vi4er_sens%, Metkakey_key_vi4er_sens, on

;====================Настройки трея
Menu,Tray,NoStandard
Menu,Tray,DeleteAll
Menu,Tray, add, Setings, MetkaMenu1
Menu,Tray, Default , Setings
Menu,Tray, add
Menu,Tray, add, Reload, MetkaMenu3
Menu,Tray, add, Info, MetkaMenu2
Menu,Tray, add, Exit, MetkaMenu0
Menu Tray, Icon, data\genicon.ico

;====================Gui настройки
Random, RandomVarPNG, 1, 2
if (RandomVarPNG == 1)
	RandomVarPNGnext=data\1.png
if (RandomVarPNG == 2)
	RandomVarPNGnext=data\2.png
Gui, 1: Add, Picture, x0 y0 w710 h330, %RandomVarPNGnext%
Gui, 1: Add, GroupBox, x8 y8 w200 h80, Карта
Gui, 1: Add, ListBox, x16 y32 w109 h43 vList1488 AltSubmit, 1 - Старая карта|2 - Новая карта|3 - Чайна карта
Gui, 1: Add, Button, gpickmap x136 y40 w61 h23, Выбрать
Gui, 1: Add, GroupBox, x8 y96 w200 h227, Бинды
Gui, 1: Add, GroupBox, x560 y8 w139 h258, Доп. фишки
Gui, 1: Add, Text, x568 y32 w114 h23 +0x200 vText1, Путь к папке с игрой
Gui, 1: Add, Hotkey, x16 y120 w61 h21 vkey_map, %key_map%
Gui, 1: Add, Button, gcancelexit x640 y288 w43 h23, Cancel
Gui, 1: Add, Button, gsavegui x568 y288 w43 h23, Save
Gui, 1: Add, Text, x88 y120 w104 h23 +0x200 vText2, Карта
Gui, 1: Add, Hotkey, x16 y144 w61 h21 vkey_overlay, %key_overlay%
Gui, 1: Add, Text, x88 y144 w105 h23 +0x200 vText3, Оверлей
Gui, 1: Add, Hotkey, x16 y168 w61 h21 vkey_autowalk, %key_autowalk%
Gui, 1: Add, Text, x88 y168 w104 h23 +0x200 vText4, Автоходьба
Gui, 1: Add, Hotkey, x16 y216 w61 h21 vkey_skipNPS, %key_skipNPS%
Gui, 1: Add, Text, x88 y216 w103 h23 +0x200 vText5, Скип диалогов
Gui, 1: Add, Hotkey, x16 y192 w61 h21 vkey_fastlyt, %key_fastlyt%
Gui, 1: Add, Text, x88 y192 w103 h23 +0x200 vText6, Фастлут
Gui, 1: Add, Edit, x16 y240 w61 h21 +Disabled vkey_rapidfire, %key_rapidfire%
Gui, 1: Add, Text, hWndhTxt7 x136 y240 w66 h23 +Disabled +0x200 vText7, Рапидфаер
Gui, 1: Add, CheckBox, vCheckboxRaFi x88 y240 w45 h23 +Disabled Checked%ONrapidfire%, ON

Gui, 1: Add, Hotkey, x16 y264 w61 h21 vkey_vi4er_sens, %key_vi4er_sens%
Gui, 1: Add, Text, x88 y264 w105 h23 +0x200 vText8, Ведьмачье чутье
Gui, 1: Add, Slider, vsliderw x16 y288 w185 h29 Range3500-10000 ToolTip Center, %sliderw%
Gui, 1: Add, CheckBox, vCheckboxRegDir gCheckboxRegDirG x568 y56 w121 h23 Checked%ONregreadDir%, Автопуть с реестра

Gui, 1: Add, Edit, x568 y80 w92 h21 vEditDir +Disabled, %DirVarGensh%
Gui, 1: Add, Button, ggameway x664 y80 w23 h21, ...
Gui, 1: Add, Text, x568 y112 w120 h23 +0x200 vText9, Кастсцены CGI
Gui, 1: Add, Button, gOnCGI x568 y136 w43 h23, ON
Gui, 1: Add, Button, gOffCGI x640 y136 w43 h23, OFF
Gui, 1: Add, Text, x568 y160 w120 h23 +0x200, Резервный слот #1

Gui, 1: Add, Button, x568 y184 w43 h23, ???
Gui, 1: Add, Text, x568 y208 w120 h23 +0x200, Резервный слот #2
Gui, 1: Add, Button, x568 y232 w43 h23, ???

SendMessage, 0x50,, 0x4090409,, A
Gui, 1: Show, w710 h329, Genshi AHK Flex v2 by Kramar1337
Gui, 1: hide


;===============================Переменные
;windowcemucik1:="ahk_exe GenshinImpact.exe" ;окно игры
xSkip:=A_ScreenWidth*.7328
ySkip:=A_ScreenHeight*.7465
var0ov:=1 ;оверлей обозначить переменную
sleeper1:=1 ;слип для рапидфаера
;===============================Выбор карты
if (Map2toggle == 1)
{
GroupAdd, GroupNameMap1337, Genshin Impact Interactive World Map
GroupAdd, GroupNameMap1337, Интерактивная карта мира Genshin Impact
run_param:="https://genshin-impact-map.appsample.com/"
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


Path = "%A_ScriptDir%\data\paimon.gif"
;width := 184, height := 281
width := Round(A_ScreenWidth *.07187)
height := Round(A_ScreenHeight *.19513)
;MsgBox %width% %height% 

width2 := Round(A_ScreenWidth *.78125)
height2 := Round(A_ScreenHeight *.74305)
Gui, 99: Add, ActiveX, x%width2% y%height2% w%width% h%height% Disabled voIE, Shell.Explorer
oIE.Navigate("about:blank")
oIE.Document.Write("<body style=""overflow: hidden; margin: 0px""><img src=" Path " width=" width "px; height=" height "></body>" ) 
oIE.Document.close
GuiControl, 99: hide, oIE


Gui, 99: Add, Picture, w%HpBarW% h%HpBarH% x0 y0 vMyPictureVar1, data\genOverlay1.png
Gui, 99: Show, w%HpBarW% h%HpBarH% x%HpBarX% y%HpBarY%,
Gui, 99: Cancel

return

;===============================Банихоп
Metkakey_bhop:
IfWinActive, %gameexe1337%		;ahk_exe GenshinImpact.exe
{
Sleep 210
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
WinMinimize %gameexe1337% ;свернуть
IfWinExist, ahk_group GroupNameMap1337 ;если найдено окно с катрой то..
	{
WinMaximize ahk_group GroupNameMap1337 ;развернуть окно карты
WinActivate ahk_group GroupNameMap1337 ;сделать окно карты активным
	}
IfWinNotExist, ahk_group GroupNameMap1337 ;если окно карты не найдено то..
	{
run_path	= %Brauzer% -maximized
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
WinMaximize %gameexe1337%
WinActivate %gameexe1337%
}
return
;===============================Оверлей с подсказками
Metkakey_overlay:
sleep 50
overlay1toggle := !overlay1toggle
if (overlay1toggle)
{
WinMinimize %gameexe1337%
Gui, 99: Show, NoActivate
}
else
{
Gui, 99: Cancel
WinMaximize %gameexe1337%
}
return
;===============================Фастлут
Metkakey_fastlyt:
IfWinActive, %gameexe1337%
{
Sleep 100
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
SendInput {W down}
return
;===============================Скип диалогов
Metkakey_skipNPS:
IfWinActive, %gameexe1337%
{
Sleep 130
Loop
{
    GetKeyState, SpaceVar2, Z, P
    If SpaceVar2 = U
        break 
    Sleep 15
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

;=================================================Отключить кастсцены
OnCGI:
Gui, 1: Submit, NoHide
FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets, 1
FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication, 1
if (ErrorLevel == 1)
msgbox ,,, ErrorLevel - %ErrorLevel%,1
if (ErrorLevel == 0)
msgbox ,,, OK,1
Return

OffCGI:
Gui, 1: Submit, NoHide
FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets, 1
FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication, 1
if (ErrorLevel == 1)
msgbox ,,, ErrorLevel - %ErrorLevel%,1
if (ErrorLevel == 0)
msgbox ,,, OK,1
Return

;==================================================Сохраниться
savegui:
SendMessage, 0x50,, 0x4090409,, A
Gui, 1: Submit, NoHide
IniWrite, %key_map%, data\genConfig.ini, Binds, key_map
IniWrite, %key_autowalk%, data\genConfig.ini, Binds, key_autowalk
IniWrite, %key_overlay%, data\genConfig.ini, Binds, key_overlay
IniWrite, %key_fastlyt%, data\genConfig.ini, Binds, key_fastlyt
IniWrite, %key_skipNPS%, data\genConfig.ini, Binds, key_skipNPS
IniWrite, %key_vi4er_sens%, data\genConfig.ini, Binds, key_vi4er_sens

IniWrite, %sliderw%, data\genConfig.ini, Setings, sliderw

IniWrite, %CheckboxRegDir%, data\genConfig.ini, Setings, ONregreadDir
IniWrite, %CheckboxRaFi%, data\genConfig.ini, Setings, ONrapidfire
;WinClose, %A_ScriptDir%\data\New-Thread.ahk ahk_class AutoHotkey
Reload
Return

cancelexit:
Gui, 1: Cancel
Return


;============================================Указать путь к игре
gameway:
if (CheckboxRegDir == 0)
{
FileSelectFolder, DirVar228, ,3,Путь к папке с игрой `nПример "F:\Program Files\Genshin Impact"
if DirVar228 !=
{
GuiControl,1:, EditDir, %DirVar228%
Gui, 1: Submit, NoHide
IniWrite, %DirVar228%, data\genConfig.ini, Setings, DirGame
}
}
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

CheckboxRegDirG:
Gui, 1: Submit, nohide
If (CheckboxRegDir == 1) ; Если в конфиге путь к игре реестр вкл, то:
{
;=====================Реестр расположение папки с игрой
RegRead, DirVarGensh, HKEY_LOCAL_MACHINE, SOFTWARE\launcher, InstPath
GuiControl,1:, EditDir, %DirVarGensh%
IniWrite, 1, data\genConfig.ini, Setings, ONregreadDir
}
If (CheckboxRegDir == 0) ; Если в конфиге путь к игре реестр вкл, то:
{
IniRead, DirGame, data\genConfig.ini, Setings, DirGame
GuiControl,1:, EditDir, %DirGame%
}
IniWrite, 0, data\genConfig.ini, Setings, ONregreadDir
Return


;==================================================Переключить оверлей
~Left::
var0ov -= 1
if (var0ov > 6)
var0ov -= 1
if (var0ov < 1)
var0ov += 1
if (var0ov == 1)
{
if (zaglushka == 0)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: -Redraw, oIE
GuiControl, 99: hide, oIE
GuiControl, 99: ,MyPictureVar1, data\genOverlay1.png
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=1
}
}
if (var0ov == 2)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay2.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 3)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay3.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 4)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay4.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 5)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay5.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
if (var0ov == 6)
{
GuiControl, 99: -Redraw, MyPictureVar1

GuiControl, 99: ,MyPictureVar1, data\genOverlay6.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}
Return



;=====================================переключение оверлея Right
~Right::
var0ov += 1
if (var0ov > 6)
var0ov -= 1
if (var0ov < 1)
var0ov += 1
if (var0ov == 1)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: -Redraw, oIE
GuiControl, 99: hide, oIE
GuiControl, 99: ,MyPictureVar1, data\genOverlay1.png
GuiControl, 99: +Redraw, MyPictureVar1
}
if (var0ov == 2)
{
GuiControl, 99: -Redraw, MyPictureVar2

GuiControl, 99: ,MyPictureVar1, data\genOverlay2.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar2
zaglushka:=0
}
if (var0ov == 3)
{
GuiControl, 99: -Redraw, MyPictureVar3

GuiControl, 99: ,MyPictureVar1, data\genOverlay3.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar3
zaglushka:=0
}
if (var0ov == 4)
{
GuiControl, 99: -Redraw, MyPictureVar4

GuiControl, 99: ,MyPictureVar1, data\genOverlay4.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar4
zaglushka:=0
}
if (var0ov == 5)
{
GuiControl, 99: -Redraw, MyPictureVar5

GuiControl, 99: ,MyPictureVar1, data\genOverlay5.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar5
zaglushka:=0
}
if (var0ov == 6)
{
if (zaglushka == 0)
{
GuiControl, 99: -Redraw, MyPictureVar6

GuiControl, 99: ,MyPictureVar1, data\genOverlay6.png
GuiControl, 99: show, oIE
GuiControl, 99: +Redraw, MyPictureVar6
zaglushka:=1
}
}
Return

;~WheelUp::
;RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE, SOFTWARE\AHKflexGenshi, GUID, 1
;sleeper1:=1
;return
;~WheelDown::
;RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE, SOFTWARE\AHKflexGenshi, GUID, 1800
;sleeper1:=1800
;return


;Metkakey_rapidfire:
;IfWinActive, %gameexe1337%
;{
;Sendplay {R}
;sleep 1
;Loop
;{
;    GetKeyState, RButtonVar2, RButton, P
;    If RButtonVar2 = U
;        break
;	sleep 1
;}
;Sendplay {R}
;}
;IfWinNotActive, %gameexe1337%
;{
;SendInput {RButton}
;}
;return



#UseHook, On

metka-2-kli1:
  SetTimer, metka-2-kli2-start, off
Return
metka-2-kli2:
  SetTimer, metka-2-kli2-start, on
Return

#UseHook, Off
Metkakey_key_vi4er_sens:
IfWinActive, %gameexe1337%
{
  Pause_=300     ; настройки
  If not Second
  {
    Second=1
    SetTimer, DoublePress, -%Pause_%
  }
  Else
  {
    Second=0
    SetTimer, metka-2-kli2, -1
  }
}
Return

DoublePress:
  If not Second
    Return
  Second=0
  SetTimer, metka-2-kli1, -1
Return

metka-2-kli2-start:
SendInput {MButton down}
sleep %sliderw%
SendInput {MButton up}
;sleep 1
Return








MetkaMenu3:
Reload
sleep 100
Exitapp
Return



MetkaMenu0:
;WinClose, %A_ScriptDir%\data\New-Thread.ahk ahk_class AutoHotkey
;рапидфаер не зашел
sleep 100
exitapp
Return
MetkaMenu2:
MsgBox Gayshit Impact AHK flex by Kramar1337`n`nF1 - Карта`nF2 - Оверлей`nF3 - Автоходьба`nF - Фастлут`nZ - Скип диалогов`nX - Ведьмачье чутье`nSpace - Банихоп`nHome - Перезагрузка`nEnd - Завершить работу скрипта
Return





*~$Home::
Reload
sleep 100
Exitapp
Return
*~$End::
;WinClose, %A_ScriptDir%\data\New-Thread.ahk ahk_class AutoHotkey
;рапидфаер не зашел
sleep 100
Exitapp
