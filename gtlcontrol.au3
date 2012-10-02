; gigabyte gtl control
; by pro
$version="gtl control - by pro@teamau - v1.03 - last modified 2/10/12"

;set hotkeys
HotKeySet("{F1}", "_func_f1")
HotKeySet("{F2}", "_func_f2")
HotKeySet("{F3}", "_func_f3")
HotKeySet("{F4}", "_func_f4")
HotKeySet("{F10}", "_func_f10")

;pre-load variables
$title = 1
$debug = IniRead ( "gtlcontrol.ini", "debug", "debug", "0")
$idle = IniRead ( "gtlcontrol.ini", "debug", "idle", "0")
$title = IniRead ( "gtlcontrol.ini", "debug", "title", "1")
$windowtitle = IniRead ( "gtlcontrol.ini", "debug", "windowtitle", "GIGABYTE TweakLauncher 1.0(IVB)")
$showversion= IniRead ( "gtlcontrol.ini", "debug", "showversion", "0")


$f1_multi = IniRead ( "gtlcontrol.ini", "f1", "multi", "0")
$f1_multienable = IniRead ( "gtlcontrol.ini", "f1", "multienable", "0")
$f1_bclk = IniRead ( "gtlcontrol.ini", "f1", "bclk", "0")
$f1_bclkenable = IniRead ( "gtlcontrol.ini", "f1", "bclkenable", "0")
$f1_volt = IniRead ( "gtlcontrol.ini", "f1", "volt", "0")
$f1_voltenable = IniRead ( "gtlcontrol.ini", "f1", "voltenable", "0")

$f2_multi = IniRead ( "gtlcontrol.ini", "f2", "multi", "0")
$f2_multienable = IniRead ( "gtlcontrol.ini", "f2", "multienable", "0")
$f2_bclk = IniRead ( "gtlcontrol.ini", "f2", "bclk", "0")
$f2_bclkenable = IniRead ( "gtlcontrol.ini", "f2", "bclkenable", "0")
$f2_volt = IniRead ( "gtlcontrol.ini", "f2", "volt", "0")
$f2_voltenable = IniRead ( "gtlcontrol.ini", "f2", "voltenable", "0")

$f3_multi = IniRead ( "gtlcontrol.ini", "f3", "multi", "0")
$f3_multienable = IniRead ( "gtlcontrol.ini", "f3", "multienable", "0")
$f3_bclk = IniRead ( "gtlcontrol.ini", "f3", "bclk", "0")
$f3_bclkenable = IniRead ( "gtlcontrol.ini", "f3", "bclkenable", "0")
$f3_volt = IniRead ( "gtlcontrol.ini", "f3", "volt", "0")
$f3_voltenable = IniRead ( "gtlcontrol.ini", "f3", "voltenable", "0")

$f4_multi = IniRead ( "gtlcontrol.ini", "f4", "multi", "0")
$f4_multienable = IniRead ( "gtlcontrol.ini", "f4", "multienable", "0")
$f4_bclk = IniRead ( "gtlcontrol.ini", "f4", "bclk", "0")
$f4_bclkenable = IniRead ( "gtlcontrol.ini", "f4", "bclkenable", "0")
$f4_volt = IniRead ( "gtlcontrol.ini", "f4", "volt", "0")
$f4_voltenable = IniRead ( "gtlcontrol.ini", "f4", "voltenable", "0")


;popup windows
if ($title = 1 ) Then
  msgbox(0, "TEAMAU baby", "teamau scriptz k1ddie division in da houze")
EndIf

if ($debug = 1) Then
	msgbox(0, "Debug", "Debug mode enabled.. you might want to turn this off")
 EndIf
 
 if ($showversion = 1) Then
	msgbox(0, "Version Info", $version)
EndIf


;main functions
Func _func_f1()
	
	if ($f1_bclkenable = 1) Then
	  controlclick($windowtitle, "", "Edit1", "left", 1)
	  controlsend($windowtitle, "", "Edit1", "{BS 10}")
	  controlsend($windowtitle, "", "Edit1", $f1_bclk)
	EndIf
	if ($f1_multienable = 1) Then
	  controlclick($windowtitle, "", "Edit3", "left", 1)
	  controlsend($windowtitle, "", "Edit3", "{BS 10}")
	  controlsend($windowtitle, "", "Edit3", $f1_multi)
	EndIf
	if ($f1_voltenable = 1) Then
	  controlclick($windowtitle, "", "Edit7", "left", 1)
	  controlsend($windowtitle, "", "Edit7", "{BS 10}")
	  controlsend($windowtitle, "", "Edit7", $f1_volt)
	EndIf
	controlclick($windowtitle, "", "Button5", "left", 1)
	
	if ($debug = 1) Then
      MsgBox(0, "F1 debug ", "multi: " & $f1_multi & " - multienable: " & $f1_multienable & " - bclk: " & $f1_bclk & " - bclkenable: " & $f1_bclkenable & " - volts: " & $f1_volt & " - voltsenable: " & $f1_voltenable)
    EndIf
