; ==============================Genshin AHK by Kramar1337==================
/*
AHK
F1 - *Карта
F2 - *Оверлей
F3 - *Автоходьба
F - Фастлут
Z - Скип диалогов
X - Ведьмачье чутье (дабл клик вкл, сингл клик выкл)
N - Плавание
Space - Банихоп
Left - Пролистать оверлей
Right - Пролистать оверлей
End - Завершить работу скрипта
Page Up - *Приостановить-Возобновить работу скрипта
V - Macro Key
Numpad 0 - Включить/отключить банихоп
Numpad 1 - Стрельба на Amber по легиту но нужно быть в движении на +W
Numpad 2 - Стрельба на Fischl по легиту но нужно быть в движении на +W
Numpad 3 - Xiangling DragonStrike
Numpad 4 - Fischl и Amber рейдж +W
Numpad 5 - Venti Ganyu Yoimiya MachineGun
Numpad 6 - Klee Сombo
Numpad 7 - Diluc+Beidou DragonStrike
Numpad 8 - Noelle DragonStrike
Numpad 9 - Eula DragonStrike
Numpad + - Klee

Python
Tab + ~(тильт или Ё) - Обновить список мелодий
Tab + 1 2 3 4 5 6 7 8 9 0 - Воспроизвести мелодию на лире ветров
Tab + Space - Остановить воспроизведение

ReShade
Home - Открыть ReShade меню
Insert - Включить/отключить ReShade

Windows Shortcut
CTRL-ALT-Numpad0 - Запустить ярлык GenshAHK.lnk





Список карт:
Карта от официалов
https://webstatic-sea.mihoyo.com/app/ys-map-sea/

Самая первая карта
https://genshin-impact-map.appsample.com/

2я карта
https://mapgenie.io/genshin-impact/maps/teyvat

Китайская карта
https://yuanshen.site/

Нонейм1 карта
https://mapofgenshin.com/

Нонейм2 карта
https://map.genshinpact.com/

Нонейм3 карта, от RU челов
https://genshin-info.ru/interaktivnaya-karta/


Изменения: 17.08.2021
 - Бинд на карту поддерживает многомониторную конфигурацию ПК, тестить некому так что хз как оно работает, в оконный без рамок идеально работает с ярлыком (-popupwindow) и реестр "Screenmanager Is Fullscreen mode = 0"
 - На SendInput режиме не работал макрос на стрельбу из лука на эмбер
 - Скрипт запускает сам себя от имени администратора если режим SendInput или WinApi

Изменения: 16.08.2021
 - Задержка срабатывания бхопа +15мс по дефолту
 - Добавлена возможность настроить задержку срабатывания "Бхопа"
 - Вернул старый оверлей стр 7

Изменения: 15.08.2021
 - Макросы мешают писать в чат, GUI"FIX Macro + chat" исправлено для "Плавание" и "Macro Key" DllCall"GetCursorInfo" Result1337 <> 0
 - Вернул джамп кансел на Klee "Numpad +"

Изменения: 14.08.2021
 - Кнопка приостанавливающая работу скрипта KEY"Page Up" шо это за кнопка? расположена рядом с кнопкой "Home"
 - Чекбокс "Максимальная скорость", если при работе скрипта игра лагает то снять галку и скрипт перейдет в медленный режим

Изменения: 12.08.2021
 - Изменено содержимое оверлея, стр 4 оружие и герои

Изменения: 10.08.2021
 - Не работает автопуть с реестра, на релизе путь в одном месте в реестре, через год в другом, автопуть взял тут "UninstallString"
 - Оверлей на ноутах с задушеным масштабированием? разрешением? плотностью пикселей? работает правильно, GUI"FIX Overlay Scale"

Изменения: 04.08.2021
 - Изменил темп сао опенинга в .mid(главное изменение этого патча) в FL Studio 20

Изменения: 02.08.2021
 - RCS WinApi Bow, Двигать камеру вместе с макросом на нампад 4 и 5
 - Переключение бхопа, бхоп мешает плавать на лодочке и кнопка KEY"нампад 0" переключает бхоп вкл-выкл
 - Исправил переключатель на карте, F1 стал умнее
 - В трее добавил кнопку TRAY"Создать ярлык" которая биндит CTRL-ALT-Numpad0 для запуска ярлыка, хз почему но ярлык работает даже с неймченжером
 - Мелкие исправления, шифт блочил работу кнопок, исправлено 2 кнопки

Изменения: 31.07.2021
 - Добавлен драг анд дропс(перетаскивание) в GUI для песен лиры ветров

Изменения: 29.07.2021
 - Фвтоходьбу переделать
 - Изменил логику оверлея, кликабельные кнопки GUI"листать оверлей" в гуи
 - Почистил решейд
 - Сделал дефолт ВинАпи режим ввода
 - Переделал Гуи
 - Не скрывать меню Гуи

Изменения: 05.2021
 - Большая обнова изменено все
 - Решейд
 
Изменения: 11.2020
 - Фастлут
 - Скип диалогов
*/

;========================================================запускать самого себя от имени администратора
IniRead, metodVvoda, data\genConfig.ini, Setings, metodVvoda
if (metodVvoda == 1 or metodVvoda == 3)
{
CommandLine := DllCall("GetCommandLine", "Str")
If !(A_IsAdmin || RegExMatch(CommandLine, " /restart(?!\S)")) {
    Try {
        If (A_IsCompiled) {
            Run *RunAs "%A_ScriptFullPath%" /restart
        } Else {
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
        }
    }
    ExitApp
}
}

;===============================дерективы
WinName:= "Genshi AHK Flex v4.3 by Kramar1337"
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
#SingleInstance force
DetectHiddenWindows, On
DetectHiddenText, On
CoordMode Mouse, Screen


;===============================дерективы из конфига для работы на слабых ПК
IniRead, Highperformancemode, data\genConfig.ini, Setings, Highperformancemode
if Highperformancemode
{
Process, Priority,, High
Setbatchlines,-1
SetKeyDelay,-1, -1
SetControlDelay, -1
SetMouseDelay, -1
SetWinDelay,-1
}
; MsgBox %A_BatchLines%`n%A_KeyDelay%`n%A_ControlDelay%`n%A_MouseDelay%`n%A_WinDelay%





;=====================================безопасность
IniRead, ScWinrenamer, data\genConfig.ini, Setings, ScWinrenamer ; проверка Winrenamer
IniRead, ScRenamer, data\genConfig.ini, Setings, ScRenamer ; проверка Renamera
IniRead, ScHachCh, data\genConfig.ini, Setings, ScHachCh ; проверка ScHachCh
IniRead, ScRandomT, data\genConfig.ini, Setings, ScRandomT ; проверка рандом таймер
IniRead, ScOverlay, data\genConfig.ini, Setings, ScOverlay ; проверка uid overlay



If ScHachCh
{
FileRead, FileReadOutputVar1, %A_ScriptFullPath%
Random, rand1488, 20, 30
password := gen_password(rand1488)
1RepFile1 = AntiVACHashChanger:="\w*"
2RepFile2 = AntiVACHashChanger:="%password%%password%%password%%password%"
RegExRepFile1 := RegExReplace(FileReadOutputVar1, 1RepFile1, 2RepFile2)
FileEncoding UTF-8
FileDelete, %A_ScriptFullPath%
FileAppend, %RegExRepFile1%, %A_ScriptFullPath%
}
If ScRenamer
{
Random, rand1488, 10, 14
password := gen_password(rand1488)										;вызов функции в переменную (длина)
FileMove, %A_ScriptFullPath%, %A_ScriptDir%\%password%.ahk
savereloadvar = %A_ScriptDir%\%password%.ahk
}
If ScOverlay
{
Gui,uid: +AlwaysOnTop +ToolWindow -Caption +LastFound +E0x20
Gui,uid: Color, 0x000000
Random, rand1488, 33, 35
password := gen_password(rand1488)	
;получить координаты 1 и 2 точки и вычесть 3 и 4
HpBarW2:=round((ScreenWidthRe1*.9695) - (ScreenWidthRe1*.8738))
HpBarH2:=round((ScreenHeightRe1*.9965) - (ScreenHeightRe1*.9743))
HpBarX2:=round(ScreenWidthRe1*.8738)
HpBarY2:=round(ScreenHeightRe1*.9743)
; MsgBox %HpBarW2% %HpBarH2% %HpBarX2% %HpBarY2%
Gui,uid: Show, w%HpBarW2% h%HpBarH2% x%HpBarX2% y%HpBarY2%, %password%
;==============
}


Global metodVvoda 	;зарегать глобальную переменную для режимов ввода: 1 input, 2 play, 3 winapi

;======разбросано 5 шт
AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"

;=======================список клавиш на клавиатуре и мышке

CheckVarKey1MatchList := "LButton,RButton,MButton,WheelDown,WheelUp,XButton1,XButton2,Space,Tab,Enter,Enter,Backspace,Return,Esc,BS,Delete,Del,Insert,Insert,Home,End,PgUp,PgDn,Up,Down,Left,Right,ScrollLock,CapsLock,NumLock,NumpadDiv,NumpadMult,NumpadAdd,NumpadSub,NumpadEnter,NumpadDel,NumpadIns,NumpadClear,NumpadUp,NumpadDown,NumpadLeft,NumpadRight,NumpadHome,NumpadEnd,NumpadPgUp,NumpadPgUp,NumpadDot,AppsKey,AppsKey,RWin,Control,Alt,Shift,LControl,LControl,RControl,RCtrl,LShift,RShift,LAlt,LAlt,RAlt,CtrlBreak,Pause,Break"
CheckVarKey2MatchList := "F1,F2,F3,F4,F5,F5,F6,F8,F9,F10,F10,F12,0,1,2,3,4,5,5,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,Numpad0,Numpad1,Numpad2,Numpad3,Numpad4,Numpad5,Numpad6,Numpad7,Numpad8,Numpad9"
CheckVarKey3MatchList := "Help,Browser_Back,Browser_Refresh,Browser_Stop,Browser_Search,Browser_Search,Browser_Home,Volume_Mute,Volume_Down,Volume_Up,Media_Next,Media_Prev,Media_Stop,Media_Play_Pause,Launch_Mail,Launch_Media,Launch_App1,Launch_App2"
CheckVarKey4MatchList := "vk08,vk09,vk0D,vk10,vk11,vk12,vk13,vk14,vk1B,vk20,vk21,vk22,vk23,vk24,vk25,vk26,vk27,vk28,vk2D,vk2E,vk30,vk31,vk32,vk33,vk34,vk35,vk36,vk37,vk38,vk39,vk41,vk42,vk43,vk44,vk45,vk46,vk47,vk48,vk49,vk4A,vk4B,vk4C,vk4D,vk4E,vk4F,vk50,vk51,vk52,vk53,vk54,vk55,vk56,vk57,vk58,vk59,vk5A,vk5B,vk5C,vk5D,vk60,vk61,vk62,vk63,vk64,vk65,vk66,vk67,vk68,vk69,vk6A,vk6B,vk6D,vk6E,vk6F,vk70,vk71,vk72,vk73,vk74,vk75,vk76,vk77,vk78,vk79,vk7A,vk7B,vk90,vk91,vk9A,vk9D,vkBA,vkBB,vkBC,vkBD,vkBE,vkBF,vkC0,vkDB,vkDC"

