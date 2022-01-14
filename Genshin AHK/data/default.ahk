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
InterceptionFishMouseMoveX=41
InterceptionFishMouseMoveY=0
InterceptionVentiMouseMoveX=61
InterceptionVentiMouseMoveY=0
DefaultJopaTrue=0
;Активный макрос запускаемый вместе со скриптом. 4 - Эмбер-фишль, 5 - Венти-ганьюй и тд
ShortcutKey=Numpad0
;Горячая клавиша для забинжевания ярлыка в системе CTRL-ALT-Numpad0 запускает программу
MousemoveBow=0
;Выравнивать спрей при макросной стрельбе с лука на фишль эмбер дионе ганьюй венти ёмии используя винапи режим, 1 - вкл, 0 - выкл
FishMouseMoveX=43
FishMouseMoveY=0
;Дефолтные значения Слабые лучники X - 43, Сильные лучники X - 61
VentiMouseMoveX=61
VentiMouseMoveY=0
[Setings]
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
RegeditCheckBox1=0
RegeditCheckBox2=0
RegeditCheckBox3=0
RegeditCheckBox4=0
showmegui=1
Checkbox1map=1
Checkbox1overlay=1
Checkbox1autowalk=1
Checkbox1fastlyt=1
Checkbox1skipNPS=1
Checkbox1autoswim=1
Checkbox1vi4ersens=1
Checkbox1animcancel=1
Checkbox1animcancelLock=0
Checkbox1bhop=1
Checkbox1bhopDelay=1
Checkbox1bhopDelayMs=100

metodVvoda=1
;Выбор режима ввода 1 - SendInput, 2 - WinApi, 3 - AHI+Input

showtooltipVvoba=1
;Отображать Tooltip подсказки вверху при выборе макроса нумпад клавиатурой, 1 - да 0 - нет

BrauzerCheck=0
;Выбор браузера для запуска карты: 0 - Браузер по умолчанию, 1 - указать нужный браузер ниже

BrauzerPick=chrome.exe --app=https://webstatic-sea.mihoyo.com/app/ys-map-sea/
;Указать путь к браузеру(кавычки не обязательно) Пример: firefox.exe, chrome.exe, opera.exe, browser.exe для установленных браузеров, для портативных абсолютный путь "C:\Users\Nagibskiy\Desktop\GoogleChromePortable\GoogleChromePortable.exe"

GameExe=ahk_class UnityWndClass
;Исполняемый файл, класс, имя окна или ПИД для взаимодействия с окном, класс лучше так как работает на любом регионе, если сломалось то можно попробывать ahk_exe GenshinImpact.exe

Map2toggle=1
;Выбор интерактивной карты 1 - Mihoyo(Официальная карта михуё), 2 - Genshin-impact-map(Самая первая карта), 3 - Mapgenie.io(Платная карта), 4 - Yuanshen.site(Китайская карта)

ONregreadDir=1
;Считать путь к игре с реестра автоматически 1 - Да, 0 - Указать путь вручную ниже

DirGame=C:\
;Указать путь к игре вручную
)
MsgBox Restore genConfig.ini ?
FileDelete, genConfig.ini
FileAppend, %def_config_go%, genConfig.ini
MsgBox Ok


