#Persistent  ; Keep the script running

iniF := "gcw.ini"
iniH := "Game Controller Wedge"
OldTitle = ""
NewTitle = ""
openWinText = ""
openWinIx := 1
winList := []
profileList := []
selectedProfile := "Game Controller Wedge"
profileStr := ""
profileIx := 1
newProfileName := ""
gcName := ""
gcPOV := -1
Msg1 := "message btn1 {return}"
Msg2 := "message btn2 {return}"
Msg3 := "message btn3 {return}"
Msg4 := "message btn4 {return}"
Msg5 := "message btn5 {return}"
Msg6 := "message btn6 {return}"
Msg7 := "message btn7 {return}"
Msg8 := "message btn8 {return}"
Msg9 := "message btn9 {return}"
Msg10 := "message btn10 {return}"
Msg11 := "message btn11 {return}"
Msg12 := "message btn12 {return}"
eb1 := 1
eb2 := 1
eb3 := 1
eb4 := 1
eb5 := 1
eb6 := 1
eb7 := 1
eb8 := 1
eb9 := 1
eb10 := 1
eb11 := 1

eb12 := 1

allProfiles = ""

Gui, 1:font,s10,Bold
Gui, 1:Color, acdcfa
Gui, 1:Add, Text, x6 y8 w45 h20 , Btn1:
Gui, 1:Add, Edit, x130 y0 w490 h30 multi vMsg1, GC1 - send string{return}
Gui, 1:Add, Edit, x130 y39 w490 h30 multi vMsg2, GC2 - send string{return}
Gui, 1:Add, Edit, x130 y79 w490 h30 multi vMsg3, GC3 - send string{return}
Gui, 1:Add, Edit, x130 y119 w490 h30 multi vMsg4, GC4- send string{return}
Gui, 1:Add, Edit, x130 y159 w490 h30 multi vMsg5, GC5 - send string{return}
Gui, 1:Add, Edit, x130 y199 w490 h30 multi vMsg6, GC6 - send string{return}
Gui, 1:Add, Edit, x130 y239 w490 h30 multi vMsg7, GC7 - send string{return}
Gui, 1:Add, Edit, x130 y279 w490 h30 multi vMsg8, GC8 - send string{return}
Gui, 1:Add, Edit, x130 y319 w490 h30 multi vMsg9, GC9 - send string{return}
Gui, 1:Add, Edit, x130 y359 w490 h30 multi vMsg10, GC10 - send string{return}
Gui, 1:Add, Edit, x130 y399 w490 h30 multi vMsg11, GC11 - send string{return}
Gui, 1:Add, Edit, x130 y439 w490 h30 multi vMsg12, GC12 - send string{return}
Gui, 1:Add, Text, x6 y45 w40 h20 , Btn2:
Gui, 1:Add, Text, x6 y85 w40 h20 , Btn3:
Gui, 1:Add, Text, x6 y125 w40 h20 , Btn4:
Gui, 1:Add, Text, x6 y165 w40 h20 , Btn5:
Gui, 1:Add, Text, x6 y205 w40 h20 , Btn6:
Gui, 1:Add, Text, x6 y245 w40 h20 , Btn7:
Gui, 1:Add, Text, x6 y285 w40 h20 , Btn8:
Gui, 1:Add, Text, x6 y325 w40 h20 , Btn9:
Gui, 1:Add, Text, x6 y365 w40 h20 , Btn10:
Gui, 1:Add, Text, x6 y405 w40 h20 , Btn11:
Gui, 1:Add, Text, x6 y445 w40 h20 , Btn12:
Gui, 1:Add, Text, x6 y485 w520 h20 , Using Profile: 
Gui, 1:Add, Text, x6 y505 w250 h20 vGCsendsTo, Sending To:
Gui, 1:Add, DropDownList, x90 y479 w530 gnewProfile vselectedProfile, %selectedProfile%||%profileStr%

