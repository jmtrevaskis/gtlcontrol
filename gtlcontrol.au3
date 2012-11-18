; gigabyte gtl control
; by pro
$version="gtl control - by pro@teamau - v2.00 - last modified 18/11/12"
$inifile="gtlcontrol.ini"

;delay to ensure hotkey registration works when "reloading"
sleep(350)

;pre-load variables
$title = 1
$debug = IniRead ( $inifile, "debug", "debug", "0")
$idle = IniRead ( $inifile, "debug", "idle", "25")
$title = IniRead ( $inifile, "debug", "title", "1")
$windowtitle = IniRead ( $inifile, "debug", "windowtitle", "GIGABYTE TweakLauncher 1.0(IVB)")
$showversion = IniRead ( $inifile, "debug", "showversion", "0")
$dontfuckupgtl = IniRead ( $inifile, "debug", "dontfuckupgtl", "0")
$gui = IniRead ( $inifile, "debug", "gui", "0")
$guirunning = 0
$gtlwarning = IniRead ( $inifile, "debug", "gtlwarning", "1")

$f1_multi = IniRead ( $inifile, "f1", "multi", "0")
$f1_multienable = IniRead ( $inifile, "f1", "multienable", "0")
$f1_bclk = IniRead ( $inifile, "f1", "bclk", "0")
$f1_bclkenable = IniRead ( $inifile, "f1", "bclkenable", "0")
$f1_volt = IniRead ( $inifile, "f1", "volt", "0")
$f1_voltenable = IniRead ( $inifile, "f1", "voltenable", "0")

$f2_multi = IniRead ( $inifile, "f2", "multi", "0")
$f2_multienable = IniRead ( $inifile, "f2", "multienable", "0")
$f2_bclk = IniRead ( $inifile, "f2", "bclk", "0")
$f2_bclkenable = IniRead ( $inifile, "f2", "bclkenable", "0")
$f2_volt = IniRead ( $inifile, "f2", "volt", "0")
$f2_voltenable = IniRead ( $inifile, "f2", "voltenable", "0")

$f3_multi = IniRead ( $inifile, "f3", "multi", "0")
$f3_multienable = IniRead ( $inifile, "f3", "multienable", "0")
$f3_bclk = IniRead ( $inifile, "f3", "bclk", "0")
$f3_bclkenable = IniRead ( $inifile, "f3", "bclkenable", "0")
$f3_volt = IniRead ( $inifile, "f3", "volt", "0")
$f3_voltenable = IniRead ( $inifile, "f3", "voltenable", "0")

$f4_multi = IniRead ( $inifile, "f4", "multi", "0")
$f4_multienable = IniRead ( $inifile, "f4", "multienable", "0")
$f4_bclk = IniRead ( $inifile, "f4", "bclk", "0")
$f4_bclkenable = IniRead ( $inifile, "f4", "bclkenable", "0")
$f4_volt = IniRead ( $inifile, "f4", "volt", "0")
$f4_voltenable = IniRead ( $inifile, "f4", "voltenable", "0")

$settings_enablebclkadjust = IniRead ( $inifile, "settings", "enablebclkadjust", "0")
$settings_enablemultiadjust = IniRead ( $inifile, "settings", "enablemultiadjust", "0")

;popup windows
if ($title = 1) Then
  traytip("", "the only 550k you had was a trimpot...", 1)
  ;msgbox(0, "GTLControl v2.0 by pro@teamau", "teamau scriptz k1ddie division in da houze")
EndIf

if ($debug = 1) Then
	msgbox(0, "Debug", "Debug mode enabled.. you might want to turn this off")
EndIf
 
;if ($showversion = 1) Then
;	msgbox(0, "Version Info", $version)
;EndIf

;startup checks
if (WinExists($windowtitle, "") = 0) And ($gtlwarning = 1) Then
  msgbox(0, "no GTL found", "GTL doesnt seem to be running, it might be a good idea to start it now.", 5)