;======================макросы на героев
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
jopa11:=false

;====================Подгрузка конфига: бинды
IniRead, key_animcancel, data\genConfig.ini, Binds, key_animcancel
IniRead, key_map, data\genConfig.ini, Binds, key_map
IniRead, key_autowalk, data\genConfig.ini, Binds, key_autowalk
IniRead, key_overlay, data\genConfig.ini, Binds, key_overlay
IniRead, key_fastlyt, data\genConfig.ini, Binds, key_fastlyt
IniRead, key_skipNPS, data\genConfig.ini, Binds, key_skipNPS
IniRead, key_bhop, data\genConfig.ini, Binds, key_bhop
IniRead, key_autoswim, data\genConfig.ini, Binds, key_autoswim
IniRead, key_vi4er_sens, data\genConfig.ini, Binds, key_vi4er_sens

;====================Подгрузка конфига: дополнительные
IniRead, ShortcutKey, data\genConfig.ini, Extra, ShortcutKey 	;Забиндить ярлык системными кнопками, по дефолту CTRL-ALT-Numpad5

IniRead, FIXchat, data\genConfig.ini, Setings, FIXchat

IniRead, MousemoveBow, data\genConfig.ini, Extra, MousemoveBow 	;двигать мышку вправо когда идет стрельба с макроса на винапи
IniRead, FishMouseMoveX, data\genConfig.ini, Extra, FishMouseMoveX 	;сколько двигать для фишль по X = 43 на дефолтных настройках
IniRead, FishMouseMoveY, data\genConfig.ini, Extra, FishMouseMoveY 	;сколько двигать для фишль по Y = 0

IniRead, VentiMouseMoveX, data\genConfig.ini, Extra, VentiMouseMoveX 	;двигать для венти по X = 43 на дефолтных настройках
IniRead, VentiMouseMoveY, data\genConfig.ini, Extra, VentiMouseMoveY 	;двигать для венти по X = 0


;====================Подгрузка конфига: основные
IniRead, BrauzerCheck, data\genConfig.ini, Setings, BrauzerCheck ; проверка браузера
IniRead, BrauzerPick, data\genConfig.ini, Setings, BrauzerPick ; выбор браузера
IniRead, Map2toggle, data\genConfig.ini, Setings, map
IniRead, gameexe1337, data\genConfig.ini, Setings, GameExe	; исполняемый файл игры
IniRead, ONregreadDir, data\genConfig.ini, Setings, ONregreadDir ; поиск папки в реестре для откл кастсцен
IniRead, CheckboxRegDir, data\genConfig.ini, Setings, ONregreadDir
IniRead, DirGame, data\genConfig.ini, Setings, DirGame
IniRead, metodVvoda, data\genConfig.ini, Setings, metodVvoda
IniRead, showtooltipVvoba, data\genConfig.ini, Setings, showtooltipVvoba
IniRead, showmegui, data\genConfig.ini, Setings, showmegui
IniRead, ScaleFIX, data\genConfig.ini, Setings, ScaleFIX

IniRead, Checkbox1map, data\genConfig.ini, Setings, Checkbox1map
IniRead, Checkbox1overlay, data\genConfig.ini, Setings, Checkbox1overlay
IniRead, Checkbox1autowalk, data\genConfig.ini, Setings, Checkbox1autowalk
IniRead, Checkbox1fastlyt, data\genConfig.ini, Setings, Checkbox1fastlyt
IniRead, Checkbox1skipNPS, data\genConfig.ini, Setings, Checkbox1skipNPS
IniRead, Checkbox1autoswim, data\genConfig.ini, Setings, Checkbox1autoswim
IniRead, Checkbox1vi4ersens, data\genConfig.ini, Setings, Checkbox1vi4ersens
IniRead, Checkbox1animcancel, data\genConfig.ini, Setings, Checkbox1animcancel
IniRead, Checkbox1bhop, data\genConfig.ini, Setings, Checkbox1bhop
IniRead, Checkbox1bhopDelay, data\genConfig.ini, Setings, Checkbox1bhopDelay
IniRead, Checkbox1bhopDelayMs, data\genConfig.ini, Setings, Checkbox1bhopDelayMs


IniRead, RegeditExport1, data\genConfig.ini, Setings, RegeditExport1
IniRead, RegeditExport2, data\genConfig.ini, Setings, RegeditExport2
IniRead, RegeditExport3, data\genConfig.ini, Setings, RegeditExport3
IniRead, RegeditExport4, data\genConfig.ini, Setings, RegeditExport4

IniRead, RegeditCheckBox1, data\genConfig.ini, Setings, RegeditCheckBox1
IniRead, RegeditCheckBox2, data\genConfig.ini, Setings, RegeditCheckBox2
IniRead, RegeditCheckBox3, data\genConfig.ini, Setings, RegeditCheckBox3
IniRead, RegeditCheckBox4, data\genConfig.ini, Setings, RegeditCheckBox4

IniRead, GlLanguage, data\genConfig.ini, Setings, GlLanguage



;========================если с конфига подтянули ScaleFIX=1 то оверлей будет исправлен для систем с масштабированием например ноуты
if ScaleFIX
{
; Стандартный масштаб(100) умножить на A_ScreenDPI и разделить на стандартный DPI(96) получим GetScaleFactorForMonitor без API, т.е масштабирование
; Получаем масштаб экрана
ScaleFactor:=round(100 * A_ScreenDPI / 96)
ScaleFactorEq:=ScaleFactor / 100
; ScaleFactor:=115
; MsgBox %ScaleFactorEq%
ScreenWidthRe1:=round(A_ScreenWidth / ScaleFactorEq)
ScreenHeightRe1:=round(A_ScreenHeight / ScaleFactorEq)
}
Else
{
ScreenWidthRe1:=A_ScreenWidth
ScreenHeightRe1:=A_ScreenHeight
}


If (ONregreadDir == 1) ; Если в конфиге путь к игре реестр вкл, то:
{
;=====================Реестр расположение папки с игрой
; Старый путь здох, работал на релизе, через год не робит, стоило догадаться путь и вправду странный
; RegRead, DirVarGensh, HKEY_LOCAL_MACHINE, SOFTWARE\launcher, InstPath
RegRead, DirVarGensh, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Genshin Impact, UninstallString
SplitPath, DirVarGensh,,DirVarGensh
}
If (ONregreadDir == 0)
{
DirVarGensh = %DirGame%
}
;====================Положить хоткей в конфиг и проверить включен в чекбоксе в гуи или нет
if Checkbox1map = 1
Hotkey, %key_map%, Metkakey_map, on
if Checkbox1overlay = 1
Hotkey, %key_overlay%, Metkakey_overlay, on
if Checkbox1autowalk = 1
Hotkey, %key_autowalk%, Metkakey_autowalk, on
if Checkbox1fastlyt = 1
Hotkey, *~%key_fastlyt%, Metkakey_fastlyt, on
if Checkbox1skipNPS = 1
Hotkey, ~%key_skipNPS%, Metkakey_skipNPS, on
if Checkbox1autoswim = 1
Hotkey, ~%key_autoswim%, Metkakey_autoswim, on
if Checkbox1vi4ersens = 1
Hotkey, ~%key_vi4er_sens%, Metkakey_key_vi4er_sens, on
if Checkbox1animcancel = 1
Hotkey, ~%key_animcancel%, Metkakey_animcancel, on		;исправить
if Checkbox1bhop = 1
Hotkey, *~%key_bhop%, Metkakey_bhop, on
;не забыть что звездочка перед кнопкой разрешает несколько клавиш, тоесть W + Shift + Bhop, бхоп не тупит

if RegeditCheckBox1 = 1
Hotkey, F9, Metkakey_regeditstart1, on
if RegeditCheckBox2 = 1
Hotkey, F10, Metkakey_regeditstart2, on
if RegeditCheckBox3 = 1
Hotkey, F11, Metkakey_regeditstart3, on
if RegeditCheckBox4 = 1
Hotkey, F12, Metkakey_regeditstart4, on


;====================Настройки трея
Menu,Tray,NoStandard
Menu,Tray,DeleteAll
Menu,Tray, add, Setings, MetkaMenu1
Menu,Tray, Default , Setings
Menu,Tray, add
Menu,Tray, add, Сreate shortcut, Metkashortcut1
Menu,Tray, add
Menu,Tray, add, Info, MetkaMenu2
Menu,Tray, add, Exit, MetkaMenu0
Menu,Tray, Icon, data\genicon.ico, ,1
;====================Gui настройки
; Gui, 1: -MinimizeBox
if GlLanguage
Gui, 1: Add, Tab3, x0 y0 w469 h277, Бинды|Настройки|Безопасность|Реестр|Решейд		;|Hecks
Else
Gui, 1: Add, Tab3, x0 y0 w469 h277, Binds|Settings|Security|Registry|ReShade		;|Hecks

Gui, 1: Tab, 1 	;================главная
if GlLanguage
Gui, 1: Add, GroupBox, x8 y24 w200 h239, Бинды
Else
Gui, 1: Add, GroupBox, x8 y24 w200 h239, Binds

Gui, 1: Add, Edit, x40 y40 w61 h21 vkey_map, %key_map%
if GlLanguage
Gui, 1: Add, Text, v1Textmap x104 y40 w78 h23, *Карта
Else
Gui, 1: Add, Text, v1Textmap x104 y40 w78 h23, *Map

Gui, 1: Add, CheckBox, vCheckbox0map x16 y40 w13 h18 Checked%Checkbox1map%
Gui, 1: Add, Edit, x40 y64 w61 h21 vkey_overlay, %key_overlay%
if GlLanguage
Gui, 1: Add, Text, v1Textoverlay x104 y64 w80 h23, *Оверлей
Else
Gui, 1: Add, Text, v1Textoverlay x104 y64 w80 h23, *Overlay

Gui, 1: Add, CheckBox, vCheckbox0overlay x16 y64 w13 h18 Checked%Checkbox1overlay%
Gui, 1: Add, Edit, x40 y88 w61 h21 vkey_autowalk, %key_autowalk%
if GlLanguage
Gui, 1: Add, Text, v1Textautowalk x104 y88 w80 h23, *Автоходьба
Else
Gui, 1: Add, Text, v1Textautowalk x104 y88 w80 h23, *Auto walking

Gui, 1: Add, CheckBox, vCheckbox0autowalk x16 y88 w13 h18 Checked%Checkbox1autowalk%
Gui, 1: Add, Edit, x40 y136 w61 h21 vkey_skipNPS, %key_skipNPS%
if GlLanguage
Gui, 1: Add, Text, v1TextskipNPS x104 y136 w80 h23, Скип диалогов
Else
Gui, 1: Add, Text, v1TextskipNPS x104 y136 w80 h23, Dialogue skip

Gui, 1: Add, CheckBox, vCheckbox0skipNPS x16 y112 w13 h18 Checked%Checkbox1skipNPS%
Gui, 1: Add, Edit, x40 y112 w61 h21 vkey_fastlyt, %key_fastlyt%
if GlLanguage
Gui, 1: Add, Text, v1Textfastlyt x104 y112 w80 h23, Фастлут
Else
Gui, 1: Add, Text, v1Textfastlyt x104 y112 w80 h23, Fastloot

