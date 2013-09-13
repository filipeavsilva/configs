; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.


;**************************   HOTSTRINGS   *****************************

;Insert a header on code comments
:c0O:<comhead::
	SendInput Filipe Silva @ %A_DD%/%A_MM%/%A_YYYY%
return

:ro*:<gs:: { get; set; }

:o*:<console_waitforkey::Console.WriteLine();{Enter}Console.WriteLine("Press any key to exit...");{Enter}Console.ReadKey();

:ro*:>tr::<%= _("")
;-----------------------------------------------------------------------

;****************************   HELPER FUNCTIONS   ******************************
; ===========================================================================
; Run a program or switch to it if already running.
;    Target - Program to run. E.g. Calc.exe or C:\Progs\Bobo.exe
;    WinTitle - Optional title of the window to activate.  Programs like
;    MS Outlook might have multiple windows open (main window and email
;    windows).  This parm allows activating a specific window.
; ===========================================================================

RunOrActivate(Target, WinTitle = "", Parameters = "")
{
   ; Get the filename without a path
   SplitPath, Target, TargetNameOnly

   Process, Exist, %TargetNameOnly%
   If ErrorLevel > 0
      PID = %ErrorLevel%
   Else
      Run, %Target% "%Parameters%", , , PID

   ; At least one app (Seapine TestTrack wouldn't always become the active
   ; window after using Run), so we always force a window activate.
   ; Activate by title if given, otherwise use PID.
   If WinTitle <> 
   {
      SetTitleMatchMode, 2
      WinWait, %WinTitle%, , 3
      TrayTip, , Activating Window Title "%WinTitle%" (%TargetNameOnly%)
      WinActivate, %WinTitle%
   }
   Else
   {
      WinWait, ahk_pid %PID%, , 3
      TrayTip, , Activating PID %PID% (%TargetNameOnly%)
      WinActivate, ahk_pid %PID%
   }


   SetTimer, RunOrActivateTrayTipOff, 1
}

; Turn off the tray tip
RunOrActivateTrayTipOff:
   SetTimer, RunOrActivateTrayTipOff, off
   TrayTip
Return

;-----------------------------------------------------------------------


;****************************   HOTKEYS   ******************************

;Shortcut for opening the console
; ^\::
	; RunorActivate("C:\Users\foliveira\Portable Apps\Console2\Console.exe", "Console", "")
; Return

;Shortcut to open the timeline file
^+<::
	Run "C:\Program Files\Vim\vim73\gvim.exe" --servername Timeline --remote-silent C:\Users\foliveira\Dropbox\Timeline\Work.timeline
Return


;Functions to create attributes in Dia

TabToAttributes()
{
	;Change tab to Attributes
	Send {Tab}+{Tab}{Right}
	;Sleep 200
}

AddAttribute(Name, Type, First, Nullable = 0, Unique = 0, Primary = 0)
{
	
	If First = 1
		Tabs = 2
	Else
		Tabs = 5
	
	Send {Tab %Tabs%}{Enter}
	;Sleep 200
	
	;Name
	SendInput %Name%
	Send {Tab}
	;Type
	SendInput %Type%
	;Sleep 100
	
	If Primary = 0
	{
		;Shift-tab to "Unique"
		Send {Shift down}{Tab 11}{Shift up}
		
		If Unique = 1
		{
			Send {Space}
			;Sleep 100
		}
		
		;Nullable
		Send +{Tab}
		If Nullable = 1
		{
			Send {Space}
			;Sleep 100
		}
	}
	Else
	{
		;Shift-tab to "Unique"
		Send {Shift down}{Tab 13}{Shift up}{Space}
	}
	
	;Tab to the control buttons
	Send ^{Tab}
}

SaveTable()
{
	;Tab to "OK" and press it
	Send ^{Tab}{Tab 2}{Enter}
}

CancelTable()
{
	;Tab to "Close" and press it
	Send ^{Tab}{Enter}
}

;Add TranslationId/DefaultLanguage attributes
AddTranslationAttributes(First = 0)
{
	AddAttribute("TranslationID", "FK", First, 1, 0, 0)
	
	AddAttribute("DefaultLanguageID", "FK", 0, 1, 0, 0)
}

;Add TimeCreate/UserCreate/TimeChange/UserChange attributes
AddTrackingAttributes(First = 0)
{
	AddAttribute("TimeCreate", "datetime", First, 1, 0, 0)
	
	AddAttribute("UserCreate", "FK", 0, 1, 0, 0)
	
	AddAttribute("TimeChange", "datetime", 0, 1, 0, 0)
	
	AddAttribute("UserChange", "FK", 0, 1, 0, 0)
}

^+8::
	TabToAttributes()
	
	AddTranslationAttributes(1)
	
	SaveTable()
Return

^+9::
	TabToAttributes()
	
	AddTrackingAttributes(1)
	
	SaveTable()
Return

^+0::
	TabToAttributes()
	
	AddTranslationAttributes(1)
	AddTrackingAttributes(0)
	
	SaveTable()
Return
	
;COMMENTED STUFF

;Disable .pdb file generation in Visual Studio, from the "Build" tab of a project's properties
; ^0::
	; SendInput {Tab 14}
	; Sleep 200
	; SendInput {Space}
	; Sleep 300
	; SendInput {Tab 4}
	; Sleep 200
	; Sendinput {Up 2}
	; Sleep 200
	; SendInput {Enter}
	; Sleep 300
	; SendInput ^s
	; Sleep 100
	; SendInput ^{F4}
; Return

; ;Copy lines between two vims (TEMPORARY)
; ^0::
	; Send nq!{TAB}
; Return

; ;Copy text from FileMaker (TEMPORARY)
; ^+0::
	; Send {TAB}^c!{TAB}
	; Sleep 200
	; Send nq
; Return

; #z::Run www.autohotkey.com

;^!n::
;IfWinExist Untitled - Notepad
;	WinActivate
;else
;	Run Notepad
;return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.
