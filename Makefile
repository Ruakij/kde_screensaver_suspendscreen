KSMSERVER_NOTIFY_CONFIG_PATH=~/.config/ksmserver.notifyrc
SCRIPT_PATH=~/.local/bin/event_screensaver

.PHONY: install remove
default: install

install:
	# Deploy script
	cp -f ./event_screensaver ${SCRIPT_PATH}
	# Make executeable
	chmod +x ${SCRIPT_PATH}

	# Deploy notifyrc-file
	cp ./ksmserver.notifyrc ${KSMSERVER_NOTIFY_CONFIG_PATH}

	# Reload kwin..
	qdbus org.kde.KWin /KWin reconfigure

	# Installed!


remove:
	# Remove files..
	rm ${SCRIPT_PATH} ${KSMSERVER_NOTIFY_CONFIG_PATH}

	# Reload kwin..
	qdbus org.kde.KWin /KWin reconfigure

	# Removed!
