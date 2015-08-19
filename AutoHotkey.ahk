;**************************   HOTSTRINGS   *****************************

;-----------------------------------------------------------------------


;****************************   HOTKEYS   ******************************

#v::Run "C:\Program Files (x86)\vim\vim74\gvim.exe"

;Change reddit's gifv links extension from jpg
^+g::
	Send ^l
	Send {End}
	Send {BS}{BS}{BS}{BS}{BS} ;Delete the "h.jpg" part
	SendInput .gifv{Enter}
Return
	
;###########################  Volume keys
^!PgUp::
	Send {Volume_Up}
Return

^!PgDn::
	Send {Volume_Down}
Return

^!Down::
	Send {Media_Play_Pause}
Return

^!Left::
	Send {Media_Prev}
Return

^!Right::
	Send {Media_Next}
Return

^!Up::
	Send {Media_Stop}
Return