Gui, 1:Add, CheckBox, x60 y0 w60 h30 vEb1 checked, Enable
Gui, 1:Add, CheckBox, x60 y39 w60 h30 vEb2 checked,Enable
Gui, 1:Add, CheckBox, x60 y79 w60 h30 checked vEb3, Enable
Gui, 1:Add, CheckBox, x60 y119 w60 h30 checked vEb4, Enable
Gui, 1:Add, CheckBox, x60 y159 w60 h30 checked vEb5, Enable
Gui, 1:Add, CheckBox, x60 y199 w60 h30 checked vEb6, Enable
Gui, 1:Add, CheckBox, x60 y239 w60 h30 checked vEb7, Enable
Gui, 1:Add, CheckBox, x60 y279 w60 h30 checked vEb8, Enable
Gui, 1:Add, CheckBox, x60 y319 w60 h30 checked vEb9, Enable
Gui, 1:Add, CheckBox, x60 y359 w60 h30 checked vEb10, Enable
Gui, 1:Add, CheckBox, x60 y399 w60 h30 checked vEb11, Enable
Gui, 1:Add, CheckBox, x60 y439 w60 h30 checked vEb12, Enable
Gui, 1:Add, Button, x5 y530 w100 h30 gEnableAll, Enable All
Gui, 1:Add, Button, x110 y530 w100 h30 gDisableAll, Disable All
Gui, 1:Add, Button, x215 y530 w100 h30 gsaveProfile, Save Profile
Gui, 1:Add, Button, x320 y530 w100 h30 gsaveAsNewProfile, Save Profile As
Gui, 1:Add, Button, x425 y530 w100 h30 gdelProfile, Delete Profile
Gui, 1:Add, Button, x530 y530 w100 h30 ggetHelp, About GCW


 
; Generated using SmartGUI Creator 4.0


Gui, 2:+LastFound +AlwaysOnTop +E0x08000000
Gui, 2:font,s10,Bold
Gui, 2:Color, efd4ff
Gui, 2:Add, Button, x10 y10 w50 h30 gsndMsg1, Joy1
Gui, 2:Add, Button, x70 y10 w50 h30 gsndMsg2, Joy2
Gui, 2:Add, Button, x130 y10 w50 h30 gsndMsg3, Joy3
Gui, 2:Add, Button, x190 y10 w50 h30 gsndMsg4, Joy4
Gui, 2:Add, Button, x250 y10 w50 h30 gsndMsg5, Joy5
Gui, 2:Add, Button, x310 y10 w50 h30 gsndMsg6, Joy6
Gui, 2:Add, Button, x370 y10 w50 h30 gsndMsg7, Joy7
Gui, 2:Add, Button, x430 y10 w50 h30 gsndMsg8, Joy8
Gui, 2:Add, Button, x490 y10 w50 h30 gsndMsg9, Joy9
Gui, 2:Add, Button, x550 y10 w50 h30 gsndMsg10, Joy10
Gui, 2:Add, Button, x610 y10 w50 h30 gsndMsg11, Joy11
Gui, 2:Add, Button, x670 y10 w50 h30 gsndMsg12, Joy12
Gui, 2:Add, Button, x730 y10 w50 h30 gshowGCW, GCW
Gui, 2:Add, Text, x10 y44 w250 h20 vActiveW, Sending to: 
; Generated using SmrtGUI Creator 4.0
Gui, 2:Show, x250 y0 h60 w785, Test Joy Buttons
Gui, 1:Show, x145 y100 h571 w642, Game Controller Wedge


CoordMode, Mouse, Screen
CoordMode, toolTip, Screen
WinGetTitle, OldTitle, A
SetTimer, updateActiveWInfo, 2500
SetTitleMatchMode, 2
gosub, updateActiveWInfo
gosub, iniSetup

updateActiveWInfo:
	{ 
		Global OldTitle
		WinGetActiveTitle, NewTitle
		ActiveWTxt = Sending to: %NewTitle%
		if ( NewTitle != OldTitle)
			{
				OldTitle = NewTitle
				GuiControl, 2:Text, ActiveW, %ActiveWTxt%
				GuiControl, 1:Text, GCsendsTo, %ActiveWTxt%
			}
		
		gcPOV := GetKeyState(joyPOV,P)
		gcName := GetKeyState(joyName,P)
		Return
	}
	
nextWindow:
	{ 
		Global openWinIx
		Global winList
		goSub, getOpenWindows
		sleep, 200
		len := winList.length()
		openWinIx := openWinIx + 1
		if (openWinIx > len) 
			{
				openWinIx := 1
			}
		WinActivate, % winList[openWinIx]
		Return
		
	}

setVars:
		{			
			Gui, Submit, NoHide
			return
		}
		
newProfile:
	{
		goSub, setVars
		goSub, iniSetup
		
	}
	Return


saveProfile:
	{
		msgBox, 36, Saving Profile: %selectedProfile%, Do you want to save: %selectedProfile%
		ifMsgBox, No 
			return
		goSub, setVars
		goSub, iniSave
		Return
		
	}
	return
	
