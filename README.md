# OneNote Horizontal Scroll & Panning (Windows 11, AutoHotkey)

**Enhances OneNote navigation on Windows with horizontal scrolling and middle-click panning.**

This AutoHotkey script brings back two essential features that are missing in OneNote Desktop App for Windows but standard in other applications:

- **Shift + Scroll Wheel** for horizontal scrolling  
- **Middle Mouse Button drag** for smooth panning

The script only activates when OneNote is the active window. It’s lightweight, non-intrusive, and includes optional visual feedback (cursor and origin marker). Setup is quick, and you can optionally run it at startup.

## Features

- Horizontal scrolling with **Shift + Scroll Wheel**
- Click-and-drag navigation with the **Middle Mouse Button**
- **Visual feedback**: directional pan cursor and origin marker
- Only affects OneNote (won’t interfere with other apps)
- Written in **AutoHotkey v1**

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

Feedback, improvements, or advice on scripting in AHK are welcome!
