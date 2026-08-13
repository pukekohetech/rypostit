POST-IT REMINDER V3.2 - FLEXIBLE REPEAT PWA
=========================================

WHAT CHANGED
------------
This build keeps the V3.1 durable automatic saving and adds flexible repeat cycles.

Repeat choices now include:
- One time
- Daily
- Weekdays
- Weekly
- Monthly
- Yearly
- Custom interval

Custom interval supports every 1-99 days, weeks, months, or years. Examples:
- Every 2 weeks
- Every 6 weeks
- Every 3 months
- Every 6 months
- Every 2 years

For monthly schedules, the app remembers the intended day of the month. A reminder
based on the 31st uses the last available day in shorter months, then returns to the
31st when possible. Yearly schedules similarly preserve the intended month and day,
including leap-day schedules.

DATA COMPATIBILITY
------------------
V3.2 uses the same durable storage namespace as V3.1, so reminders already saved on
the same GitHub Pages URL and browser profile are migrated automatically. Existing
daily, weekday, weekly, and monthly reminders continue with an interval of 1.

The app stores reminder state in TWO browser storage systems:
1. IndexedDB (durable primary copy)
2. localStorage (compatibility / immediate mirror)

GITHUB PAGES DEPLOYMENT
-----------------------
Upload the CONTENTS of this folder to the same GitHub Pages site/repository path:

  index.html
  manifest.webmanifest
  service-worker.js
  icons/

Keep using the SAME public GitHub Pages URL. After GitHub Pages finishes deploying:
1. Open the public GitHub Pages URL in Edge.
2. Refresh once. Ctrl+F5 is useful after replacing an older build.
3. Check an existing reminder is still present.
4. Create a custom repeat reminder, for example every 2 weeks.
5. Close and reopen the installed app to confirm it remains saved.

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
The app still includes JSON backup/import. Automatic local persistence is the normal
save method; backups are for portability and extra safety.