saveAsNewProfile:
	{	
		Global selectedProfile
		goSub, setVars
		InputBox,newProfileName,Save As, Please enter a new profile name,,500,150
		if (newProfileName == "")
			{
				return
			}
		
		selectedProfile := newProfileName
		msgBox, Saving as new %selectedProfile%
		goSub, iniSave
		return
	}
	
delProfile:
	{

		if inStr(selectedProfile, "Game Controller Wedge")
			{
				msgBox, Sorry! Profile- Game Controller Wedge -can not be deleted.
				return
			}
		msgBox, 36, Delete profile: %selecteProfile%, Are you sure you want to delete profile: %selectedProfile% ?
		ifMsgBox, No
			return
		iniDelete, %iniF%, %selectedProfile%
		Sleep, 100
		selectedProfile := "Game Controller Wedge"
		goSub, iniSetup
		GuiControl, 1:Choose, selectedProfile, %selectedProfile%				
		return
	}
	
getProfile(someProfileString)
	{
		global selectedProfile
		global profileList
		global profileIx
		Loop, % profileList.Length()
			{
				if inStr(someProfileString, profileList[A_Index])
					{
						selectedProfile := profileList[A_Index]
						goSub, iniSetup
						Sleep, 100
						GuiControl, 1:Choose, selectedProfile, %selectedProfile%
						break
					}
				
			}
		return
	}
	
; get mouse coords --> Alt+m
!m::	
	MouseGetPos, m_x, m_y,,
	tipText :=  "mouse position is " . m_x . " , " . m_y
	toolTip %tipText%
return

; dismiss tootip  --> Ctl+Alt+m
^!m::
	toolTip  
return

getIndex(arr, item) {
    for index, value in arr {
        if (value = item) {
            return index
        }
    }
    return -1  ; Return -1 if the item is not found
}

updateView:
	{
		loop, 12  ; uodate the messages and the enablement of all 12 game controller buttons.
		{
			enableX := "Eb" . A_Index
			msgX := "Msg" . A_Index
			GuiControl,1:, %enableX%, % %enableX%
			GuiControl,1:,%msgX%, % %msgX%
		}
		allProfiles := ""
		profileStr := ""
		iniRead, allProfiles,%iniF%
		GuiControl,,selectedProfile,|   ; reset the DropDownList of profiles in gcw.ini
		
		profileStr := strReplace(allProfiles,"`n","|")
		profileList := strSplit(profileStr,"|")
		GuiControl,,selectedProfile, %selectedProfile% || %profileStr%
		Return
	}
	
showProfileList:
	{
		daList := ""
		Loop, % profileList.Length()
			{
				daList .= profileList[A_Index] . "`n"
			}
		msgBox % daList
		Return
	}
	
nextProfile:
	{
		global profileIx
		global profileList
		global selectedProfile
		++profileIx
		if (profileIx > profileList.Length())
			{
				profileIx := 1
			}
		selectedProfile := profileList[profileIx]
		goSub, iniSetup
		
		sleep, 100
		GuiControl, 1:Choose, selectedProfile, %selectedProfile%
		
		return
	}
	
getHelp:
	{
		run, GCW_help.pdf
		return
	}

EnableAll:
	{
	loop, 12
		{
			btnX := "Eb" . A_Index
			GuiControl,, %btnX%, 1
		}
	}
Return

DisableAll:
	{
	loop, 12
		{
			btnX := "Eb" . A_Index
			GuiControl,, %btnX%, 0
		}
	}
Return

Joy1::
sndMsg1:
	{	
		Gui,1:Submit,NoHide
		if (Eb1) {
			
			parseMsg(Msg1)
		}
		Return
	}
	

Joy2::
sndMsg2:
	{
		Gui,1:Submit,NoHide
		if (Eb2) {
			
			parseMsg(Msg2)
		}
		Return
	}

Joy3::
sndMsg3:
	{
		Gui,1:Submit,NoHide
		if (Eb3) {
			
			parseMsg(Msg3)
		}
		Return
	}

Joy4::
sndMsg4:
	{
		Gui,1:Submit,NoHide
		if (Eb4) {
			
			parseMsg(Msg4)
		}
		Return
	}

Joy5::
sndMsg5:
	{
		Gui,1:Submit,NoHide
		if (Eb5) {
			
			parseMsg(Msg5)
		}
		Return
	}

