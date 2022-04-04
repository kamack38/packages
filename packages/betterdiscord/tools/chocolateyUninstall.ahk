; #Warn  ; Enable warnings to assist with detecting common errors.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
SetBatchLines, -1

winTitle = BetterDiscord.exe

WinWait, ahk_exe %winTitle%,, 360
; WinHide, ahk_exe %winTitle%

sleep 1500
; Accept License
sleep, 100
ControlClick, X28 Y283, ahk_exe %winTitle%

; Next
sleep, 100
ControlClick, X500 Y320, ahk_exe %winTitle%

; Uninstall
sleep, 200
ControlClick, X250 Y200, ahk_exe %winTitle%

; Next
sleep, 200
ControlClick, X500 Y320, ahk_exe %winTitle%

; Check if path selected
sleep, 200
CoordMode, Pixel, Window
PixelGetColor, color, 320, 96
If color = 0x01B1514
    ControlClick, X320 Y96, ahk_exe %winTitle%
sleep, 10
ControlClick, X500 Y320, ahk_exe %winTitle%

; Wait for exit button
sleep, 5000

; Close
ControlClick, X500 Y320, ahk_exe %winTitle%

Exit