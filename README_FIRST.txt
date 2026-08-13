POST-IT REMINDER V3 - INSTALLABLE PWA
=====================================

This is the installable Progressive Web App (PWA) edition of Post-it Reminder V3.
The visible V3 interface and reminder features are preserved. The added files provide
installation metadata, app icons and offline app-shell caching.

QUICK WINDOWS / MICROSOFT EDGE TEST
-----------------------------------
1. Extract the ZIP and keep the whole folder together.
2. Double-click: Start PWA Test Server.bat
3. Edge opens: http://127.0.0.1:8765/
4. Wait a few seconds after the first load.
5. In Edge, click the App available / Install icon in the address bar.
   Alternatively: ... > Apps > Install Post-it Reminder
6. Click Install.

The installed PWA opens in its own app-style window and can be pinned to Windows Start
or the taskbar. Leave the local-server window open while you are actively testing new
versions of the files.

MOVING YOUR EXISTING V3 DATA
----------------------------
The original local .html file and this PWA use different browser storage origins, so
saved reminders do not automatically transfer between them.

Before switching:
1. Open the single-file V3 and Export backup.
2. Open/install this PWA.
3. Import that JSON backup into the PWA.

OFFLINE BEHAVIOUR
-----------------
After the service worker has installed and cached the app shell, the PWA can load its
interface without internet access. Reminder/history data remains local in browser app
storage, as in V3.

LONG-TERM / PRODUCTION INSTALL
------------------------------
For normal everyday use, publish this folder to an HTTPS static web host. The same PWA
can then be installed from that HTTPS address without running the local test server.

FILES
-----
index.html                 Main Post-it Reminder V3 app
manifest.webmanifest       PWA name, colours, icons and standalone display settings
service-worker.js          Offline app-shell cache
icons/                     App / Start-menu icons
Start PWA Test Server.bat  Double-click Windows test launcher
Start-PWA-Local.ps1        Dependency-free loopback web server used by the launcher