Gui, 1: Add, CheckBox, vCheckbox0fastlyt x16 y136 w13 h18 Checked%Checkbox1fastlyt%
Gui, 1: Add, Edit, x40 y160 w61 h21 vkey_autoswim, %key_autoswim%
if GlLanguage
Gui, 1: Add, Text, v1Textautoswim x104 y160 w66 h23, Плавание
Else
Gui, 1: Add, Text, v1Textautoswim x104 y160 w66 h23, Swimming

Gui, 1: Add, CheckBox, vCheckbox0autoswim x16 y160 w13 h18 Checked%Checkbox1autoswim%
Gui, 1: Add, Edit, x40 y184 w61 h21 vkey_vi4er_sens, %key_vi4er_sens%
if GlLanguage
Gui, 1: Add, Text, v1Textvi4er_sens x104 y184 w90 h23, Ведьмачье чутье
Else
Gui, 1: Add, Text, v1Textvi4er_sens x104 y184 w90 h23, Witcher instinct

Gui, 1: Add, CheckBox, vCheckbox0vi4ersens x16 y184 w13 h18 Checked%Checkbox1vi4ersens%
Gui, 1: Add, Edit, x40 y208 w61 h21 vkey_animcancel, %key_animcancel%
Gui, 1: Add, Text, v1Textanimcancel x104 y208 w56 h23, MacroKey
Gui, 1: Add, CheckBox, vCheckbox0animcancel x16 y208 w13 h18 Checked%Checkbox1animcancel%
Gui, 1: Add, Edit, x40 y232 w61 h21 +Disabled, Space
Gui, 1: Add, Text, x104 y232 w31 h20, Bhop
Gui, 1: Add, CheckBox, vCheckbox0bhop x16 y232 w13 h18 Checked%Checkbox1bhop%



Gui, 1: Add, Edit, vCheckbox1bhopDelayMs x160 y232 w28 h17 Number Limit4, %Checkbox1bhopDelayMs%



Gui, 1: Add, Text, v1TextaMs x192 y232 w14 h20, ms
Gui, 1: Add, CheckBox, vCheckbox0bhopDelay x136 y232 w23 h18 Checked%Checkbox1bhopDelay%, >
Gui, 1: Add, Picture, x208 y16 w252 h256 +BackgroundTrans, data\page1fish.png
Gui, 1: Tab, 2 	;================настройки
if GlLanguage
Gui, 1: Add, GroupBox, x8 y24 w139 h143, Доп. фишки
Else
Gui, 1: Add, GroupBox, x8 y24 w139 h143, Add. functions

if GlLanguage
Gui, 1: Add, Text, x16 y48 w114 h23, Путь к папке с игрой
Else
Gui, 1: Add, Text, x16 y48 w114 h23, Path to the game folder

if GlLanguage
Gui, 1: Add, CheckBox, vCheckboxRegDir gCheckboxRegDirG x16 y64 w121 h23 Checked%ONregreadDir%, Автопуть с реестра
Else
Gui, 1: Add, CheckBox, vCheckboxRegDir gCheckboxRegDirG x16 y64 w121 h23 Checked%ONregreadDir%, Autopath from registry

Gui, 1: Add, Edit, x16 y88 w92 h21 vEditDir +Disabled, %DirVarGensh%
Gui, 1: Add, Button, ggameway x112 y88 w23 h21, ...
if GlLanguage
Gui, 1: Add, Text, x16 y112 w120 h23, Кастсцены CGI
Else
Gui, 1: Add, Text, x16 y112 w120 h23, Cast scenes CGI

Gui, 1: Add, Button, gOnCGI x16 y136 w43 h23, ON
Gui, 1: Add, Button, gOffCGI x96 y136 w43 h23, OFF
if GlLanguage
Gui, 1: Add, GroupBox, x152 y24 w184 h80, Карта
Else
Gui, 1: Add, GroupBox, x152 y24 w184 h80, Map

Gui, 1: Add, ListBox, x160 y40 w124 h56 vList1488 AltSubmit, 1 - Mihoyo|2 - Genshin-impact-map|3 - Mapgenie.io|4 - Yuanshen.site
Gui, 1: Add, Button, gpickmap x288 y56 w39 h23, Pick
;не запутаться в чекбоксах, первая переменная хранит положение переключателя, 2я переменная извлекает из переменной значение переключателя
Gui, 1: Add, CheckBox, vCheckboxtooltipVvoba x16 y200 w120 h23 Checked%showtooltipVvoba%, Tooltip MacroKey
if GlLanguage
Gui, 1: Add, CheckBox, vCheckboxshowmegui x16 y224 w120 h23 Checked%showmegui%, GUI при запуске
Else
Gui, 1: Add, CheckBox, vCheckboxshowmegui x16 y224 w120 h23 Checked%showmegui%, GUI at startup

Gui, 1: Add, CheckBox, vCheckboxGlLanguage x16 y176 w120 h23 Checked%GlLanguage%, RU language GUI
Gui, 1: Add, CheckBox, vCheckboxMousemoveBow x16 y248 w120 h23 Checked%MousemoveBow%, RCS WinApi Bow
Gui, 1: Add, CheckBox, vCheckboxScaleFIX x160 y200 w120 h23 Checked%ScaleFIX%, FIX Overlay Scale
Gui, 1: Add, CheckBox, vCheckboxHighperformancemode x160 y176 w120 h23 Checked%Highperformancemode%, AHK Max Speed
Gui, 1: Add, CheckBox, vCheckboxFIXchat x160 y224 w120 h23 Checked%FIXchat%, FIX Macro + chat

;===============================Лира ветров

Gui, 1: Add, GroupBox, x152 y104 w184 h63, Windsong Lyre
Gui, 1: Add, Button, gParsButton x160 y136 w43 h23, Pars
Gui, 1: Add, Button, gClearButton x224 y136 w43 h23, Clear
Gui, 1: Add, Button, gRunButton x288 y136 w43 h23, Run
Gui, 1: Tab, 3 	;===============безопасность
Gui, 1: Add, Picture, x200 y10 w252 h256 +BackgroundTrans, data\page2noell.png
if GlLanguage
Gui, 1: Add, GroupBox, x8 y24 w139 h69, Режим эмитации ввода
Else
Gui, 1: Add, GroupBox, x8 y24 w139 h69, Input mode

Gui, 1: Add, ListBox, x16 y40 w68 h43 vListKeyDif AltSubmit, SendInput|SendPlay|WinApi
Gui, 1: Add, Button, gpickinput x88 y48 w54 h23, Pick
Gui, 1: Add, CheckBox, vCheckboxScScHachCh x10 y120 w129 h23 Checked%ScHachCh%, Hash changer
Gui, 1: Add, CheckBox, vCheckboxScWinrenamer x10 y144 w129 h23 Checked%ScWinrenamer%, WindowNameChanger
Gui, 1: Add, CheckBox, vCheckboxScRandomT x10 y168 w140 h23 Checked%ScRandomT%, Random 20ms (NoMacro)
Gui, 1: Add, CheckBox, vCheckboxScRenamer x10 y96 w129 h23 Checked%ScRenamer%, Name changer
Gui, 1: Add, CheckBox, vCheckboxScOverlay x10 y192 w140 h23 Checked%ScOverlay%, UID Hide (-popupwindow)
Gui, 1: Tab, 4 	;===============Реестр
if GlLanguage
Gui, 1: Add, GroupBox, x8 y24 w226 h191, Работа с реестром
Else
Gui, 1: Add, GroupBox, x8 y24 w226 h191, Working with the registry

Gui, 1: Add, Text, x72 y128 w120 h23 +0x200, DEVICE_ID
Gui, 1: Add, Button, gpickregedit x16 y184 w210 h21, Open Regedit
Gui, 1: Add, Edit, x48 y40 w45 h21 +Disabled, F9
Gui, 1: Add, Edit, x48 y72 w45 h21 +Disabled, F10
Gui, 1: Add, Edit, x48 y104 w45 h21 +Disabled, F11
Gui, 1: Add, Edit, x48 y152 w45 h21 +Disabled, F12
Gui, 1: Add, Edit, x104 y40 w83 h21 vVarRegeditExport1 +Disabled, %RegeditExport1%
Gui, 1: Add, Edit, x104 y72 w83 h21 vVarRegeditExport2 +Disabled, %RegeditExport2%
Gui, 1: Add, Edit, x104 y104 w83 h21 vVarRegeditExport3 +Disabled, %RegeditExport3%
Gui, 1: Add, Edit, x104 y152 w83 h21 vVarRegeditExport4 +Disabled, %RegeditExport4%
Gui, 1: Add, Button, g1pickreg1 x200 y40 w23 h23, ...
Gui, 1: Add, Button, g2pickreg2 x200 y72 w23 h23, ...
Gui, 1: Add, Button, g3pickreg3 x200 y104 w23 h23, ...
Gui, 1: Add, Button, g4pickreg4 x200 y152 w23 h23, ...
Gui, 1: Add, CheckBox, vCheckboxRegeditCheckBox1 x24 y40 w21 h22 Checked%RegeditCheckBox1%
Gui, 1: Add, CheckBox, vCheckboxRegeditCheckBox2 x24 y72 w21 h22 Checked%RegeditCheckBox2%
Gui, 1: Add, CheckBox, vCheckboxRegeditCheckBox3 x24 y104 w21 h22 Checked%RegeditCheckBox3%
Gui, 1: Add, CheckBox, vCheckboxRegeditCheckBox4 x24 y152 w21 h22 Checked%RegeditCheckBox4%
Gui, 1: Tab, 5 	;===============Решейд
if GlLanguage
Gui, 1: Add, GroupBox, x8 y24 w186 h103, Решейд
Else
Gui, 1: Add, GroupBox, x8 y24 w186 h103, ReShade

; Gui, 1: Add, ListBox, x16 y40 w120 h69 vListResPick AltSubmit, HDR by Rozza12|DefaultPreset2|Haze|TripWire|FPS Lite
; Gui, 1: Add, Button, g1pickRes x144 y64 w35 h23, Pick
Gui, 1: Add, Button, g1ReshadeInstal x16 y40 w39 h23, Instal
Gui, 1: Add, Button, g1ReshadeRemove x72 y40 w55 h23, Remove
Gui, 1: Add, Button, g1ReshadeRun x144 y40 w39 h23, Run
; Gui, 1: Add, Text, x16 y160 w120 h23 +0x200, Step 1. Remove
; Gui, 1: Add, Text, x16 y184 w120 h23 +0x200, Step 2. Pick
Gui, 1: Add, Text, x16 y72 w120 h23, Step 1. Instal
Gui, 1: Add, Text, x16 y96 w157 h23, Step 2. Run and start the game
Gui, 1: Tab, 6 	;===============Хекс

Gui, 1: Tab

