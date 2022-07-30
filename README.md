KDE X11 ScreenSaver SuspendScreen
===

KDE X11 event-script to have different screen-timeouts when session is locked vs unlocked

<br>

Table of contents
===
<!-- TOC -->
- [1. The Problem](#1-the-problem)
- [2. The Fix](#2-the-fix)
- [3. How to install](#3-how-to-install)
<!-- /TOC -->
<br>

# 1. The Problem

By default KDE will lock the screen after the time specified in `Workspace > Workspace Behaviour > Screen Locking > Lock screen automatically > After x minutes`.

And the screen is turned off after the time specified in `Hardware > Power Management > Energy Saving > Screen Energy Saving > Switch off after x min`.

Unfortunately when the screen is locked, even when done manually using the Shortcut (by default `CMD/WIN+L`), the screen-timeout is still `x min` which i think is unnecessary (e.g. i went for lunch and lock my screen, knowing i wont be back soon).

<br>

This script aims to fix this.

<br>

# 2. The Fix

Adding a script to `notifyrc` as event makes it possible to change settings when screen-locking begins.

So after x seconds the screen will simply be forcefully turned off using `xset`.

<br>

# 3. How to install

Place the file `event_screensaver` to a bin-location, for a local user this is typically `~/.local/bin/` and make it executeable.

In Settings under `Notifications > Applications > Configure > 'Screen Saver' > Configure Events...` for event `Screen locked`, enable `Run command` and add your script-location for `event_screensaver`.