Elseif ($dontfuckupgtl = 0) Then
  controlsettext($windowtitle, "", "[CLASS:Edit; INSTANCE:42]", "pro pwns me")
EndIf


;set hotkeys
HotKeySet("{F1}", "_func_f1")
HotKeySet("{F2}", "_func_f2")
HotKeySet("{F3}", "_func_f3")
HotKeySet("{F4}", "_func_f4")
HotKeySet("{F5}", "_func_togglegui")

if ($settings_enablemultiadjust = 1) Then
  HotKeySet("{F7}", "_func_multidown")
  HotKeySet("{F8}", "_func_multiup")
EndIf

if ($settings_enablebclkadjust = 1) Then
  HotKeySet("{F10}", "_func_bclkdown")
  HotKeySet("{F11}", "_func_bclkup")
EndIf


;GUI
if ($gui = 1) Then
   GUICreate($version, 490, 380)
   $guirunning=1
   GUISetState(@SW_SHOW)
   
   Opt("GUICoordMode", 2)
   $GUIButton_save = GUICtrlCreateButton("Save", 10, 30, 100)
   $GUIButton_guihide = GUICtrlCreateButton("GUI Hide", 0, -1)
   $GUIButton_reload = GUICtrlCreateButton("Reload", 0, -1)
   $GUIButton_quit = GUICtrlCreateButton("Quit", 0, -1)
   
   Opt("GUICoordMode", 1)
   
   $GUICheck_bclk = guictrlcreatecheckbox( "Enable BCLK hotkey", 0, 90)
   if ($settings_enablebclkadjust = 1) Then
	  GUICtrlSetstate($GUICheck_bclk, 1)
   EndIf
   
   $GUICheck_multi = guictrlcreatecheckbox( "Enable MULTI hotkey", 0, 110)
   if ($settings_enablemultiadjust = 1) Then
	  GUICtrlSetstate($GUICheck_multi, 1)
   EndIf
   
   $GUICheck_gui = guictrlcreatecheckbox( "Enable GUI", 0, 130)
   if ($gui = 1) Then
	  GUICtrlSetstate($GUICheck_gui, 1)
   EndIf
   
   
   ;f1
   guictrlcreatelabel( "Hotkey F1" , 20, 200)
   
   $GUICheck_f1bclkenable = guictrlcreatecheckbox( "Enable BCLK", 0, 220)
   if ($f1_bclkenable = 1) Then
	  GUICtrlSetstate($GUICheck_f1bclkenable, 1)
   EndIf
   guictrlcreatelabel( "BCLK" , 0, 242)
   $GUIInput_f1bclk = guictrlcreateinput( $f1_bclk, 50, 240, 50 )
   
   $GUICheck_f1multienable = guictrlcreatecheckbox( "Enable Multi", 0, 270)
   if ($f1_multienable = 1) Then
	  GUICtrlSetstate($GUICheck_f1multienable, 1)
   EndIf
   guictrlcreatelabel( "MULTI" , 0, 292)
   $GUIInput_f1multi = guictrlcreateinput( $f1_multi, 50, 290, 50 )
   
   $GUICheck_f1voltenable = guictrlcreatecheckbox( "Enable Volts", 0, 320)
   if ($f1_voltenable = 1) Then
	  GUICtrlSetstate($GUICheck_f1voltenable, 1)
   EndIf
   guictrlcreatelabel( "VOLTS" , 0, 342)
   $GUIInput_f1volt = guictrlcreateinput( $f1_volt, 50, 340, 45 )
   

   ;f2
   guictrlcreatelabel( "Hotkey F2" , 150, 200)
   
   $GUICheck_f2bclkenable = guictrlcreatecheckbox( "Enable BCLK", 130, 220)
   if ($f2_bclkenable = 1) Then
	  GUICtrlSetstate($GUICheck_f2bclkenable, 1)
   EndIf
   guictrlcreatelabel( "BCLK" , 130, 242)
   $GUIInput_f2bclk = guictrlcreateinput( $f2_bclk, 180, 240, 50 )
   
   $GUICheck_f2multienable = guictrlcreatecheckbox( "Enable Multi", 130, 270)
   if ($f2_multienable = 1) Then
	  GUICtrlSetstate($GUICheck_f2multienable, 1)
   EndIf
   guictrlcreatelabel( "MULTI" , 130, 292)
   $GUIInput_f2multi = guictrlcreateinput( $f2_multi, 180, 290, 50 )
   
   $GUICheck_f2voltenable = guictrlcreatecheckbox( "Enable Volts", 130, 320)
   if ($f2_voltenable = 1) Then
	  GUICtrlSetstate($GUICheck_f2voltenable, 1)
   EndIf
   guictrlcreatelabel( "VOLTS" , 130, 342)
   $GUIInput_f2volt = guictrlcreateinput( $f2_volt, 180, 340, 45 )
   
   
   ;f3
   guictrlcreatelabel( "Hotkey F3" , 280, 200)
   
   $GUICheck_f3bclkenable = guictrlcreatecheckbox( "Enable BCLK", 260, 220)
   if ($f3_bclkenable = 1) Then
	  GUICtrlSetstate($GUICheck_f3bclkenable, 1)
   EndIf
   guictrlcreatelabel( "BCLK" , 260, 242)
   $GUIInput_f3bclk = guictrlcreateinput( $f3_bclk, 310, 240, 50 )
   
   $GUICheck_f3multienable = guictrlcreatecheckbox( "Enable Multi", 260, 270)
   if ($f3_multienable = 1) Then
	  GUICtrlSetstate($GUICheck_f3multienable, 1)
   EndIf
   guictrlcreatelabel( "MULTI" , 260, 292)
   $GUIInput_f3multi = guictrlcreateinput( $f3_multi, 310, 290, 50 )
   
   $GUICheck_f3voltenable = guictrlcreatecheckbox( "Enable Volts", 260, 320)
   if ($f3_voltenable = 1) Then
	  GUICtrlSetstate($GUICheck_f3voltenable, 1)
   EndIf
   guictrlcreatelabel( "VOLTS" , 260, 342)
   $GUIInput_f3volt = guictrlcreateinput( $f3_volt, 310, 340, 45 )
   

   ;f4
   guictrlcreatelabel( "Hotkey F4" , 410, 200)
   
   $GUICheck_f4bclkenable = guictrlcreatecheckbox( "Enable BCLK", 390, 220)
   if ($f4_bclkenable = 1) Then
	  GUICtrlSetstate($GUICheck_f4bclkenable, 1)
   EndIf
   guictrlcreatelabel( "BCLK" , 390, 242)
   $GUIInput_f4bclk = guictrlcreateinput( $f4_bclk, 440, 240, 50 )
   
   $GUICheck_f4multienable = guictrlcreatecheckbox( "Enable Multi", 390, 270)
   if ($f4_multienable = 1) Then
	  GUICtrlSetstate($GUICheck_f4multienable, 1)
   EndIf
   guictrlcreatelabel( "MULTI" , 390, 292)
   $GUIInput_f4multi = guictrlcreateinput( $f4_multi, 440, 290, 50 )
   
   $GUICheck_f4voltenable = guictrlcreatecheckbox( "Enable Volts", 390, 320)
   if ($f4_voltenable = 1) Then
	  GUICtrlSetstate($GUICheck_f4voltenable, 1)
   EndIf
   guictrlcreatelabel( "VOLTS" , 390, 342)
   $GUIInput_f4volt = guictrlcreateinput( $f4_volt, 440, 340, 45 )
   
 