Gui, 1: Add, Picture, x8 y280 w100 h38  +BackgroundTrans gPicgogit, data\gogit.png
Gui, 1: Add, Picture, x120 y280 w100 h38 +BackgroundTrans gPicgoyt, data\goyt.png
Gui, 1: Add, Button, gcancelexit x320 y288 w67 h23, Hide in tray
Gui, 1: Add, Button, gsavegui x264 y288 w43 h23, Save
Gui, 1: Add, Button, gquitgui x400 y288 w43 h23, Quit



if (ScWinrenamer = 1)
{
Random, rand1488, 33, 35
password := gen_password(rand1488)	
Gui, 1: Show, Hide w465 h325, %password%
if showmegui
Gui, 1: Show
}
Else
{

if metodVvoda = 1
winsayvar:= "SendInput mode"
if metodVvoda = 2
winsayvar:= "SendPlay mode"
if metodVvoda = 3
winsayvar:= "WinApi mode"
Gui, 1: Show, Hide w465 h325, %WinName% (%winsayvar%)
if showmegui

Gui, 1: Show

}
;ломается mousemove из за окна окно1337

;===============================Переменные
xSkip:=A_ScreenWidth*.7328
ySkip:=A_ScreenHeight*.7465
var0ov:=1 ;оверлей обозначить переменную
;===============================Выбор карты
if (Map2toggle == 1)
{
GroupAdd, GroupNameMap1337, Teyvat Interactive Map
GroupAdd, GroupNameMap1337, Интерактивная карта Тейвата
GroupAdd, GroupNameMap1337, Teyvat Interactive Map
GroupAdd, GroupNameMap1337, Interaktive Karte von Teyvat
GroupAdd, GroupNameMap1337, 提瓦特互动地图
GroupAdd, GroupNameMap1337, 提瓦特互動地圖
GroupAdd, GroupNameMap1337, Carte interactive de Teyvat

GroupAdd, GroupNameMap1337, Архипелаг Золотого яблока
GroupAdd, GroupNameMap1337, Golden Apple Archipelago
GroupAdd, GroupNameMap1337, Goldapfelarchipel
GroupAdd, GroupNameMap1337, 金苹果群岛
GroupAdd, GroupNameMap1337, 金蘋果群島
GroupAdd, GroupNameMap1337, Archipel de la pomme dorée
run_param:="https://webstatic-sea.mihoyo.com/app/ys-map-sea/"
}
if (Map2toggle == 2)
{
GroupAdd, GroupNameMap1337, Genshin Impact Interactive World Map
GroupAdd, GroupNameMap1337, Интерактивная карта мира Genshin Impact
run_param:="https://genshin-impact-map.appsample.com/"
}
if (Map2toggle == 3)
{
GroupAdd, GroupNameMap1337, Genshin Impact Interactive Map | Map Genie
GroupAdd, GroupNameMap1337, Интерактивная карта воздействия Геншина | Карта Genie
run_param:="https://mapgenie.io/genshin-impact/maps/teyvat"
}
if (Map2toggle == 4)
{
GroupAdd, GroupNameMap1337, Original God Map
GroupAdd, GroupNameMap1337, Оригинальная карта бога
GroupAdd, GroupNameMap1337, 原神地图
run_param:="https://yuanshen.site/"
}

;===============================Оверлей создание
HpBarW:=ScreenWidthRe1
HpBarH:=ScreenHeightRe1
HpBarX:=0
HpBarY:=0
Gui, 99: +AlwaysOnTop +ToolWindow -Caption +LastFound
WinSet, TransColor, 12345
Gui, 99: Color, 12345
Path = "%A_ScriptDir%\data\paimon.gif"
;width := 184, height := 281
width := Round(ScreenWidthRe1 *.07187)
height := Round(ScreenHeightRe1 *.19513)


if ScaleFIX
{
widthex1 := Round(width * ScaleFactorEq + 1), heightex1 := Round(height * ScaleFactorEq + 1)
}
Else
{
widthex1 := Round(ScreenWidthRe1 *.07187)
heightex1 := Round(ScreenHeightRe1 *.19513)
}


width2 := Round(ScreenWidthRe1 *.78125)
height2 := Round(ScreenHeightRe1 *.74305)
Gui, 99: Add, ActiveX, x%width2% y%height2% w%width% h%height% Disabled voIE, Shell.Explorer
oIE.Navigate("about:blank")
oIE.Document.Write("<body style=""overflow: hidden; margin: 0px""><img src=" Path " width=" widthex1 "px; height=" heightex1 "></body>" ) 
oIE.Document.close
GuiControl, 99: hide, oIE
Gui, 99: Add, Picture, w%HpBarW% h%HpBarH% x0 y0 vMyPictureVar1, data\genOverlay1.png

; 2395 1377
; 2450 1433
; 110 7

; 0,935546875
; 0,95625

; 0,02070
; 0,03819

XwidthPicOver := Round(ScreenWidthRe1 *.93554)
YheightPicOver := Round(ScreenHeightRe1 *.95625)
widthPicOver := Round(ScreenWidthRe1 *.02070)
heightPicOver := Round(ScreenHeightRe1 *.03819)
XwidthPicOver2 := Round(ScreenWidthRe1 *.96718)
YheightPicOver2 := Round(ScreenHeightRe1 *.95625)
Gui, 99: Add, Picture, w%widthPicOver% h%heightPicOver% x%XwidthPicOver% y%YheightPicOver% +BackgroundTrans gPicOverlay1, data\genOverlayNext.png
Gui, 99: Add, Picture, w%widthPicOver% h%heightPicOver% x%XwidthPicOver2% y%YheightPicOver2% +BackgroundTrans gPicOverlay2, data\genOverlayNext.png

if (ScWinrenamer = 1)
Gui, 99: Show, Hide w%HpBarW% h%HpBarH% x%HpBarX% y%HpBarY%, %password%
Else
Gui, 99: Show, Hide w%HpBarW% h%HpBarH% x%HpBarX% y%HpBarY%, %WinName%

Gui, 99: Cancel

return
;=====================================конец мейн потока, дальше идут метки


AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"


;==========================Создать ярлык на рабочем столе
Metkashortcut1:
FileCreateShortcut, %A_ScriptFullPath%, %A_Desktop%\GenshAHK.lnk,,,Gachibaser things, %A_ScriptDir%\data\genicon.ico, %ShortcutKey%,,
return

;==========================дропаем файл или файлы в окно скрипта
GuiDropFiles:
z1FileList = %A_GuiEvent%
Sort , z1FileList				;сортируем по имени, стоп а зачем?
Loop, Parse, z1FileList, `n		;парсим каждую строчку
{
SplitPath, A_LoopField,,, z1ext,, 	;извлечь из строки расширение
	if (z1ext == "mid")			;если расширение .mid то выполнить действие ниже
	{
	FileCopy, %A_LoopField%, data\soundall, 0
	}
}
Return


1ReshadeRun:
Gui, 1: Submit, NoHide
Gui, 1: Cancel
ToolTip, Отладка: Удаляем файл dxgi.dll.temp, 0, 0
FileDelete, %EditDir%\Genshin Impact Game\dxgi.dll.temp
Loop 30
{
sleep 500
FileCopy, data\reshade\dxgi.dll, %EditDir%\Genshin Impact Game\, 0
ToolTip, Отладка: Перезапись dxgi.dll, 0, 0
}
ToolTip, Отладка: Меняем имя dxgi.dll, 0, 0
FileMove, %EditDir%\Genshin Impact Game\dxgi.dll, %EditDir%\Genshin Impact Game\dxgi.dll.temp, 1
SoundBeep
sleep 500
ToolTip
return

1ReshadeInstal:
Gui, 1: Submit, NoHide
FileCopyDir, data\reshade\Preset, %EditDir%\Genshin Impact Game\Preset
FileCopyDir, data\reshade\reshade-shaders, %EditDir%\Genshin Impact Game\reshade-shaders

FileCopy, data\reshade\ReShade.ini, %EditDir%\Genshin Impact Game, 1
return

1ReshadeRemove:
Gui, 1: Submit, NoHide
FileDelete, %EditDir%\Genshin Impact Game\ReShade64.log
FileDelete, %EditDir%\Genshin Impact Game\ReShade.ini
FileDelete, %EditDir%\Genshin Impact Game\dxgi.dll.temp
FileDelete, %EditDir%\Genshin Impact Game\dxgi.dll
FileDelete, %EditDir%\Genshin Impact Game\dxgi.log
FileRemoveDir, %EditDir%\Genshin Impact Game\Preset, 1
FileRemoveDir, %EditDir%\Genshin Impact Game\reshade-shaders, 1
return



1pickreg1:
InputBox, RegeditExport1,, Задать имя сохраненой ветки реестра,, 200, 150,,,,,%RegeditExport1%
	if ErrorLevel
		Return
	else
	{
	if (RegeditExport1 = "")
		Return
	RunWait, cmd /k reg export "HKEY_CURRENT_USER\Software\miHoYo" %A_ScriptDir%\data\reg\%RegeditExport1%.reg /y & exit
	IniWrite, %RegeditExport1%, data\genConfig.ini, Setings, RegeditExport1
	Gui, 1: Submit, NoHide
	GuiControl,1:, VarRegeditExport1, %RegeditExport1%
	}
return

2pickreg2:
InputBox, RegeditExport2,, Задать имя сохраненой ветки реестра,, 200, 150,,,,,%RegeditExport2%
	if ErrorLevel
		Return
	else
	{
	if (RegeditExport2 = "")
		Return
	RunWait, cmd /k reg export "HKEY_CURRENT_USER\Software\miHoYo" %A_ScriptDir%\data\reg\%RegeditExport2%.reg /y & exit
	IniWrite, %RegeditExport2%, data\genConfig.ini, Setings, RegeditExport2
	Gui, 1: Submit, NoHide
	GuiControl,1:, VarRegeditExport2, %RegeditExport2%
	}
return

3pickreg3:
InputBox, RegeditExport3,, Задать имя сохраненой ветки реестра,, 200, 150,,,,,%RegeditExport3%
	if ErrorLevel
		Return
	else
	{
	if (RegeditExport3 = "")
		Return
	RunWait, cmd /k reg export "HKEY_CURRENT_USER\Software\miHoYo" %A_ScriptDir%\data\reg\%RegeditExport3%.reg /y & exit
	IniWrite, %RegeditExport3%, data\genConfig.ini, Setings, RegeditExport3
	Gui, 1: Submit, NoHide
	GuiControl,1:, VarRegeditExport3, %RegeditExport3%
	}
return

4pickreg4:
InputBox, RegeditExport4,, Задать имя сохраненой ветки реестра SDK-id,, 200, 150,,,,,%RegeditExport4%
	if ErrorLevel
		Return
	else
	{
	if (RegeditExport4 = "")
		Return
	RunWait, cmd /k reg export "HKEY_CURRENT_USER\Software\miHoYoSDK" %A_ScriptDir%\data\reg\%RegeditExport4%.reg /y & exit
	IniWrite, %RegeditExport4%, data\genConfig.ini, Setings, RegeditExport4
	Gui, 1: Submit, NoHide
	GuiControl,1:, VarRegeditExport4, %RegeditExport4%
	}
return


Metkakey_regeditstart1:
MsgBox,,, Через 5 сек применится пресет №1`nPresets = %RegeditExport1%, 5
RunWait, cmd /k reg DELETE "HKEY_CURRENT_USER\Software\miHoYo" /f & exit
RunWait, cmd /k reg import %A_ScriptDir%\data\reg\%RegeditExport1%.reg & exit
SoundBeep
return

