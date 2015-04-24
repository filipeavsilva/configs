;**************************   HOTSTRINGS   *****************************

;-----------------------------------------------------------------------


;****************************   HOTKEYS   ******************************

;Shortcut to open the TODOs file
^+?::
	Run "C:\Program Files (x86)\vim\vim74\gvim.exe" --servername TODO --remote-silent C:\Users\fsilv_000\Dropbox\Coolblue\todos.taskpaper
Return

#v::Run "C:\Program Files (x86)\vim\vim74\gvim.exe"

;Change reddit's gifv links extension from jpg
^+g::
	Send ^l
	Send {End}
	Send {BS}{BS}{BS}{BS}{BS} ;Delete the "h.jpg" part
	SendInput .gifv{Enter}
Return
	