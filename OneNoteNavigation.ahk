#SingleInstance Force
#IfWinActive ahk_exe onenote.exe

+WheelUp::Send {WheelLeft}
+WheelDown::Send {WheelRight}

~MButton::
    CoordMode, Mouse, Screen
    MouseGetPos, startX, startY

    ; Calculate position to center the cross at mouse position
    crossSize := 20  ; Total size of the cross
    crossX := startX - (crossSize // 2)
    crossY := startY - (crossSize // 2)
    lineThickness := 4

    ; Create a simple white cross marker
    Gui, Marker:New, +AlwaysOnTop +ToolWindow -Caption +LastFound
    Gui, Marker:Color, 000000  ; Black background
    WinSet, TransColor, 000000  ; Make background transparent

    ; Calculate the center position for the lines
    halfSize := crossSize // 2
    halfThick := lineThickness // 2
    vertX := halfSize - halfThick
    horzY := halfSize - halfThick

    ; Horizontal line (white)
    Gui, Marker:Add, Progress, x0 y%horzY% w%crossSize% h%lineThickness% cWhite BackgroundWhite, 100

    ; Vertical line (white)
    Gui, Marker:Add, Progress, x%vertX% y0 w%lineThickness% h%crossSize% cWhite BackgroundWhite, 100

    ; Show marker at mouse position
    Gui, Marker:Show, x%crossX% y%crossY% w%crossSize% h%crossSize% NoActivate, CrossMarker

    SetTimer, SimulateScroll, 50  ; Slower interval
return

~MButton Up::
    StopScroll()
return

StopScroll() {
    SetTimer, SimulateScroll, Off
    Gui, Marker:Destroy
    ; Restore system cursor
    DllCall("SystemParametersInfo", "UInt", 0x57, "UInt", 0, "Ptr", 0, "UInt", 0x1)
}

SimulateScroll:
    if (!GetKeyState("MButton", "P")) {
        StopScroll()
        return
    }

    CoordMode, Mouse, Screen
    MouseGetPos, currentX, currentY
    deltaX := currentX - startX
    deltaY := currentY - startY

    scrollStep := 10  ; lowered threshold for earlier scroll

    ; Update cursor based on direction
    if (Abs(deltaX) > Abs(deltaY)) {
        if (deltaX > scrollStep)
            SetPanCursor("right")
        else if (deltaX < -scrollStep)
            SetPanCursor("left")
    } else {
        if (deltaY > scrollStep)
            SetPanCursor("down")
        else if (deltaY < -scrollStep)
            SetPanCursor("up")
    }

    ; Calculate scroll magnitude based on distance from origin
    xDistance := Abs(deltaX)
    yDistance := Abs(deltaY)

    if (xDistance >= scrollStep) {
        xScrollAmount := 0
        if (xDistance < 250)
            xScrollAmount := 1
        else if (xDistance >= 250)
            xScrollAmount := 2
        else if (xDistance >= 500)
            xScrollAmount := 3
        else if (xDistance >= 750)
            xScrollAmount := 4
        else if (xDistance >= 1000)
            xScrollAmount := 5

        Loop, %xScrollAmount% {
            if (deltaX > 0)
                Send {WheelRight}
            else
                Send {WheelLeft}
        }
    }

    if (yDistance >= scrollStep) {
        yScrollAmount := 0
        if (yDistance < 250)
            yScrollAmount := 1
        else if (yDistance >= 250)
            yScrollAmount := 2
        else if (yDistance >= 500)
            yScrollAmount := 3
        else if (yDistance >= 750)
            yScrollAmount := 4
        else if (yDistance >= 1000)
            yScrollAmount := 5

        Loop, %yScrollAmount% {
            if (deltaY > 0)
                Send {WheelDown}
            else
                Send {WheelUp}
        }
    }
return

SetPanCursor(direction) {
    static cursors := { "up":32516, "down":32517, "left":32644, "right":32645 }
    hCursor := DllCall("LoadCursor", "Ptr", 0, "UInt", cursors[direction], "Ptr")
    DllCall("SetSystemCursor", "Ptr", hCursor, "UInt", 32512)
}

#If