Metkakey_regeditstart2:
MsgBox,,, Через 5 сек применится пресет №2`nPresets = %RegeditExport2%, 5
RunWait, cmd /k reg DELETE "HKEY_CURRENT_USER\Software\miHoYo" /f & exit
RunWait, cmd /k reg import %A_ScriptDir%\data\reg\%RegeditExport2%.reg & exit
SoundBeep
return

Metkakey_regeditstart3:
MsgBox,,, Через 5 сек применится пресет №3`nPresets = %RegeditExport3%, 5
RunWait, cmd /k reg DELETE "HKEY_CURRENT_USER\Software\miHoYo" /f & exit
RunWait, cmd /k reg import %A_ScriptDir%\data\reg\%RegeditExport3%.reg & exit
SoundBeep
return

Metkakey_regeditstart4:
MsgBox,,, Через 5 сек применится пресет №4`nPresets = %RegeditExport4%, 5
RunWait, cmd /k reg DELETE "HKEY_CURRENT_USER\Software\miHoYoSDK" /f & exit
RunWait, cmd /k reg import %A_ScriptDir%\data\reg\%RegeditExport4%.reg & exit
SoundBeep
return



;===============================Отключить все хоткеи, сменить иконку, остановить активные потоки
PgUp::
Suspend, Toggle
1toggle1Suspend := !1toggle1Suspend
if (1toggle1Suspend)
{
SoundBeep
Menu,Tray, Icon, data\geniconGr.png, ,1
ToolTip, OFF, 0, 0
sleep 300
ToolTip
}
Else
{
Menu,Tray, Icon, data\genicon.png, ,1
ToolTip, ON, 0, 0
sleep 300
ToolTip
}
Pause , Toggle, 1
return



;===============================Банихоп
Metkakey_bhop:
sleep 1
IfWinActive, %gameexe1337%		;ahk_exe GenshinImpact.exe
{
if Checkbox1bhopDelay
	{
	if (Checkbox1bhopDelayMs > -2 and Checkbox1bhopDelayMs < 5001) 	;вторая проверка если первую обошли от -1 до 5000
	Sleep %Checkbox1bhopDelayMs%
	}
Else
{
Sleep 50
}
Loop
{
    GetKeyState, SpaceVar1, Space, P
    If SpaceVar1 = U
        break 
    
	multisendinput("Space", "", "Space", "", "0x20", "0", "", "")
	if ScRandomT
	{
	Random, RandomVarSc, 15, 20
	sleep %RandomVarSc%
	}
	Sleep 1
}
}
return




;===============================Карта
Metkakey_map:
MonitorFound1:=0
sleep 50

IfWinActive, %gameexe1337%
toggle1 := 0
IfWinActive, ahk_group GroupNameMap1337
toggle1 := 1





SysGet, MonitorCountVar, MonitorCount 	;получить кол-во мониторов
if MonitorCountVar > 1 	;если кол-во мониторов больше 1 то
{
;Центр монитора
ScreenWidthMap2mon228:=round(A_ScreenWidth / 2)
ScreenHeightMap2mon228:=round(A_ScreenHeight / 2)
;Получаем положение окна и его размеры
IfWinExist, ahk_group GroupNameMap1337
{
WinGetPos, X1map, Y1map, Width1map, Height1map, %MapWin1337%
X1mapMa:=round(X1map + Width1map / 2)
Y1mapMa:=round(Y1map + Height1map / 2)
; Получено 2 точки между 2мя мониторами
X1mapMaLast:=abs(X1mapMa - ScreenWidthMap2mon228)
Y1mapMaLast:=abs(Y1mapMa - ScreenHeightMap2mon228)
if (X1mapMaLast < ScreenWidthMap2mon228) and (Y1mapMaLast < ScreenHeightMap2mon228)
	{
	MonitorFound1:=0
	; Tooltip Карта на основном мониторе
	}
Else
	{
	MonitorFound1:=1
	; Tooltip Карта на дополнительном мониторе
	}
}
}


toggle1 := !toggle1
if (toggle1)
{
	if !(MonitorFound1) 	;если карта на основном монике то не сворачивать игру
	{
	WinMinimize %gameexe1337% ;свернуть игру
	}
IfWinExist, ahk_group GroupNameMap1337 ;если найдено окно с катрой то..
	{
WinMaximize ahk_group GroupNameMap1337 ;максимизировать
WinActivate ahk_group GroupNameMap1337 ;сделать активным
	if MonitorFound1
	MouseMove, X1mapMa, Y1mapMa
	}
IfWinNotExist, ahk_group GroupNameMap1337 ;если окно карты не найдено то..
	{
	if BrauzerCheck = 0
		{
		Run,%run_param% ;подрубить дефолтный браузер и завести карту
		}
	if BrauzerCheck = 1
		{
		run_path	= %BrauzerPick% -maximized
		Run,%run_path%  %run_param% ;подрубить выбраный браузер и завести карту
		}
loop 7
{
IfWinExist, ahk_group GroupNameMap1337 ;ожидание окна карты
{
sleep 1
WinMaximize ahk_group GroupNameMap1337 ;максимизировать окно
WinActivate ahk_group GroupNameMap1337 ;сделать активным
break
}
sleep 900
}
	}
}
else
{
if MonitorFound1
{
MouseMove, ScreenWidthMap2mon228, ScreenHeightMap2mon228
}
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
Gui, 99: Show
WinMinimize %gameexe1337%
}
else
{
WinMaximize %gameexe1337%
Gui, 99: Cancel
}
return
;===============================Закрыть Оверлей на Esc
*~$Escape::
if (overlay1toggle)
{
WinMaximize %gameexe1337%
Gui, 99: Cancel
overlay1toggle := !overlay1toggle
}
return
;===============================Фастлут
Metkakey_fastlyt:
IfWinActive, %gameexe1337%
{
Sleep 115
; if FIXchat
; {
	; StructSize1337 := A_PtrSize + 16
	; VarSetCapacity(InfoStruct1337, StructSize1337)
	; NumPut(StructSize1337, InfoStruct1337)
	; DllCall("GetCursorInfo", UInt, &InfoStruct1337)
	; Result1337 := NumGet(InfoStruct1337, 8)
	; if (Result1337 <> 0) 			;если размер курсора больше 0 то мы в чате и скрипт не нажимает кнопки
		; Return
; }
Loop
{
    GetKeyState, SpaceVar2, %key_fastlyt%, P
    If SpaceVar2 = U
        break 
    Sleep 1
	if ScRandomT
	{
	Random, RandomVarSc, 15, 20
	sleep %RandomVarSc%
	}
	multisendinput("F", "", "F", "", "0x46", "0", "", "")
	if ScRandomT
	{
	Random, RandomVarSc, 15, 20
	sleep %RandomVarSc%
	}
	; sleep 1
	; Старый фастлут
	SendInput, {Blind}{WheelDown}
	
	; Новый СуперФастЛут, камеру душит	
	; sleep 1
	; FastlytToggler1 := !FastlytToggler1
	; if (FastlytToggler1)
	; {
	; SendInput, {Blind}{WheelDown}
	; }
	; else
	; {
	; SendInput, {Blind}{WheelUp}
	; }
	
	
	
}
}
return
;===============================Автоходьба
Metkakey_autowalk:
sleep 100
IfWinActive, %gameexe1337%
{

GetKeyState, AutowalkVar, W
if AutowalkVar = U		;Если кнопка отжата
{
sleep 50
SendInput {W down}
}
else		;Если кнопка нажата
{
sleep 50
SendInput {Blind}{W}
}

}
return
;===============================Скип диалогов
Metkakey_skipNPS:
IfWinActive, %gameexe1337%
{
Sleep 200


Loop
{
    GetKeyState, SpaceVar2, %key_skipNPS%, P
    If SpaceVar2 = U
        break 
    Sleep 15
	if ScRandomT
	{
	Random, RandomVarSc, 15, 20
	sleep %RandomVarSc%
	}
Click %xSkip% %ySkip%
}
}
return

;===============================Плавание
Metkakey_autoswim:
if FIXchat
{
	StructSize1337 := A_PtrSize + 16
	VarSetCapacity(InfoStruct1337, StructSize1337)
	NumPut(StructSize1337, InfoStruct1337)
	DllCall("GetCursorInfo", UInt, &InfoStruct1337)
	Result1337 := NumGet(InfoStruct1337, 8)
	if (Result1337 <> 0) 			;если размер курсора больше 0 то мы в чате и скрипт не нажимает кнопки
		Return
}
IfWinActive, %gameexe1337%		;ahk_exe GenshinImpact.exe
{
sleep 15
Send {LShift down}
Loop
{
    GetKeyState, 2SpaceVar2, %key_autoswim%, P
    If 2SpaceVar2 = U
        break
multisendinput("W", "", "W", "", "0x57", "0", "", "")
; Sendplay, {Blind}{W}
Random, RandomVarSw, 500, 520
sleep %RandomVarSw%
}
Send {LShift Up}
}
return


;===============================Откл бхоп
Numpad0::
sleep 50
if Checkbox1bhop = 1
{
BhopToggler1 := !BhopToggler1
if (BhopToggler1)
{
Hotkey, *~%key_bhop%, Metkakey_bhop, off
if showtooltipVvoba
ToolTip, Bhop off, 0, 0
}
Else
{
Hotkey, *~%key_bhop%, Metkakey_bhop, on
if showtooltipVvoba
ToolTip, Bhop on, 0, 0
}
}
Return
;===============================эмбер
Numpad1::
jopa1:=true
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
jopa11:=false
if showtooltipVvoba
ToolTip, Amber legit, 0, 0
Return
;===============================фишль
Numpad2::
jopa1:=false
jopa2:=true
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
jopa11:=false
if showtooltipVvoba
ToolTip, Fishl legit, 0, 0
Return
;===============================кли Charge Attack
Numpad3::
jopa1:=false
jopa2:=false
jopa3:=true
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
jopa11:=false
if showtooltipVvoba
ToolTip, Xiangling Dragonstrick, 0, 0
Return
;===============================кли 2 Сombo
Numpad6::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=true
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
jopa11:=false
if showtooltipVvoba
ToolTip, Klee Сombo, 0, 0
Return
;===============================венти MachineGun
Numpad5::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=true
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
jopa11:=false
if showtooltipVvoba
ToolTip, Venti+Ganyu MachineGun, 0, 0
Return
;===============================фишль и эмбер
Numpad4::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=true
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
jopa11:=false
if showtooltipVvoba
ToolTip, Amber+Fish MachineGun, 0, 0
Return
;===============================драгонстрайк дилюк бейдоу
Numpad7::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=true
jopa8:=false
jopa9:=false
jopa10:=false
jopa11:=false
if showtooltipVvoba
ToolTip, Diluc+Beidou DragonStrike, 0, 0
Return
;===============================драгонстрайк ноэль
Numpad8::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=true
jopa9:=false
jopa10:=false
jopa11:=false
if showtooltipVvoba
ToolTip, Noelle DragonStrike, 0, 0
Return
;===============================драгонстрайк эола
Numpad9::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=true
jopa10:=false
jopa11:=false
if showtooltipVvoba
ToolTip, Eula DragonStrike, 0, 0
Return
;===============================нампад плюс, кли отмена прыжком
NumpadAdd::
jopa1:=false
jopa2:=false
jopa3:=false
jopa4:=false
jopa5:=false
jopa6:=false
jopa7:=false
jopa8:=false
jopa9:=false
jopa10:=false
jopa11:=true
if showtooltipVvoba
ToolTip, Klee, 0, 0
Return



AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"


;=================================================отмена анимаций на героев
Metkakey_animcancel:
if FIXchat
{
	StructSize1337 := A_PtrSize + 16
	VarSetCapacity(InfoStruct1337, StructSize1337)
	NumPut(StructSize1337, InfoStruct1337)
	DllCall("GetCursorInfo", UInt, &InfoStruct1337)
	Result1337 := NumGet(InfoStruct1337, 8)
	if (Result1337 <> 0) 			;если размер курсора больше 0 то мы в чате и скрипт не нажимает кнопки
		Return
}
if jopa1 							;ембер
{
IfWinActive, %gameexe1337%
{
sleep 1
Loop
{
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break

multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
sleep 310
multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
sleep 510
multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
sleep 410
multisendinput("R", "", "R", "", "0x52", "0", "", "")
; Sendplay, {Blind}{R}
sleep 50
multisendinput("R", "", "R", "", "0x52", "0", "", "")
; Sendplay, {Blind}{R}
sleep 170
}
}
}
if jopa2 							;фишль
{
IfWinActive, %gameexe1337%
{
sleep 1
Loop
{
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
Random, RandomVarFish, 320, 321
sleep %RandomVarFish%
multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
Random, RandomVarFish, 310, 311
sleep %RandomVarFish%
multisendinput("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; Sendplay, {Blind}{LButton}
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
Random, RandomVarFish, 415, 416
sleep %RandomVarFish%
multisendinput("R", "", "R", "", "0x52", "0", "", "")
; Sendplay, {Blind}{R}
Random, RandomVarFish, 50, 51
sleep %RandomVarFish%
multisendinput("R", "", "R", "", "0x52", "0", "", "")
; Sendplay, {Blind}{R}
Random, RandomVarFish, 170, 171
sleep %RandomVarFish%
}
}
}

if jopa6 							;кли комбо
{
IfWinActive, %gameexe1337%
{
Ivar:=0
sleep 1
Loop
{
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
multisendinput2("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; SendInput, {Blind}{LButton}
sleep 415
multisendinput2("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; SendInput, {Blind}{LButton}
sleep 1
multisendinput2("Space", "", "Space", "", "0x20", "0", "", "")
; SendInput, {Blind}{Space}
sleep 520
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
multisendinput2("LButton", "", "LButton", "", "", "", "0x0002", "0x0004")
; SendInput, {Blind}{LButton}
sleep 55
if Ivar = 6
{
multisendinput2("vk45", "", "vk45", "", "0x45", "0", "", "")
; SendInput, {Blind}{vk45}
sleep 225
Ivar:=0
}
Else
{
multisendinput2("LButton", " Down", "LButton", " Down", "", "", "0x0002", "")
; SendInput, {Blind}{LButton Down}
sleep 210
multisendinput2("LButton", " Up", "LButton", " Up", "", "", "0x0002", "0x0004")
; SendInput, {Blind}{LButton Up}
}
sleep 600
    GetKeyState, 2SpaceVar2, %key_animcancel%, P
    If 2SpaceVar2 = U
        break
multisendinput2("Space", "", "Space", "", "0x20", "0", "", "")
; SendInput, {Blind}{Space}
sleep 510
Ivar++
; tooltip %Ivar%
}
}
}

if jopa3 							;сян лин драгонстрайк
{
IfWinActive, %gameexe1337%
{
		Click down
		Sleep 1
		Click up
		Sleep 175			;180 норм
		Send {LShift down}
		Sleep 20
		Send {LShift up}
		Send {Space down}
		Sleep 1
		Send {Space up}
		Sleep 25
		Click down
		Sleep 25
		Click up
}
}

if jopa5 							;идеальный вентиль
{
IfWinActive, %gameexe1337%
{
sleep 1
if metodVvoda = 1 
{
sleep 1
Loop
{
    GetKeyState, 2SpaceVar2, %key_animcancel%, P 	;проверить состояние клавиши
    If 2SpaceVar2 = U
        break
	; DllCall("mouse_event", uint, 1, int, 50, int, 0, uint, 0, int, 0)
	Send {R down}
	Sleep 20
	Send {R up}
	Sleep 35
	
		Click down
		Sleep 1
		Click up
	
	Send {R down}
	Sleep 20
	Send {R up}
	Sleep 35
}
}
if metodVvoda = 3
{
sleep 1
Loop
{
	GetKeyState, 2SpaceVar2, %key_animcancel%, P 	;идеальный вентиль 3
    If 2SpaceVar2 = U
        break
		
		if MousemoveBow
		DllCall("mouse_event", uint, 1, int, VentiMouseMoveX, int, VentiMouseMoveY, uint, 0, int, 0) 	;двигаю мышку чтобы выровнять спрей
		
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 0, int, 0)
		sleep 20
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 2, int, 0)
		sleep 35

	
		Click down
		Sleep 1
		Click up
	
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 0, int, 0)
		sleep 20
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 2, int, 0)
		sleep 35
}
}

if metodVvoda = 2
{
sleep 1
Loop
{
	GetKeyState, 2SpaceVar2, %key_animcancel%, P 	;идеальный вентиль 2
    If 2SpaceVar2 = U
		break
multisendinput("R", "", "R", "", "0x52", "0", "", "")
	Sleep 37 	;Sleep 70
	Click
	Sleep 1 	;Sleep 1
multisendinput("R", "", "R", "", "0x52", "0", "", "")
	Sleep 37 	;Sleep 50
}
}

}
}

if jopa4 							;идеальный фишль и эмбер
{
IfWinActive, %gameexe1337%
{
sleep 1
if metodVvoda = 1
{
sleep 1
Loop
{
	if !GetKeyState(key_animcancel, "P")
	break

		Send {R down}
		sleep 1
		Send {R up}
		sleep 1
		
		Sleep 38 	;Sleep 70
		Click down
		Sleep 1 	;Sleep 1
		Click up
		
		Send {R down}
		sleep 1
		Send {R up}
		sleep 23 	;Sleep 23
}
}
if metodVvoda = 3
{
Loop
{
	if !GetKeyState(key_animcancel, "P") 	;идеальный фишль+эмбер
	break
		if MousemoveBow
		DllCall("mouse_event", uint, 1, int, FishMouseMoveX, int, FishMouseMoveY, uint, 0, int, 0) 	;двигаю мышку чтобы выровнять спрей
		
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 0, int, 0)
		sleep 1
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 2, int, 0)
		sleep 1
		
		Sleep 38 	;Sleep 70
		Click down
		Sleep 1 	;Sleep 1
		Click up
		
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 0, int, 0)
		sleep 1
		DllCall("keybd_event", int, 0x52, int, 0xA0, int, 2, int, 0)
		sleep 23 	;Sleep 23
		
}
}

if metodVvoda = 2
{
Loop
{
	GetKeyState, 2SpaceVar2, %key_animcancel%, P 	;идеальный фишль+эмбер
    If 2SpaceVar2 = U
		break
multisendinput("R", "", "R", "", "0x52", "0", "", "")
	Sleep 60 	;Sleep 70
	Click
	Sleep 1 	;Sleep 1
multisendinput("R", "", "R", "", "0x52", "0", "", "")
	Sleep 70 	;Sleep 50
}
}

}
}

if jopa7 							;дилюк бейдоу драгонстрайк
{
IfWinActive, %gameexe1337%
{
		sleep 1
		Click down
		Sleep 11
		Click up
		Sleep 335
		Send {LShift down}
		Sleep 20
		Send {LShift up}
		Send {Space down}
		Sleep 25
		Send {Space up}
		Sleep 25
		Click down
		Sleep 25
		Click up
}
}

if jopa8 							;ноэль драгонстрайк
{
IfWinActive, %gameexe1337%
{
		Click down
		Sleep 20
		Click up
		Sleep 410
		Send {LShift down}
		Sleep 20
		Send {LShift up}
		Send {Space down}
		Sleep 25
		Send {Space up}
		Sleep 25
		Click down
		Sleep 25
		Click up
}
}

if jopa9 							;эола драгонстрайк
{
IfWinActive, %gameexe1337%
{
		Click down
		Sleep 11
		Click up
		Sleep 440
		Send {LShift down}
		Sleep 20
		Send {LShift up}
		Send {Space down}
		Sleep 25
		Send {Space up}
		Sleep 25
		Click down
		Sleep 25
		Click up
}
}

if jopa11 							;кли обычные тычки с прыжками
{
IfWinActive, %gameexe1337%
{
    while(GetKeyState(key_animcancel, "P")) {
        Click
        Sleep, 35
        Send, {Space}
        Sleep, 550
    }
}
}
return



;==================================================Работа с Gui метками
MetkaMenu1:
Gui, 1: Show
Return
;==================================================quit закрыть скрипт
quitgui:
ExitApp
Return
;==================================================Открыть ютаб
Picgoyt:
Run https://www.youtube.com/channel/UCWokUgKYuToN89x-kogVt-w
Return
;==================================================Открыть гитхаб
Picgogit:
Run https://github.com/Kramar1337
Return

;=================================================Отключить кастсцены
OnCGI:
Gui, 1: Submit, NoHide

IfExist, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets 	;проверить прилетела ли обнова, если да то соединить файлы
{
IfExist, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets
{
FileMove, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets\*.*, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets\, 1
    Loop, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets\*, 2 ; 2 означает "возвращать только папки".
    {
        FileMoveDir, %A_LoopFileFullPath%, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets, 1
        ErrorCount += ErrorLevel
        if ErrorLevel ; Сообщать о каждой проблемной папке.
			MsgBox,,, Не удалось переместить %A_LoopFileFullPath%, 5
    }
FileRemoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets, 1
}
}
IfExist, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication 	;проверить прилетела ли обнова, если да то соединить файлы
{
IfExist, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication
{
FileMove, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication\*.*, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication\, 1
    Loop, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication\*, 2 ; 2 означает "возвращать только папки".
    {
        FileMoveDir, %A_LoopFileFullPath%, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication, 1
        ErrorCount += ErrorLevel
        if ErrorLevel ; Сообщать о каждой проблемной папке.
			MsgBox,,, Не удалось переместить %A_LoopFileFullPath%, 5
    }
FileRemoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication, 1
}
}


FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets, 1
FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication, 1
if (ErrorLevel == 1)
msgbox ,,, ErrorLevel - %ErrorLevel%,1
if (ErrorLevel == 0)
msgbox ,,, OK,1
Return

OffCGI:
Gui, 1: Submit, NoHide

IfExist, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets
{
FileMove, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets\*.*, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets\, 1
    Loop, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets\*, 2 ; 2 означает "возвращать только папки".
    {
        FileMoveDir, %A_LoopFileFullPath%, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets, 1
        ErrorCount += ErrorLevel
        if ErrorLevel ; Сообщать о каждой проблемной папке.
			MsgBox,,, Не удалось переместить %A_LoopFileFullPath%, 5
    }
FileRemoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets, 1
}

IfExist, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication
{
FileMove, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication\*.*, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication\, 1
    Loop, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication\*, 2 ; 2 означает "возвращать только папки".
    {
        FileMoveDir, %A_LoopFileFullPath%, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication, 1
        ErrorCount += ErrorLevel
        if ErrorLevel ; Сообщать о каждой проблемной папке.
			MsgBox,,, Не удалось переместить %A_LoopFileFullPath%, 5
    }
FileRemoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication, 1
}

FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAssets, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAssets, 1
FileMoveDir, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\VideoAuthentication, %EditDir%\Genshin Impact Game\GenshinImpact_Data\StreamingAssets\1VideoAuthentication, 1
if (ErrorLevel == 1)
msgbox ,,, ErrorLevel - %ErrorLevel%,1
if (ErrorLevel == 0)
msgbox ,,, OK,1
Return

;==================================================Сохраниться
savegui:
Gui, 1: Submit, Nohide
toogglertumbler:=0
sleep 1

; ======================биндим карту
if key_map in %CheckVarKey1MatchList%,%CheckVarKey2MatchList%,%CheckVarKey3MatchList%,%CheckVarKey4MatchList%
{
Gui,1: Font
GuiControl,1: Font, 1Textmap
IniWrite, %key_map%, data\genConfig.ini, Binds, key_map
}
Else
{
Gui,1: Font, cff0000
GuiControl,1: Font, 1Textmap
GuiControl,1:, key_map, F1
IniWrite, F1, data\genConfig.ini, Binds, key_map
toogglertumbler:=1
}
; ======================биндим оверлей
if key_overlay in %CheckVarKey1MatchList%,%CheckVarKey2MatchList%,%CheckVarKey3MatchList%,%CheckVarKey4MatchList%
{
Gui,1: Font
GuiControl,1: Font, 1Textoverlay
IniWrite, %key_overlay%, data\genConfig.ini, Binds, key_overlay
}
Else
{
Gui,1: Font, cff0000
GuiControl,1: Font, 1Textoverlay
GuiControl,1:, key_overlay, F2
IniWrite, F2, data\genConfig.ini, Binds, key_overlay
toogglertumbler:=1
}
; ======================биндим автоходьбу
if key_autowalk in %CheckVarKey1MatchList%,%CheckVarKey2MatchList%,%CheckVarKey3MatchList%,%CheckVarKey4MatchList%
{
Gui,1: Font
GuiControl,1: Font, 1Textautowalk
IniWrite, %key_autowalk%, data\genConfig.ini, Binds, key_autowalk
}
Else
{
Gui,1: Font, cff0000
GuiControl,1: Font, 1Textautowalk
GuiControl,1:, key_autowalk, F3
IniWrite, F3, data\genConfig.ini, Binds, key_autowalk
toogglertumbler:=1
}
; ======================биндим скип нпс
if key_skipNPS in %CheckVarKey1MatchList%,%CheckVarKey2MatchList%,%CheckVarKey3MatchList%,%CheckVarKey4MatchList%
{
Gui,1: Font
GuiControl,1: Font, 1TextskipNPS
IniWrite, %key_skipNPS%, data\genConfig.ini, Binds, key_skipNPS
}
Else
{
Gui,1: Font, cff0000
GuiControl,1: Font, 1TextskipNPS
GuiControl,1:, key_skipNPS, Z
IniWrite, Z, data\genConfig.ini, Binds, key_skipNPS
toogglertumbler:=1
}
; ======================биндим фастлут
if key_fastlyt in %CheckVarKey1MatchList%,%CheckVarKey2MatchList%,%CheckVarKey3MatchList%,%CheckVarKey4MatchList%
{
Gui,1: Font
GuiControl,1: Font, 1Textfastlyt
IniWrite, %key_fastlyt%, data\genConfig.ini, Binds, key_fastlyt
}
Else
{
Gui,1: Font, cff0000
GuiControl,1: Font, 1Textfastlyt
GuiControl,1:, key_fastlyt, F
IniWrite, F, data\genConfig.ini, Binds, key_fastlyt
toogglertumbler:=1
}
; ======================биндим плавание
if key_autoswim in %CheckVarKey1MatchList%,%CheckVarKey2MatchList%,%CheckVarKey3MatchList%,%CheckVarKey4MatchList%
{
Gui,1: Font
GuiControl,1: Font, 1Textautoswim
IniWrite, %key_autoswim%, data\genConfig.ini, Binds, key_autoswim
}
Else
{
Gui,1: Font, cff0000
GuiControl,1: Font, 1Textautoswim
GuiControl,1:, key_autoswim, N
IniWrite, N, data\genConfig.ini, Binds, key_autoswim
toogglertumbler:=1
}
; ======================биндим вичер сенс
if key_vi4er_sens in %CheckVarKey1MatchList%,%CheckVarKey2MatchList%,%CheckVarKey3MatchList%,%CheckVarKey4MatchList%
{
Gui,1: Font
GuiControl,1: Font, 1Textvi4er_sens
IniWrite, %key_vi4er_sens%, data\genConfig.ini, Binds, key_vi4er_sens
}
Else
{
Gui,1: Font, cff0000
GuiControl,1: Font, 1Textvi4er_sens
GuiControl,1:, key_vi4er_sens, X
IniWrite, X, data\genConfig.ini, Binds, key_vi4er_sens
toogglertumbler:=1
}
; ======================биндим отмену анимации
if key_animcancel in %CheckVarKey1MatchList%,%CheckVarKey2MatchList%,%CheckVarKey3MatchList%,%CheckVarKey4MatchList%
{
Gui,1: Font
GuiControl,1: Font, 1Textanimcancel
IniWrite, %key_animcancel%, data\genConfig.ini, Binds, key_animcancel
}
Else
{
Gui,1: Font, cff0000
GuiControl,1: Font, 1Textanimcancel
GuiControl,1:, key_animcancel, V
IniWrite, V, data\genConfig.ini, Binds, key_animcancel
toogglertumbler:=1
}
; ======================настройка задржка бхопа
if (Checkbox1bhopDelayMs > -1 and Checkbox1bhopDelayMs < 1001)
{
Gui,1: Font
GuiControl,1: Font, 1TextaMs
IniWrite, %Checkbox1bhopDelayMs%, data\genConfig.ini, Setings, Checkbox1bhopDelayMs
}
Else
{
Gui,1: Font, cff0000
GuiControl,1: Font, 1TextaMs
GuiControl,1:, Checkbox1bhopDelayMs, 100
IniWrite, 100, data\genConfig.ini, Setings, Checkbox1bhopDelayMs
toogglertumbler:=1
}


IniWrite, %CheckboxRegDir%, data\genConfig.ini, Setings, ONregreadDir
IniWrite, %CheckboxtooltipVvoba%, data\genConfig.ini, Setings, showtooltipVvoba


IniWrite, %CheckboxFIXchat%, data\genConfig.ini, Setings, FIXchat
IniWrite, %CheckboxHighperformancemode%, data\genConfig.ini, Setings, Highperformancemode
IniWrite, %CheckboxMousemoveBow%, data\genConfig.ini, Extra, MousemoveBow
IniWrite, %CheckboxGlLanguage%, data\genConfig.ini, Setings, GlLanguage
IniWrite, %Checkboxshowmegui%, data\genConfig.ini, Setings, showmegui
IniWrite, %CheckboxScaleFIX%, data\genConfig.ini, Setings, ScaleFIX
IniWrite, %CheckboxScWinrenamer%, data\genConfig.ini, Setings, ScWinrenamer
IniWrite, %CheckboxScRenamer%, data\genConfig.ini, Setings, ScRenamer
IniWrite, %CheckboxScScHachCh%, data\genConfig.ini, Setings, ScHachCh
IniWrite, %CheckboxScOverlay%, data\genConfig.ini, Setings, ScOverlay
IniWrite, %CheckboxScRandomT%, data\genConfig.ini, Setings, ScRandomT

IniWrite, %CheckboxRegeditCheckBox1%, data\genConfig.ini, Setings, RegeditCheckBox1
IniWrite, %CheckboxRegeditCheckBox2%, data\genConfig.ini, Setings, RegeditCheckBox2
IniWrite, %CheckboxRegeditCheckBox3%, data\genConfig.ini, Setings, RegeditCheckBox3
IniWrite, %CheckboxRegeditCheckBox4%, data\genConfig.ini, Setings, RegeditCheckBox4

IniWrite, %Checkbox0map%, data\genConfig.ini, Setings, Checkbox1map
IniWrite, %Checkbox0overlay%, data\genConfig.ini, Setings, Checkbox1overlay
IniWrite, %Checkbox0autowalk%, data\genConfig.ini, Setings, Checkbox1autowalk
IniWrite, %Checkbox0fastlyt%, data\genConfig.ini, Setings, Checkbox1fastlyt
IniWrite, %Checkbox0skipNPS%, data\genConfig.ini, Setings, Checkbox1skipNPS
IniWrite, %Checkbox0autoswim%, data\genConfig.ini, Setings, Checkbox1autoswim
IniWrite, %Checkbox0vi4ersens%, data\genConfig.ini, Setings, Checkbox1vi4ersens
IniWrite, %Checkbox0animcancel%, data\genConfig.ini, Setings, Checkbox1animcancel
IniWrite, %Checkbox0bhop%, data\genConfig.ini, Setings, Checkbox1bhop
IniWrite, %Checkbox0bhopDelay%, data\genConfig.ini, Setings, Checkbox1bhopDelay




If toogglertumbler
Return

If ScRenamer
{
run %savereloadvar%
exitapp
return
}


Reload
Return

cancelexit:
Gui, 1: Cancel
Return



GuiClose:
ExitApp
Return



;============================================Указать путь к игре
gameway:
if (CheckboxRegDir == 0)
{
FileSelectFolder, DirVar228,::{20d04fe0-3aea-1069-a2d8-08002b30309d},3,Путь к папке с игрой `nПример "F:\Program Files\Genshin Impact"
if DirVar228 !=
{
GuiControl,1:, EditDir, %DirVar228%
Gui, 1: Submit, NoHide
IniWrite, %DirVar228%, data\genConfig.ini, Setings, DirGame
}
}
Return

AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"


;==================================================Выбор карты
pickmap:
Gui, 1: Submit, nohide
if list1488 = 1
IniWrite, 1, data\genConfig.ini, Setings, map
if list1488 = 2
IniWrite, 2, data\genConfig.ini, Setings, map
if list1488 = 3
IniWrite, 3, data\genConfig.ini, Setings, map
if list1488 = 4
IniWrite, 4, data\genConfig.ini, Setings, map
Return

;==================================================Выбор метода ввода
pickinput:
Gui, 1: Submit, nohide
if ListKeyDif = 1
IniWrite, 1, data\genConfig.ini, Setings, metodVvoda
if ListKeyDif = 2
IniWrite, 2, data\genConfig.ini, Setings, metodVvoda
if ListKeyDif = 3
IniWrite, 3, data\genConfig.ini, Setings, metodVvoda
Return



CheckboxRegDirG:
Gui, 1: Submit, nohide
If (CheckboxRegDir == 1) ; Если в конфиге путь к игре реестр вкл, то:
{
;=====================Реестр расположение папки с игрой
RegRead, DirVarGensh, HKEY_LOCAL_MACHINE, SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Genshin Impact, UninstallString
SplitPath, DirVarGensh,,DirVarGensh
GuiControl,1:, EditDir, %DirVarGensh%
IniWrite, 1, data\genConfig.ini, Setings, ONregreadDir
}
If (CheckboxRegDir == 0) ; Если в конфиге путь к игре реестр вкл, то:
{
IniRead, DirGame, data\genConfig.ini, Setings, DirGame
GuiControl,1:, EditDir, %DirGame%
IniWrite, 0, data\genConfig.ini, Setings, ONregreadDir
}

