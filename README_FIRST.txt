POST-IT REMINDER V3.5 - QUICK ACTIONS + MORE COLOURS PWA
===========================================================

WHAT CHANGED
------------
V3.5 keeps V3.4's durable saving, flexible repeats, queue, attention system and compact top tools. Upcoming reminders now use small Start, Delay and Skip icons, and the colour palette is expanded.
The compact top tools remain: New, voice, all Post-its, history, and settings are small
always-visible icons across the top beside the three-dot reminder menu.

When you are caught up and an upcoming Post-it is shown, DONE EARLY has been removed.
It now uses three small icon actions:
- Play: bring the Post-it forward now and start its timer.
- Pause/Delay: postpone the current occurrence without changing the underlying repeat cycle.
- Fast-forward/Skip: on a repeating Post-it, skip this occurrence and jump to its next scheduled occurrence without marking it complete.

The main due-note action remains LATER. It opens these choices:

- Back of queue
  Keeps the reminder due and keeps its real scheduled date unchanged, but moves it
  behind other due Post-its. Each use is recorded as a deferral.

- Delay choices
  10 minutes, 30 minutes, 1 hour, 3 hours, 1 day, 1 week, 2 weeks, 1 month, next
  workday, or a custom date and time. For an upcoming Post-it, relative delays are
  added to its current due time so a delay never accidentally brings it forward.

- Skip occurrence
  Available on repeating reminders. This does NOT mark the task complete. It records
  a skip and advances the recurrence to the next future occurrence.

PROGRESSIVE ATTENTION
---------------------
Due reminders now build an internal attention score based on:
- how long they have been overdue
- how many times they have been sent to the back of the queue

The visual indicator progresses from a subtle amber cue through stronger orange to a
red "Needs attention" cue. The app does not flash, shake, or make intrusive sounds.

Immediately after using Back of queue, that reminder receives a strong temporary queue
penalty so another due Post-it is shown first. As time passes, and especially if the
same reminder is deferred repeatedly, its attention score allows it to rise back toward
the front rather than staying buried indefinitely.

MORE COLOURS
------------
The Post-it palette now has 12 choices: Yellow, Peach, Green, Blue, Pink, Purple,
Cream, Coral, Mint, Sky, Sage, and Grey. The expanded palette is available when
creating, editing, or choosing the default Post-it colour.

YEAR-END REPORTING
------------------
Time and history now also records:
- back-of-queue deferrals
- skipped repeating occurrences
- deferrals before a task was eventually completed

The CSV, printable/PDF report, and downloaded HTML report include this queue activity.
This extends the existing completion time, planned time, category, snooze, and repeat
information.

DATA COMPATIBILITY
------------------
V3.5 intentionally uses the SAME storage namespace as V3.1/V3.2/V3.3/V3.4 on the same GitHub
Pages path. Existing reminders and completion history migrate automatically. New
fields default safely to zero/empty values, and old backups remain importable.

The app continues to mirror data in TWO browser storage systems:
1. IndexedDB (durable primary copy)
2. localStorage (compatibility / immediate mirror)

GITHUB PAGES DEPLOYMENT
-----------------------
Upload the CONTENTS of this folder over the existing GitHub Pages app:

  index.html
  manifest.webmanifest
  service-worker.js
  icons/

Keep the SAME public GitHub Pages URL. After deployment:
1. Open the public URL in Edge or Chrome.
2. Refresh once (Ctrl+F5 is useful after replacing an older build).
3. Confirm your existing reminders are present.
4. Create two reminders that are due now.
5. On the first one choose LATER > Back of queue. The second should come forward.
6. Reopen the first and confirm its Deferred indicator increased.
7. Test Skip occurrence on a repeating reminder and confirm its next date advances.
8. Close/reopen the installed PWA and confirm everything remains saved.

IMPORTANT BROWSER CASES
-----------------------
- InPrivate/Incognito storage is deliberately removed when the private session ends.
- A browser or organisation policy that clears site data on exit can still erase PWA
  storage. No web app can override an explicit data-clearing policy.
- Keep using the same GitHub Pages URL and Edge/Chrome profile.

LOCAL TESTING
-------------
Start PWA Test Server.bat is still included for localhost testing on Windows.
Localhost data is separate from your GitHub Pages data.

BACKUPS
-------
JSON backup/import remains available. Backups now include queue activity as well as
reminders, completion history, timer information, and settings.
