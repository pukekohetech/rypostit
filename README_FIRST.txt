POST-IT REMINDER V3.1 - PERSISTENT PWA
=====================================

WHAT CHANGED
------------
This build keeps the V3 interface but strengthens automatic saving.

The app now stores reminder state in TWO browser storage systems:
1. IndexedDB (durable primary copy)
2. localStorage (compatibility / immediate mirror)

On startup it checks both copies and automatically restores the usable/newer one.
It also asks the browser for persistent site storage when the HTTPS environment
supports it. No account or cloud database is required.

GITHUB PAGES DEPLOYMENT
-----------------------
Upload the CONTENTS of this folder to the same GitHub Pages site/repository path:

  index.html
  manifest.webmanifest
  service-worker.js
  icons/

Keep using the SAME public GitHub Pages URL. Browser/PWA data belongs to the
site origin, so changing to another domain/account/profile creates a separate
storage area.

After GitHub Pages finishes deploying:
1. Open the public GitHub Pages URL in Edge.
2. Refresh once (Ctrl+F5 is useful after replacing an older build).
3. Create a test Post-it.
4. Close the installed app completely.
5. Reopen it from Start. The Post-it should still be present.

If you previously used the old local HTML or localhost build, import a JSON
backup once. Those are different origins and cannot share browser storage.

IMPORTANT BROWSER CASES
-----------------------
- InPrivate/Incognito storage is deliberately removed when the private session ends.
- A browser policy/setting that explicitly clears site data on exit can still erase
  web-app storage. No PWA can override an explicit user/admin data-clearing policy.
- Use the same Edge/Chrome profile that installed the PWA.

LOCAL TESTING
-------------
You can still use Start PWA Test Server.bat on Windows for a localhost test.
Data saved on localhost is separate from data saved on your GitHub Pages URL.

BACKUPS
-------
The app still includes JSON backup/import. Automatic local persistence is the
normal save method; backups are for portability and extra safety.