Return


;==================================================Переключить оверлей
Left::
PicOverlay1:
if overlay1toggle
{
var0ov -= 1
if (var0ov > 7)
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
GuiControl, 99: hide, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}

if (var0ov == 3)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay3.png
GuiControl, 99: hide, oIE
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
GuiControl, 99: -Redraw, oIE
GuiControl, 99: hide, oIE
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

if (var0ov == 7)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay7.png
GuiControl, 99: hide, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}

}
Else
{
SendInput {Left}
}
Return



;=====================================переключение оверлея Right
Right::
PicOverlay2:
if overlay1toggle
{
var0ov += 1
if (var0ov > 7)
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
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay2.png
GuiControl, 99: hide, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=0
}

if (var0ov == 3)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay3.png
GuiControl, 99: hide, oIE
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
GuiControl, 99: -Redraw, oIE
GuiControl, 99: hide, oIE
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

if (var0ov == 7)
{
if (zaglushka == 0)
{
GuiControl, 99: -Redraw, MyPictureVar1
GuiControl, 99: ,MyPictureVar1, data\genOverlay7.png
GuiControl, 99: hide, oIE
GuiControl, 99: +Redraw, MyPictureVar1
zaglushka:=1
}
}

}
Else
{
SendInput {Right}
}
Return





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
sleep 1
IfWinActive, %gameexe1337%
{
SendInput {MButton down}

	Random, RandomVarSc, 15, 20
	sleep %RandomVarSc%

sleep 1500
IfWinNotActive, %gameexe1337%
SendInput {MButton up}
sleep 1000
IfWinNotActive, %gameexe1337%
SendInput {MButton up}
sleep 1000

SendInput {MButton up}

	Random, RandomVarSc, 15, 20
	sleep %RandomVarSc%

sleep 200
}
Return