EndIf

func _func_togglegui()
   if ($gui = 1) Then
	  $guirunning=1
	  GUISetState(@SW_SHOW)
   elseif ($gui = 0) Then
	  Msgbox(0, "GUI is not enabled", "The GUI is not enabled, you must manually enable it in the gtlcontrol.ini file.", 5)
   EndIf
EndFunc

func _func_iniwrite()
   iniwrite($inifile, "settings", "enablebclkadjust", _func_evalcheck($GUICheck_bclk))
   iniwrite($inifile, "settings", "enablemultiadjust", _func_evalcheck($GUICheck_multi))
   iniwrite($inifile, "debug", "gui", _func_evalcheck($GUICheck_gui))
   
   ;f1
   iniwrite($inifile, "f1", "bclkenable", _func_evalcheck($GUICheck_f1bclkenable))
   iniwrite($inifile, "f1", "bclk", guictrlread($GUIInput_f1bclk))
   iniwrite($inifile, "f1", "multienable", _func_evalcheck($GUICheck_f1multienable))
   iniwrite($inifile, "f1", "multi", guictrlread($GUIInput_f1multi))
   iniwrite($inifile, "f1", "voltenable", _func_evalcheck($GUICheck_f1voltenable))
   iniwrite($inifile, "f1", "volt", guictrlread($GUIInput_f1volt))
   
   ;f2
   iniwrite($inifile, "f2", "bclkenable", _func_evalcheck($GUICheck_f2bclkenable))
   iniwrite($inifile, "f2", "bclk", guictrlread($GUIInput_f2bclk))
   iniwrite($inifile, "f2", "multienable", _func_evalcheck($GUICheck_f2multienable))
   iniwrite($inifile, "f2", "multi", guictrlread($GUIInput_f2multi))
   iniwrite($inifile, "f2", "voltenable", _func_evalcheck($GUICheck_f2voltenable))
   iniwrite($inifile, "f2", "volt", guictrlread($GUIInput_f2volt))
   
   
   ;f3
   iniwrite($inifile, "f3", "bclkenable", _func_evalcheck($GUICheck_f3bclkenable))
   iniwrite($inifile, "f3", "bclk", guictrlread($GUIInput_f3bclk))
   iniwrite($inifile, "f3", "multienable", _func_evalcheck($GUICheck_f3multienable))
   iniwrite($inifile, "f3", "multi", guictrlread($GUIInput_f3multi))
   iniwrite($inifile, "f3", "voltenable", _func_evalcheck($GUICheck_f3voltenable))
   iniwrite($inifile, "f3", "volt", guictrlread($GUIInput_f3volt))
   
   
   ;f4
   iniwrite($inifile, "f4", "bclkenable", _func_evalcheck($GUICheck_f4bclkenable))
   iniwrite($inifile, "f4", "bclk", guictrlread($GUIInput_f4bclk))
   iniwrite($inifile, "f4", "multienable", _func_evalcheck($GUICheck_f4multienable))
   iniwrite($inifile, "f4", "multi", guictrlread($GUIInput_f4multi))
   iniwrite($inifile, "f4", "voltenable", _func_evalcheck($GUICheck_f4voltenable))
   iniwrite($inifile, "f4", "volt", guictrlread($GUIInput_f4volt))
   
   
