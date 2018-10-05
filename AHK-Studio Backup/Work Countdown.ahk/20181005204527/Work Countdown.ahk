;MsgBox % FormatSeconds(305)  ; 7384 = 2 hours + 3 minutes + 4 seconds. It yields: 2:03:04
WinHide, To Do List

Gui, Add, Text, x10 y3 w70 h20 , Geri Sayım:
Gui, Add, DateTime, x10 y25 wp hp vStartTime 1, HH:mm:ss ;time


Gui, Add, Button, x10 y55 w70 h20 Default, &TAMAM
Gui, Show, w90 h90, AHK-Scheduler
Return


ButtonTAMAM:
Gui, submit, nohide

FormatTime, StartTime, %StartTime%, HH:mm:ss



aTime := StrSplit(StartTime, ":")
seconds := aTime.1 * 3600 + aTime.2 * 60 + aTime.3




global i
i := seconds
;InputBox, i, Geri Sayım, Kaç Saniye, , 90, 130

Gui, 1:Destroy

while(i > 0)
{
	Sleep, 1000
	a := FormatSeconds(i)
	ToolTip, %a%, 25, 5, 1
	i -= 1
}


FormatSeconds(NumberOfSeconds)  ; Convert the specified number of seconds to hh:mm:ss format.
{
	time = 19990101  ; *Midnight* of an arbitrary date.
	time += %NumberOfSeconds%, seconds
	FormatTime, mmss, %time%, mm:ss
	return NumberOfSeconds//3600 ":" mmss
	/*
    ; Unlike the method used above, this would not support more than 24 hours worth of seconds:
		FormatTime, hmmss, %time%, h:mm:ss
		return hmmss
	*/
}

return

#Esc::
ButtonCancel/Exit:
GuiClose:
ExitApp