;======================================================================функция эмитации разных режимов ввода: SendInput, SendPlay, WinApi
multisendinput(SendInputKey, SendInputKeyStatus, SendPlayKey, SendPlayKeyStatus, WinApiKey, WinApiKeyStatus, WinApiMouseKey, WinApiMouseKeyStatus){
if metodVvoda = 1
	{
	SendInput, {%SendInputKey%%SendInputKeyStatus%}
	; tooltip SendInputKey1 = %metodVvoda%
	}
if metodVvoda = 2
	{
	Sendplay, {Blind}{%SendPlayKey%%SendPlayKeyStatus%}
	; tooltip SendPlayKey2 = %metodVvoda%
	}
if metodVvoda = 3
	{
	if WinApiMouseKeyStatus !=											;если не пусто то нажать клик и отпустить если WinApiMouseKeyStatus = 0x0004 отжать ЛКМ
		{
		DllCall("mouse_event", int, WinApiMouseKey, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		sleep 1
		DllCall("mouse_event", int, WinApiMouseKeyStatus, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		}
		Else															;если пусто то зажать клик
		{
		DllCall("mouse_event", int, WinApiMouseKey, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		}
	if WinApiKeyStatus = 0												;если 0 то нажать и отпустить
		{
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 0, int, 0)
		sleep 1
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 2, int, 0)
		}
	if WinApiKeyStatus = 1												;если 1 то зажать и держать
		{
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 0, int, 0)
		}
	; tooltip WinApiKey3 = %metodVvoda%
	}
}
;=========================================================SendInput={Blind}============функция эмитации разных режимов ввода: SendInput, SendPlay, WinApi
multisendinput2(SendInputKey, SendInputKeyStatus, SendPlayKey, SendPlayKeyStatus, WinApiKey, WinApiKeyStatus, WinApiMouseKey, WinApiMouseKeyStatus){
if metodVvoda = 1
	{
	SendInput, {%SendInputKey%%SendInputKeyStatus%}
	sleep 1
	; tooltip SendInputKey1 = %metodVvoda%
	}
if metodVvoda = 2
	{
	Sendplay, {Blind}{%SendPlayKey%%SendPlayKeyStatus%}
	; tooltip SendPlayKey2 = %metodVvoda%
	}
if metodVvoda = 3
	{
	if WinApiMouseKeyStatus !=											;если не пусто то нажать клик и отпустить если WinApiMouseKeyStatus = 0x0004 отжать ЛКМ
		{
		DllCall("mouse_event", int, WinApiMouseKey, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		sleep 1
		DllCall("mouse_event", int, WinApiMouseKeyStatus, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		}
		Else															;если пусто то зажать клик
		{
		DllCall("mouse_event", int, WinApiMouseKey, int, WinApiMouseX, int, WinApiMouseY, uint, 0, int, 0)
		}
	if WinApiKeyStatus = 0												;если 0 то нажать и отпустить
		{
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 0, int, 0)
		sleep 1
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 2, int, 0)
		}
	if WinApiKeyStatus = 1												;если 1 то зажать и держать
		{
		DllCall("keybd_event", int, WinApiKey, int, 0xA0, int, 0, int, 0)
		}
	; tooltip WinApiKey3 = %metodVvoda%
	}
}


;======================================================функция рандома
gen_password(length = 8)																;начало фукции длина пароля по дефолту 8
{																						
	possible = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890			;переменная с символами
	StringLen, max, possible															;сколько символов в переменной
	if length > %max%																	;если длина пароля больше переменной то выйти
	{																					
		MsgBox, Длина должна быть меньше количества возможных символов.				
		Exit, 40																		
	}																					
	Loop																				;начало петли
	{																					
		Random, rand, 1, max															;зарандомить от 1 до %число символов в переменной %possible%%
		StringMid, char, possible, rand, 1												;извлеч из %possible%(наши символы), номер символа %rand%, кол-во 1, в %char%
		IfNotInString, password, %char%													;повторился ли символ %password% и %char%
		{																				
			password = %password%%char%													;склеить то что было и новый символ
			if StrLen(password) >= length												;если длина строки %password% больше или равна длине %length%
				break																	;выйти из петли
		}																				
	}																					
	return password																		;вернуть сгенерированое значение в переменную
}


ParsButton:
Loop *.mid
FileMove, %A_LoopFileName%, data\soundall, 1 	;перемещаем все .mid файлы в папку
Index1:=0
Loop data\soundall\*.mid
{
if Index1 = 1
song1var= data/soundall/%A_LoopFileName%
if Index1 = 2
song2var= data/soundall/%A_LoopFileName%
if Index1 = 3
song3var= data/soundall/%A_LoopFileName%
if Index1 = 4
song4var= data/soundall/%A_LoopFileName%
if Index1 = 5
song5var= data/soundall/%A_LoopFileName%
if Index1 = 6
song6var= data/soundall/%A_LoopFileName%
if Index1 = 7
song7var= data/soundall/%A_LoopFileName%
if Index1 = 8
song8var= data/soundall/%A_LoopFileName%
if Index1 = 9
song9var= data/soundall/%A_LoopFileName%
if Index1 = 0
song0var= data/soundall/%A_LoopFileName%
if Index1 = 10
	Break
Index1++
}

midi_config_go= 	;подготовить переменную
(
{
  "always_reload_config": false,
  "songs": [
    {
      "key": "1",
      "file": "%song0var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "2",
      "file": "%song1var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "3",
      "file": "%song2var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "4",
      "file": "%song3var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "5",
      "file": "%song4var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "6",
      "file": "%song5var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "7",
      "file": "%song6var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "8",
      "file": "%song7var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "9",
      "file": "%song8var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "0",
      "file": "%song9var%",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    }
  ]
}
)
FileDelete, data\midi_config.json
FileEncoding
FileAppend, %midi_config_go%, data\midi_config.json
Return

ClearButton:
Loop data\soundall\*.mid
FileDelete, data\soundall\%A_LoopFileName%
clear_config_go= 	;подготовить переменную
(
{
  "always_reload_config": false,
  "songs": [
    {
      "key": "1",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "2",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "3",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "4",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "5",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "6",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "7",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "8",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "9",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    },
    {
      "key": "0",
      "file": "put the path to your midi file here",
      "channel_filter": [],
      "track_filter": [],
      "no_hold": true,
      "key_press_duration": 0.01,
      "skip_start": 0,
      "root_note": "auto",
      "auto_root_lowest": 48,
      "auto_root_highest": 84,
      "auto_root_use_count": true,
      "auto_root_use_channels": [],
      "auto_root_use_tracks": []
    }
  ]
}
)
FileDelete, data\midi_config.json
FileEncoding
FileAppend, %clear_config_go%, data\midi_config.json
Return

RunButton:
Run, cmd /k @echo Off & "%A_ScriptDir%\data\midi.py"
Return

pickregedit:
Run, cmd /k @echo Off & reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\miHoYo\Genshin Impact" /f & start "title" /b regedit.exe & exit
Return

MetkaMenu0:
sleep 100
exitapp
Return


MetkaMenu2:
if GlLanguage
MsgBox %WinName%`n`nF1 - Карта`nF2 - Оверлей`nF3 - Автоходьба`nF - Фастлут`nZ - Скип диалогов`nX - Ведьмачье чутье (дабл клик вкл, сингл клик выкл)`nN - Плавание`nV - Macro Key`nSpace - Банихоп`nLeft - Пролистать оверлей`nRight - Пролистать оверлей`nEnd - Завершить работу скрипта
Else
MsgBox %WinName%`n`nF1 - Map`nF2 - Overlay`nF3 - Auto Walk`nF - Fastloot`nZ - Dialogue skip`nX - Witcher instinct (double click on, single click off)`nN - Swimming`nV - Macro Key`nSpace - Banihop`nLeft - Scroll overlay`nRight - Scroll overlay`nEnd - End the script
Return


AntiVACHashChanger:="fghfh3534gjdgdfgfj6867jhmbdsq4123asddfgdfgaszxxcasdf423dfght7657ghnbnghrtwer32esdfgr65475dgdgdf6867ghjkhji7456wsdfsf34sdfsdf324sdfgdfg453453453456345gdgdgdfsf"



*~$End::
Exitapp
Return
