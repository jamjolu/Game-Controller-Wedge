#Persistent
#SingleInstance, Force
#Include XInput.ahk
SetTitleMatchMode, 2
DetectHiddenWindows, On 
ttsVolume := 50
tts:= ComObjCreate("SAPI.SpVoice")
tts.Volume := ttsVolume

; 1. Initialize the XInput library
XInput_Init()

; 2. Define standard XInput button bitmask constants
global XINPUT_GAMEPAD_DPAD_UP        := 0x0001
global XINPUT_GAMEPAD_DPAD_DOWN      := 0x0002
global XINPUT_GAMEPAD_DPAD_LEFT      := 0x0004
global XINPUT_GAMEPAD_DPAD_RIGHT     := 0x0008
global XINPUT_GAMEPAD_START          := 0x0010
global XINPUT_GAMEPAD_BACK           := 0x0020
global XINPUT_GAMEPAD_LEFT_THUMB     := 0x0040
global XINPUT_GAMEPAD_RIGHT_THUMB    := 0x0080
global XINPUT_GAMEPAD_LEFT_SHOULDER  := 0x0100
global XINPUT_GAMEPAD_RIGHT_SHOULDER := 0x0200
global XINPUT_GAMEPAD_A              := 0x1000
global XINPUT_GAMEPAD_B              := 0x2000
global XINPUT_GAMEPAD_X              := 0x4000
global XINPUT_GAMEPAD_Y              := 0x8000

; Keep track of the previous button state to detect initial "keydown" transitions
global PrevButtons := 0
global btnNum := 0


; 3. Establish a polling loop (runs every 20ms)
SetTimer, WatchController, 20
return

^!#x::	
	ExitApp
Return

WatchController:
	
    ; Query Controller User Index 0 (Player 1)
    if (State := XInput_GetState(0)) 
    {
        CurrentButtons := State.wButtons
        btnNum := 0  ; reset which btn was pressed.
        ; Verify if any button state changed since the last check
        if (CurrentButtons != PrevButtons) 
        {
            ; --- DETECT BUTTON DOWN (Press) ---
            ; Logic: Currently pressed AND was NOT pressed in the last frame
            if ((CurrentButtons & XINPUT_GAMEPAD_A) && !(PrevButtons & XINPUT_GAMEPAD_A))
            {
               btnNum := 1
            }
            
            if ((CurrentButtons & XINPUT_GAMEPAD_B) && !(PrevButtons & XINPUT_GAMEPAD_B))
            {
                btnNum := 2
            }
			
			 if ((CurrentButtons & XINPUT_GAMEPAD_X) && !(PrevButtons & XINPUT_GAMEPAD_X))
            {
                btnNum := 3
            }
			
			 if ((CurrentButtons & XINPUT_GAMEPAD_Y) && !(PrevButtons & XINPUT_GAMEPAD_Y))
            {
                btnNum := 4
            }
			
			if ((CurrentButtons & XINPUT_GAMEPAD_DPAD_UP) && !(PrevButtons & XINPUT_GAMEPAD_DPAD_UP))
            {
                btnNum := 9
            }
			
			if ((CurrentButtons & XINPUT_GAMEPAD_DPAD_RIGHT) && !(PrevButtons & XINPUT_GAMEPAD_DPAD_RIGHT))
            {
                btnNum := 10
            }
			
			if ((CurrentButtons & XINPUT_GAMEPAD_DPAD_DOWN) && !(PrevButtons & XINPUT_GAMEPAD_DPAD_DOWN))
            {
                btnNum := 11
            }
			
			if ((CurrentButtons & XINPUT_GAMEPAD_DPAD_LEFT) && !(PrevButtons & XINPUT_GAMEPAD_DPAD_LEFT))
            {
                btnNum := 12
            }
			
			if ((CurrentButtons & XINPUT_GAMEPAD_LEFT_SHOULDER) && !(PrevButtons & XINPUT_GAMEPAD_LEFT_SHOULDER))
            {
                btnNum := 5
            }
			
			if ((CurrentButtons & XINPUT_GAMEPAD_RIGHT_SHOULDER) && !(PrevButtons & XINPUT_GAMEPAD_RIGHT_SHOULDER))
            {
                btnNum := 6
            }
			
			if ((CurrentButtons & XINPUT_GAMEPAD_START) && !(PrevButtons & XINPUT_GAMEPAD_START))
            {
                btnNum := 8
            }
			
			if ((CurrentButtons & XINPUT_GAMEPAD_BACK) && !(PrevButtons & XINPUT_GAMEPAD_BACK))
            {
                btnNum := 7
            }

            ; --- DETECT BUTTON UP (Release) ---
            ; Logic: Was pressed in the last frame AND is NOT currently pressed
            if (!(CurrentButtons & XINPUT_GAMEPAD_A) && (PrevButtons & XINPUT_GAMEPAD_A))
            {
                
            }
			
		
        }
        
        ; Save the state for the next check cycle
        PrevButtons := CurrentButtons
		if (btnNum)
			{
				;tts.speak("a non zero number button pressed")
				;TargetScript := "1 - Game Controller Wedge"
				if WinExist("1 - Game Controller Wedge X")
						{
							;tooltip, GCW exists
							sendMessage, 0x8314, 1, %btnNum%
							
							
						
						}
			}
			
    } else {
		;tooltip, not player 1
	}
	
return



RemoveToolTip:
    ToolTip
return