EndFunc

func _func_evalcheck($input)
   if (guictrlread($input) = 1) Then
	  return 1
   Else
	  return 0
   EndIf
endfunc


;main functions
Func _func_f1()
   
	$changemade=0

	if ($f1_bclkenable = 1) Then
      ControlSetText($windowtitle, "", "Edit1", $f1_bclk)
	  $changemade=1
	EndIf
	if ($f1_multienable = 1) Then
	  ControlSetText($windowtitle, "", "Edit3", $f1_multi)
	  $changemade=1
	EndIf
	if ($f1_voltenable = 1) Then
	  ControlSetText($windowtitle, "", "Edit7", $f1_volt)
	  $changemade=1
    EndIf
   
	if ($changemade = 1) Then
	  controlclick($windowtitle, "", "Button5", "left", 1)
	EndIf
	
EndFunc  

Func _func_f2()
   
	$changemade=0

	if ($f2_bclkenable = 1) Then
      ControlSetText($windowtitle, "", "Edit1", $f2_bclk)
	  $changemade=1
	EndIf
	if ($f2_multienable = 1) Then
	  ControlSetText($windowtitle, "", "Edit3", $f2_multi)
	  $changemade=1
	EndIf
	if ($f2_voltenable = 1) Then
	  ControlSetText($windowtitle, "", "Edit7", $f2_volt)
	  $changemade=1
    EndIf
   
	if ($changemade = 1) Then
	  controlclick($windowtitle, "", "Button5", "left", 1)
	EndIf
	
