POST-IT REMINDER V3.6 - UPCOMING ACTIONS BOARD PWA
=====================================================

MAIN CHANGE
-----------
When you are not actively working on a Post-it, the main Post-it now becomes an Upcoming Actions board. Due and overdue actions appear first, followed by the next scheduled actions.

Each list row has three small controls:
- Play: start or resume the item. This switches to the focused single-item view and starts its timer.
- Pause/Delay: open the existing delay choices. Due items can also be sent to the back of the queue.
- Fast-forward/Skip: for repeating items, skip this occurrence to the next scheduled repeat without marking it complete.

The board shows up to eight actions and scrolls within the Post-it. The All Post-its button opens the full management list. Clicking an action title opens Edit.

FOCUSED WORK
------------
While a timer is actively running, the interface switches back to the single focused Post-it with LATER, DONE, timer, attention, and edit controls. Pausing the timer returns to the Upcoming Actions board.

Tracked time is protected when switching work. If you pause one action and start another, the elapsed time from the first action is banked on that reminder. Returning to it with Play continues the total tracked time instead of discarding it. Delaying a currently worked item pauses its timer before returning to the board.

RETAINED FROM V3.5
------------------
- Durable IndexedDB + localStorage saving on the same GitHub Pages URL
- PWA install/offline shell
- Flexible repeat intervals: daily, weekdays, weeks, months, years, and custom multiples
- Back-of-queue deferrals and progressive attention
- Snooze/delay choices including minutes, hours, days, weeks, month, next workday, and custom date/time
- Skip repeating occurrence without marking it complete
- 12 Post-it colours
- Voice capture
- Dragging and remembered position
- Backup/import and recovery snapshots
- Yearly CSV, printable/PDF, and HTML reports
- Compact top tool icons

GITHUB PAGES UPDATE
-------------------
Replace the existing site files with the contents of this folder. The storage namespace is unchanged, so existing reminders should remain. After GitHub Pages deploys, use Ctrl+F5 once to make sure the V3.6 service worker is active.

The app must stay on the same GitHub Pages URL/browser profile for the browser's saved data to remain in the same site storage. Export Backup is still recommended before major updates.
