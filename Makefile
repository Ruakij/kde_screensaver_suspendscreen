KSMSERVER_NOTIFY_CONFIG_PATH=~/.config/ksmserver.notifyrc
SCRIPT_PATH=~/.local/bin/event_screensaver

.PHONY: install remove
default: install

install:
	# Deploy script
	cp -f ./event_screensaver ${DESTDIR}${SCRIPT_PATH}
	# Make executeable
	chmod +x ${DESTDIR}${SCRIPT_PATH}

	# Deploy notifyrc-file
	cp ./ksmserver.notifyrc ${DESTDIR}${KSMSERVER_NOTIFY_CONFIG_PATH}

	# Reload kwin..
	qdbus org.kde.KWin /KWin reconfigure

	# Installed!


remove:
	# Remove files..
	rm ${DESTDIR}${SCRIPT_PATH} ${DESTDIR}${KSMSERVER_NOTIFY_CONFIG_PATH}

	# Reload kwin..
	qdbus org.kde.KWin /KWin reconfigure

	# Removed!
