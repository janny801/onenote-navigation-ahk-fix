# OneNote Horizontal Scroll & Panning (Windows 11, AutoHotkey)

**Enhances OneNote navigation on Windows with horizontal scrolling and middle-click panning.**

> ⚠️ This script is designed for the **OneNote Desktop App** (Microsoft Store version) on **Windows 11**.

This AutoHotkey script brings back two essential features...

- **Shift + Scroll Wheel** for horizontal scrolling  
- **Middle Mouse Button drag** for smooth panning

The script only activates when OneNote is the active window. It’s lightweight, non-intrusive, and includes optional visual feedback (cursor and origin marker). Setup is quick, and you can optionally run it at startup.

## Features

- Horizontal scrolling with **Shift + Scroll Wheel**
- **Middle-click panning** using the **Middle Mouse Button**
- Optional **visual feedback**: pan cursor and origin marker
- Only affects **OneNote** (does not interfere with other apps)
- Written in **AutoHotkey v1**

<div align="center">
  <h3><u><code>Features Demo</code></u></h3>
</div>

<div align="center">
  <h3><u><strong>Shift + Scroll</strong> moves the page left and right</u></h3>
  <img src="images/shiftscroll_demo.gif" alt="Shift Scroll Demo">
</div>

<div align="center">
  <p><strong>How it works:</strong></p>
</div>
<ul>
  <li>Hold <strong>Shift</strong></li>
  <li>Scroll using the <strong>mouse wheel</strong></li>
  <li>The page moves <strong>horizontally</strong> (left or right)</li>
  <li>Helps navigate wide layouts, tables, or images in OneNote</li>
</ul>

<div align="center">
  <p><strong>Adjustability</strong></p>
</div>

<ul>
  <li>By default, Shift + Scroll sends a single horizontal scroll event</li>
  <li>You can increase how far the page scrolls by modifying the number of scroll steps sent</li>
  <li>Replace this section in the script:</li>
</ul>

```ahk
+WheelUp::Send {WheelLeft}
+WheelDown::Send {WheelRight}
```
<ul> <li>With this adjustable version:</li> </ul>

```ahk
+WheelUp::
    Loop 3 ; Increase or decrease this number to control scroll speed (left)
        Send {WheelLeft}
return

+WheelDown::
    Loop 3 ; Increase or decrease this number to control scroll speed (right)
        Send {WheelRight}
return
```

<ul>
  <li><code>Loop 3</code> means it scrolls 3 steps per scroll tick</li>
  <li>To scroll faster: increase the number</li>
  <li>To scroll slower: decrease the number (minimum is 1)</li>
  <li>This makes it easier to navigate wide pages, images, or tables</li>
</ul>

<br>

<div align="center">
  <h3><u><strong>Middle mouse button</strong> lets you click and drag to move around</u></h3>
  <img src="images/crosshair_demo.gif" alt="Panning Demo">
</div>

<div align="center">
  <p><strong>How it works:</strong></p>
</div>
<ul>
  <li>Press and hold the <strong>middle mouse button</strong></li>
  <li>A small cross appears at the click point (this is the origin)</li>
  <li>Move the mouse in any direction to <strong>pan the canvas</strong></li>
  <li>The mouse cursor updates to show <strong>scroll direction</strong></li>
  <li>Release the middle button to stop panning</li>
</ul>

<div align="center">
  <p><strong>Adjustability</strong></p>
</div>
<ul>
  <li>Scroll speed increases the farther you move the mouse from the original click point</li>
  <li>You can customize this by editing the scroll thresholds in the script:</li>
</ul>

```ahk
; Horizontal (X axis)
if (xDistance < 250)
    xScrollAmount := 1
else if (xDistance < 500)
    xScrollAmount := 2
else if (xDistance < 750)
    xScrollAmount := 3
else if (xDistance < 1000)
    xScrollAmount := 4
else
    xScrollAmount := 5

; Vertical (Y axis)
if (yDistance < 250)
    yScrollAmount := 1
else if (yDistance < 500)
    yScrollAmount := 2
else if (yDistance < 750)
    yScrollAmount := 3
else if (yDistance < 1000)
    yScrollAmount := 4
else
    yScrollAmount := 5
```

<ul>
  <li>These thresholds (<code>xScrollAmount</code> / <code>yScrollAmount</code>) determine how many scroll steps are sent based on how far the mouse moves from the original click point (the location where you first pressed the middle mouse button)</li>
  <li>The farther you move the cursor from that origin point, the faster the page scrolls</li>
  <li>You can customize these thresholds to control how scroll speed scales with distance</li>
  <li>The <code>xScrollAmount</code> / <code>yScrollAmount</code> values define how much the page scrolls depending on how far the cursor moves from the original click point</li>
</ul>

## Getting Started

### 1. Install AutoHotkey

Go to: [https://www.autohotkey.com/](https://www.autohotkey.com/)  
Download and install **AutoHotkey v1**

### 2. Create the Script

- Open Notepad or any text editor
- Paste the script (see below)
- Save the file with a `.ahk` extension, e.g., `onenote_scroll.ahk`

### 3. Run the Script

- Right-click the `.ahk` file
- Select **Show more options**
- Click **Run Script**

You should see a green AutoHotkey icon in the system tray (see image below)

![AutoHotkey script running in system tray on Windows 11](images/trayDisplayW11.png)

*This tray icon confirms the script is active.*

Now:
- Shift + Scroll = horizontal scrolling
- Middle click and drag = panning mode

## Auto-run on Windows Startup (optional)

You have two options:

### Option 1: Add to Startup Folder

1. Press `Win + R`, type `shell:startup`, hit Enter  
2. Copy your `.ahk` file into this folder

### Option 2: Compile to EXE and Add to Startup

1. Right-click the `.ahk` file → Compile Script (creates `.exe`)
2. Move the `.exe` into `shell:startup`

I'm new to AutoHotkey and made this script quickly because I was used to the macOS OneNote app, which allows horizontal scrolling and panning by default. For some reason these features are missing on the Windows 11 OneNote Desktop App. 

## Troubleshooting

- **Script doesn't run**: Ensure AutoHotkey v1 is installed (v2 syntax is different).
- **Nothing happens in OneNote**: Make sure OneNote is the active window.
- **No tray icon**: Check if AHK is blocked by antivirus or group policies.

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.  
2. Create a new branch:  
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Make your changes and commit with clear messages:  
   ```bash
   git commit -m "Add feature X"
   ```
4. Push your branch to GitHub:  
   ```bash
   git push origin feature/your-feature-name
   ```
5. Open a Pull Request describing your changes. 

## License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or feedback, reach out via email:
- **Email**: jred8069@gmail.com