EndFunc  
  

Func _func_f3()
   
	$changemade=0

	if ($f3_bclkenable = 1) Then
      ControlSetText($windowtitle, "", "Edit1", $f3_bclk)
	  $changemade=1
	EndIf
	if ($f3_multienable = 1) Then
	  ControlSetText($windowtitle, "", "Edit3", $f3_multi)
	  $changemade=1
	EndIf
	if ($f3_voltenable = 1) Then
	  ControlSetText($windowtitle, "", "Edit7", $f3_volt)
	  $changemade=1
    EndIf
   
	if ($changemade = 1) Then
	  controlclick($windowtitle, "", "Button5", "left", 1)
	EndIf
	
EndFunc  

Func _func_f4()
   
	$changemade=0

	if ($f4_bclkenable = 1) Then
      ControlSetText($windowtitle, "", "Edit1", $f4_bclk)
	  $changemade=1
	EndIf
	if ($f4_multienable = 1) Then
	  ControlSetText($windowtitle, "", "Edit3", $f4_multi)
	  $changemade=1
	EndIf
	if ($f4_voltenable = 1) Then
	  ControlSetText($windowtitle, "", "Edit7", $f4_volt)
	  $changemade=1
    EndIf
   
	if ($changemade = 1) Then
	  controlclick($windowtitle, "", "Button5", "left", 1)
	EndIf
	
EndFunc  
  


func _func_multiup()
  $newmulti = ControlGetText ( $windowtitle, "", "Edit3" ) + 1
  ControlSetText ( $windowtitle, "", "Edit3", $newmulti )
  controlclick($windowtitle, "", "Button5", "left", 1)
EndFunc


func _func_multidown()
  $newmulti = ControlGetText ( $windowtitle, "", "Edit3" ) - 1
  ControlSetText ( $windowtitle, "", "Edit3", $newmulti )
  controlclick($windowtitle, "", "Button5", "left", 1)
EndFunc


func _func_bclkup()
  $newbclk = ControlGetText ( $windowtitle, "", "Edit1" ) + 1
  ControlSetText ( $windowtitle, "", "Edit1", $newbclk )
  controlclick($windowtitle, "", "Button5", "left", 1)
EndFunc


func _func_bclkdown()
  $newbclk = ControlGetText ( $windowtitle, "", "Edit1" ) - 1
  ControlSetText ( $windowtitle, "", "Edit1", $newbclk )
  controlclick($windowtitle, "", "Button5", "left", 1)
EndFunc

func _func_voltup()
  $newbclk = ControlGetText ( $windowtitle, "", "Edit7" ) + 0.025
  ControlSetText ( $windowtitle, "", "Edit7", $newbclk )
  controlclick($windowtitle, "", "Button5", "left", 1)
EndFunc


func _func_voltdown()
  $newbclk = ControlGetText ( $windowtitle, "", "Edit7" ) - 0.025
  ControlSetText ( $windowtitle, "", "Edit7", $newbclk )
  controlclick($windowtitle, "", "Button5", "left", 1)
EndFunc

;idle loop
While 1
   
      if ($guirunning = 1) Then
	  $msg = GUIGetMsg()
	  Select
		   case $msg = $GUIButton_save
			_func_iniwrite()
			traytip("", "Settings have been saved...", 1)
		   case $msg = $GUIButton_quit
			  Exit
		   case $msg = $GUIButton_guihide
			  traytip("", "GTLControl is still running minimized...", 1)
			  $guirunning=0
			  ;GUIDelete()
			  GUISetState(@SW_HIDE)
		   case $msg = $GUIButton_reload
			  run(@ScriptFullPath & " /restart")
			  sleep(50)
			  Exit
	  EndSelect
   EndIf
   
    Sleep($idle);idle
WEnd


;eof
exit

