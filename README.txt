********************************************************************************
iTunesHotKey README
********************************************************************************

********************************************************************************
This is a simple little utility that registers some global hot keys to control
iTunes on Windows.  While running, this app shows up in the System Tray and
listens for the MediaPlay, MediaNextTrack, MediaPrevTrack keys.  Those keypresses
are forwarded to iTunes, allowing you to play/pause and skip tracks in iTunes
without iTunes having focus.

iTunesHotKey is written with Delphi 2009.

********************************************************************************
INSTALLATION
********************************************************************************
There's no installer yet, so if you want to use the app it's a manual process.

1.  Copy the iTunesHotKey.exe file to a logical location.
    Perhaps "C:\Program Files(x86)\"
2.  Make a shortcut to the iTunesHotKey.exe location.
3.  Place the shortcut in the Windows startup folder.
    Perhaps "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
4.  To start, either restart your machine, or just double-click the exe to kick
    it off.

********************************************************************************
OPERATION
********************************************************************************
Once iTunesHotKey.exe is running, just press your media keys on your keyboard.
Play/Pause, Skip Next, Skip Prev are supported.

If you click on the iTunesHotKey icon in the System Tray you can bring up a
simple form with the basic control buttons.

Right-click on the tray icon to quit if you want to stop
the app from listening for hot keys.