EndFunc  

Func _func_f2()

	if ($f2_bclkenable = 1) Then
	  controlclick($windowtitle, "", "Edit1", "left", 1)
	  controlsend($windowtitle, "", "Edit1", "{BS 10}")
	  controlsend($windowtitle, "", "Edit1", $f2_bclk)
	EndIf
	if ($f2_multienable = 1) Then
	  controlclick($windowtitle, "", "Edit3", "left", 1)
	  controlsend($windowtitle, "", "Edit3", "{BS 10}")
	  controlsend($windowtitle, "", "Edit3", $f2_multi)
	EndIf
	if ($f2_voltenable = 1) Then
	  controlclick($windowtitle, "", "Edit7", "left", 1)
	  controlsend($windowtitle, "", "Edit7", "{BS 10}")
	  controlsend($windowtitle, "", "Edit7", $f2_volt)
	EndIf
	controlclick($windowtitle, "", "Button5", "left", 1)

	if ($debug = 1) Then
      MsgBox(0, "F2 debug ", "multi: " & $f2_multi & " - multienable: " & $f2_multienable & " - bclk: " & $f2_bclk & " - bclkenable: " & $f2_bclkenable & " - volts: " & $f2_volt & " - voltsenable: " & $f2_voltenable)
    EndIf
EndFunc  

Func _func_f3()

	if ($f3_bclkenable = 1) Then
	  controlclick($windowtitle, "", "Edit1", "left", 1)
	  controlsend($windowtitle, "", "Edit1", "{BS 10}")
	  controlsend($windowtitle, "", "Edit1", $f3_bclk)
	EndIf
	if ($f3_multienable = 1) Then
	  controlclick($windowtitle, "", "Edit3", "left", 1)
	  controlsend($windowtitle, "", "Edit3", "{BS 10}")
	  controlsend($windowtitle, "", "Edit3", $f3_multi)
	EndIf
	if ($f3_voltenable = 1) Then
	  controlclick($windowtitle, "", "Edit7", "left", 1)
	  controlsend($windowtitle, "", "Edit7", "{BS 10}")
	  controlsend($windowtitle, "", "Edit7", $f3_volt)
	EndIf
	controlclick($windowtitle, "", "Button5", "left", 1)

	if ($debug = 1) Then
      MsgBox(0, "F3 debug ", "multi: " & $f3_multi & " - multienable: " & $f3_multienable & " - bclk: " & $f3_bclk & " - bclkenable: " & $f3_bclkenable & " - volts: " & $f3_volt & " - voltsenable: " & $f3_voltenable)
    EndIf
EndFunc  

Func _func_f4()

	if ($f4_bclkenable = 1) Then
	  controlclick($windowtitle, "", "Edit1", "left", 1)
	  controlsend($windowtitle, "", "Edit1", "{BS 10}")
	  controlsend($windowtitle, "", "Edit1", $f4_bclk)
	EndIf
	if ($f4_multienable = 1) Then
	  controlclick($windowtitle, "", "Edit3", "left", 1)
	  controlsend($windowtitle, "", "Edit3", "{BS 10}")
	  controlsend($windowtitle, "", "Edit3", $f4_multi)
	EndIf
	if ($f4_voltenable = 1) Then
	  controlclick($windowtitle, "", "Edit7", "left", 1)
	  controlsend($windowtitle, "", "Edit7", "{BS 10}")
	  controlsend($windowtitle, "", "Edit7", $f4_volt)
	EndIf
	controlclick($windowtitle, "", "Button5", "left", 1)

	if ($debug = 1) Then
      MsgBox(0, "F4 debug ", "multi: " & $f4_multi & " - multienable: " & $f4_multienable & " - bclk: " & $f4_bclk & " - bclkenable: " & $f4_bclkenable & " - volts: " & $f4_volt & " - voltsenable: " & $f4_voltenable)
    EndIf
EndFunc  

;some fun
Func _func_f10()
      MsgBox(0, "pwned", "teamau pwns you biziatch")
EndFunc 

;idle loop
While 1
    Sleep($idle);idle
WEnd


;eof
exit