Joy6::
sndMsg6:
	{
		Gui,1:Submit,NoHide
		if (Eb6) {
			
			parseMsg(Msg6)
		}
		Return
	}

Joy7::
sndMsg7:
	{
		Gui,1:Submit,NoHide
		if (Eb7) {
			
			parseMsg(Msg7)
		}
		Return
	}

Joy8::
sndMsg8:
	{
		Gui,1:Submit,NoHide
		if (Eb8) {
			
			parseMsg(Msg8)
		}
		Return
	}


Joy9::
sndMsg9:
	{
		Gui,1:Submit,NoHide
		if (Eb9) {
			
			parseMsg(Msg9)
		}
		Return
	}

Joy10::
sndMsg10:
	{
		Gui,1:Submit,NoHide
		if (Eb10) {
			
			parseMsg(Msg10)
		}
		Return
	}
	
Joy11::
sndMsg11: 
	{
		Gui,1:Submit,NoHide
		if (Eb11) {
			
			parseMsg(Msg11)
		}
		Return
	}

Joy12::
sndMsg12: 
	{
		Gui,1:Submit,NoHide
		if (Eb12) {
			
			parseMsg(Msg12)
		}
		Return
	}


WinGetActiveTitle() {
	WinGetActiveTitle, v
	Return, v
}


parseMsg(someStr)
{
	msgStr := someStr
	loop, parse,msgStr,|
		{
			if (checkAction(A_LoopField)) 
				{
					
				} else 
				{
					Send, %A_LoopField%
				}
		}
	gosub, updateActiveWInfo
}

; These are special commands to run programs, open files, switch windows, switch profiles, list open windows, etc.

checkAction(someStr) {
global selectedProfile
global profileStr

if (inStr(someStr,"{R}")) ; Uses AHK run command to open applications, filetypes with associated apps
				{
					runStr := strReplace(someStr,"{R}")
					run, %runStr%
					goSub, updateActiveWInfo
					return 1
				} 
if (inStr(someStr,"{LW}")) ; Opens Message box with a list of currently open windows
		{
			gosub listWindows
			return 1
		}
if (inStr(someStr,"{NW}")) ; Shifts focus to the next open window
		{
			gosub nextWindow
			return 1
		}
if (inStr(someStr,"{TJB}")) ; Shows the "Test Joy Buttons" window
		{
			gosub showTJB
			return 1
		}
if (inStr(someStr,"{GCW}")) ; Shows the "Game Controller Wedge" Window
		{
			gosub showGCW
			return 1
		}
if (inStr(someStr,"{LP}")) ; Shows list of all profiles
		{
			goSub, showProfileList
			
			return 1
		}
if (inStr(someStr,"{NP}")) ; Loads next profile in list of profiles
		{
			
			goSub, nextProfile
			return 1
		}
if (inStr(someStr,"{SLEEP}")) ; Uses AHK sleep command to pause for X milliseconds
				{
					sleepStr := strReplace(someStr,"{SLEEP}")
					sleep, %sleepStr%
					return 1
				}
if (inStr(someStr,"{BEEP}")) ; makes a toot sound
		{
			
			SoundBeep
			return 1
		}
if (inStr(someStr,"{AW}")) ; Activates the window with any text that follows {WA}in its title
		{
			
			waStr := strReplace(someStr,"{AW}")
			WinActivate, %waStr%
			return 1
		}
if (inStr(someStr,"{GP}")) ; Gets the named Profile (if it exixts) that follows the {GP} command
		{
			
			getProfileStr := strReplace(someStr,"{GP}")
			getProfile(getProfileStr)
			return 1
		}
	return 0
}

showTJB:
{
	Gui, 2:Show, x250 y0 h70 w785, Test Joy Buttons
	Return
}

listWindows:
{
	Global openWinText
	goSub, getOpenWindows
	MsgBox, % openWinText
	return
}

getOpenWindows:
{
	Global winList
	Global openWinText
	r := ""

	WinGet windows, List
	Loop %windows%
		{
			id := windows%A_Index%
			WinGetTitle wt, ahk_id %id%
			if (wt)
				{
					r .= wt . "`n"
				}
		}
	openWinText := r
	winList := strSplit(r,"`n")
	Return
}

showGCW:
{

	WinActivate, Game Controller Wedge
	goSub, updateActiveWInfo
	return
}

