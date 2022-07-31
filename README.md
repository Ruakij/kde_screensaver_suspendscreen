KDE X11 ScreenSaver SuspendScreen
===

KDE X11 event-script to have different screen-timeouts when session is locked vs unlocked

<br>

Table of contents
===
<!-- TOC -->
- [1. The Problem](#1-the-problem)
- [2. The Fix](#2-the-fix)
- [3. How to install/remove](#3-how-to-installremove)
    - [3.1. Automatically](#31-automatically)
    - [3.2. Manually](#32-manually)
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

When the screen is locked, the script will change the screen-timeout to a custom-value in the config `~/.config/powermanagementprofilesrc` (or a default of 10s).

This is done, so even after the System wakes up and activates the screens e.g. when mouse is moved, but no unlock is done, the screen begins to sleep quickly again.

After a successful unlock, the value from the config is reapplied.

<br>

# 3. How to install/remove

## 3.1. Automatically

### 3.1.1. Install

Run the Makefile with `install`.

```sh
make install
```

### 3.1.2. Remove

Run the Makefile with `remove`.

```sh
make remove
```

<br>

## 3.2. Manually

### 3.2.1. Install

Place the file `event_screensaver` to a bin-location, for a local user this is typically `~/.local/bin/` and make it executeable.

In Settings under `Notifications > Applications > Configure > 'Screen Saver' > Configure Events...` for event locked & unlocked, enable `Run command` and add your script-location for `event_screensaver` and the event triggered.

Example:
```
Screen locked
Run Command: ~/.local/bin/event_screenSaver locked
```

Or update/create the config-file directly under `~/.config/ksmserver.notifyrc` similary to the file found in this repository.
Then restart or reload KWin.
