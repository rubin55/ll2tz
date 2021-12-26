#!/bin/bash

# Passed by in nm-dispatch.
dev="$1"
cmd="$2"

# Only run when we're up.
if [ "$cmd" == "up" ]; then

    # Start telling us we're running.
    echo "Attempting to set system timezone using c2t..." > /tmp/c2t.out

    # Make sure we're root.
    id="$(id -u)"
    if [ "$id" != "0" ]; then
	echo "Apparently I'm not running as root. aborting..." >> /tmp/c2t.out
        exit 1
    fi

    # Use C2T_HOME if set, else use default.
    if [ -z "$C2T_HOME" ]; then
        C2T_HOME=/usr/share/c2t
    fi

    # Tell us about where C2T_HOME is.
    echo "C2T_HOME is set to: $C2T_HOME" >> /tmp/c2t.out

    # Determine timezone using c2t.
    C2T_ZONE="/usr/share/zoneinfo/$($C2T_HOME/c2t.sh 2>/dev/null)"

    # Tell us about detected zone.
    echo "C2T_ZONE is set to: $C2T_ZONE" >> /tmp/c2t.out

    if [ -f "$C2T_ZONE" ]; then
        echo "C2T_ZONE exists, linking to /etc/localtime..." >> /tmp/c2t.out
        ln -sf "$ZONEINFO" "/etc/localtime"
    else
        echo "Zone file does not exist, leaving /etc/localtime as-is..." >> /tmp/c2t.out
        exit 1
    fi
fi