; ini related routines to get or set values for each joystick button's related actions, send strings, and enablement 
; for each profle. Uses standard ini format where [header description] is followed by key=value pairs.

iniGet(iniKey,inF,inS) ; return a value from file: inF, under header: inS, for key: iniKey- Error yields a msgbox notice.
{
  
  iniRead, iniVar,%inF%,%inS%,%iniKey%
  if (iniVar == "ERROR")
   {
     msgBox Initalization error - %iniKey%, or %inF%, or %inS%, not found or misspelled
     
   }
  else
   {
     return iniVar
   }
}

iniSetup: ;retrieve values stored in file gcw.ini - refresh view
{
	iniH := selectedProfile
	Msg1 := iniGet("Msg1",iniF,iniH)
	Msg2 := iniGet("Msg2",iniF,iniH)
	Msg3 := iniGet("Msg3",iniF,iniH)
	Msg4 := iniGet("Msg4",iniF,iniH)
	Msg5 := iniGet("Msg5",iniF,iniH)
	Msg6 := iniGet("Msg6",iniF,iniH)
	Msg7 := iniGet("Msg7",iniF,iniH)
	Msg8 := iniGet("Msg8",iniF,iniH)
	Msg9 := iniGet("Msg9",iniF,iniH)
	Msg10 := iniGet("Msg10",iniF,iniH)
	Msg11 := iniGet("Msg11",iniF,iniH)
	Msg12 := iniGet("Msg12",iniF,iniH)
	Eb1 := iniGet("Eb1",iniF,iniH)
	Eb2 := iniGet("Eb2",iniF,iniH)
	Eb3 := iniGet("Eb3",iniF,iniH)
	Eb4 := iniGet("Eb4",iniF,iniH)
	Eb5 := iniGet("Eb5",iniF,iniH)
	Eb6 := iniGet("Eb6",iniF,iniH)
	Eb7 := iniGet("Eb7",iniF,iniH)
	Eb8 := iniGet("Eb8",iniF,iniH)
	Eb9 := iniGet("Eb9",iniF,iniH)
	Eb10 := iniGet("Eb10",iniF,iniH)
	Eb11 := iniGet("Eb11",iniF,iniH)
	Eb12 := iniGet("Eb12",iniF,iniH)
	
	
	goSub, updateView
	Return
}

iniSave: ; store values from variables, into file iniF, under header iniH, for each named key.
 {
	 iniH := selectedProfile
	 ;msgBox, saving profile: %iniH%
	 iniWrite, %Msg1%, %iniF%, %iniH%, Msg1
	 iniWrite, %Msg2%, %iniF%, %iniH%, Msg2
	 iniWrite, %Msg3%, %iniF%, %iniH%, Msg3
	 iniWrite, %Msg4%, %iniF%, %iniH%, Msg4
	 iniWrite, %Msg5%, %iniF%, %iniH%, Msg5
	 iniWrite, %Msg6%, %iniF%, %iniH%, Msg6
	 iniWrite, %Msg7%, %iniF%, %iniH%, Msg7
	 iniWrite, %Msg8%, %iniF%, %iniH%, Msg8
	 iniWrite, %Msg9%, %iniF%, %iniH%, Msg9
	 iniWrite, %Msg10%, %iniF%, %iniH%, Msg10
	 iniWrite, %Msg11%, %iniF%, %iniH%, Msg11
	 iniWrite, %Msg12%, %iniF%, %iniH%, Msg12
	 iniWrite, %Eb1%, %iniF%, %iniH%, Eb1
	 iniWrite, %Eb2%, %iniF%, %iniH%, Eb2
	 iniWrite, %Eb3%, %iniF%, %iniH%, Eb3
	 iniWrite, %Eb4%, %iniF%, %iniH%, Eb4
	 iniWrite, %Eb5%, %iniF%, %iniH%, Eb5
	 iniWrite, %Eb6%, %iniF%, %iniH%, Eb6
	 iniWrite, %Eb7%, %iniF%, %iniH%, Eb7
	 iniWrite, %Eb8%, %iniF%, %iniH%, Eb8
	 iniWrite, %Eb9%, %iniF%, %iniH%, Eb9
	 iniWrite, %Eb10%, %iniF%, %iniH%, Eb10
	 iniWrite, %Eb11%, %iniF%, %iniH%, Eb11
	 iniWrite, %Eb12%, %iniF%, %iniH%, Eb12
	 
	 goSub, iniSetup
	return
}

GuiClose:
ExitApp