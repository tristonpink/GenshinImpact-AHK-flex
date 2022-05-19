#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


def_config_go= 	;подготовить переменную
(
[Binds]
key_animcancel=V
key_map=F1
key_overlay=F2
key_autowalk=F3
key_fastlyt=F
key_skipNPS=Z
key_bhop=Space
key_vi4er_sens=X
key_autoswim=N
key_LabelNumpad0=Numpad0
key_LabelNumpad1=Numpad1
key_LabelNumpad2=Numpad2
key_LabelNumpad3=Numpad3
key_LabelNumpad4=Numpad4
key_LabelNumpad5=Numpad5
key_LabelNumpad6=Numpad6
key_LabelNumpad7=Numpad7
key_LabelNumpad8=Numpad8
key_LabelNumpad9=Numpad9
key_LabelNumpadAdd=NumpadAdd
key_LabelNumpadSub=NumpadSub
key_LabelANumpad0=!Numpad0
key_LabelANumpad1=!Numpad1
key_LabelANumpad2=!Numpad2
key_LabelANumpad3=!Numpad3
key_LabelANumpad4=!Numpad4
key_LabelANumpad5=!Numpad5
key_LabelANumpad6=!Numpad6
key_LabelANumpad7=!Numpad7
key_LabelANumpad8=!Numpad8
key_LabelANumpad9=!Numpad9
key_LabelANumpadAdd=!NumpadAdd
key_LabelANumpadSub=!NumpadSub
[Fish]
Prozra4nostiFis=TransBlack
OttenokFis=5
;OttenokFis 5 по дефолту
OptimizationFis=1
[Extra]
KeyboardVID=0
KeyboardPID=0
MouseVID=0
MousePID=0
InterceptionFishMouseMoveX=43
InterceptionFishMouseMoveY=0
InterceptionVentiMouseMoveX=61
InterceptionVentiMouseMoveY=0

;Активный макрос запускаемый вместе со скриптом. 4 - Эмбер-фишль, 5 - Венти-ганьюй и тд
DefaultJopaTrue=0

;Выравнивать спрей при макросной стрельбе с лука на фишль эмбер дионе ганьюй венти ёмии используя винапи режим, 1 - вкл, 0 - выкл
MousemoveBow=0

;Дефолтные значения Слабые лучники X - 43, Сильные лучники X - 61
FishMouseMoveX=43
FishMouseMoveY=0
VentiMouseMoveX=61
VentiMouseMoveY=0
[Expedition]
ExManualMode=0
ExMondK1=0
ExMondK2=0
ExMondK3=0
ExMondK4=0
ExMondK5=0
ExMondK6=0
ExLiyK1=0
ExLiyK2=0
ExLiyK3=0
ExLiyK4=0
ExLiyK5=0
ExLiyK6=0
ExInaK1=0
ExInaK2=0
ExInaK3=0
ExInaK4=0
ExInaK5=0
ExInaK6=0
[Setings]
Fastpickcfg=0
TTimerahk1=5
CheckUpdatePic=1
AutoExitAHK=0
IsAdmin=1
FIXchat=0
Highperformancemode=1
GlLanguage=0
ScRenamer=0
ScWinrenamer=0
ScHachCh=0
ScOverlay=0
ScRandomT=0
RegeditExport1=
RegeditExport2=
RegeditExport3=
RegeditExport4=
RegeditExport5=
showmegui=1
Checkbox1map=1
Checkbox1overlay=1
Checkbox1autowalk=1
Checkbox1fastlyt=1
Checkbox1skipNPS=1
Checkbox1locknpc=0
Checkbox1autoswim=1
Checkbox1vi4ersens=1
Checkbox1animcancel=1
Checkbox1bhop=1
Checkbox1bhopDelay=1
Checkbox1bhopDelayMs=100

;Выбор режима ввода 1 - SendInput, 2 - WinApi, 3 - AHI+Input
metodVvoda=1

;Отображать Tooltip подсказки вверху при выборе макроса нумпад клавиатурой, 1 - да 0 - нет
showtooltipVvoba=1

;Выбор браузера для запуска карты: 0 - Браузер по умолчанию, 1 - указать нужный браузер ниже
BrauzerCheck=0

;Указать путь к браузеру(кавычки не обязательно) Пример: firefox.exe, chrome.exe, opera.exe, browser.exe для установленных браузеров, для портативных абсолютный путь "C:\Users\Nagibskiy\Desktop\GoogleChromePortable\GoogleChromePortable.exe"
BrauzerPick=chrome.exe --app=https://webstatic-sea.mihoyo.com/app/ys-map-sea/

;Исполняемый файл, класс, имя окна или ПИД для взаимодействия с окном, класс лучше так как работает на любом регионе, если сломалось то можно попробывать ahk_exe GenshinImpact.exe
GameExe=ahk_class UnityWndClass

;Выбор интерактивной карты 1 - Mihoyo(Официальная карта михуё), 2 - Genshin-impact-map(Самая первая карта), 3 - Mapgenie.io(Платная карта), 4 - Yuanshen.site(Китайская карта)
Map2toggle=1

;Считать путь к игре с реестра автоматически 1 - Да, 0 - Указать путь вручную ниже
ONregreadDir=1

;Указать путь к игре вручную
DirGame=C:\
)

MsgBox 0x1, , Restore genConfig.ini ?
IfMsgBox OK, {
FileDelete, genConfig.ini
FileAppend, %def_config_go%, genConfig.ini
} Else IfMsgBox Cancel, {
ExitApp
}
ExitApp




