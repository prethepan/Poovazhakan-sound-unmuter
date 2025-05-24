; ToggleMuteWithVoice.ahk
; Press Ctrl + Alt + M to toggle system mute and get audio feedback
; Press Ctrl + Up Arrow to increase volume by 5%, even from 0

^+m::  ; Ctrl + Shift + M
SoundGet, isMuted, , mute
if (isMuted = 1) {
    SoundSet, 0, , mute  ; Unmute
    Run, powershell -c "Add-Type -AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak('Welcome back Poovazhakan')"
} else {
    SoundSet, 1, , mute  ; Mute
    SoundBeep, 750, 300  ; Alert tone (750 Hz for 300 ms)
}
return

^Up::  ; Ctrl + Up Arrow
SoundGet, currentVol  ; Get current volume level
if (currentVol < 5) {
    currentVol := 5  ; Start at 5% if volume is very low or 0
} else {
    currentVol += 5  ; Increase volume by 5%
    if (currentVol > 100)
        currentVol := 100  ; Cap at 100%
}
SoundSet, %currentVol%
return
