#!/bin/bash

# Passed by in nm-dispatch.
dev="$1"
cmd="$2"

# Only run when we're up.
if [ "$cmd" == "up" ]; then

    # Start telling us we're running.
    echo "Attempting to set system timezone using ll2tz..." > /tmp/ll2tz-setter.out

    # Make sure we're root.
    id="$(id -u)"
    if [ "$id" != "0" ]; then
	echo "Apparently I'm not running as root. aborting..." >> /tmp/ll2tz-setter.out
        exit 1
    fi

    # Use LL2TZ_HOME if set, else use default.
    if [ -z "$LL2TZ_HOME" ]; then
        LL2TZ_HOME=/usr/share/ll2tz
    fi

    # Tell us about where LL2TZ_HOME is.
    echo "LL2TZ_HOME is set to: $LL2TZ_HOME" >> /tmp/ll2tz-setter.out

    # Determine timezone using ll2tz.
    LL2TZ_ZONE="/usr/share/zoneinfo/$($LL2TZ_HOME/ll2tz.sh 2>/dev/null)"

    # Tell us about detected zone.
    echo "LL2TZ_ZONE is set to: $LL2TZ_ZONE" >> /tmp/ll2tz-setter.out

    if [ -f "$LL2TZ_ZONE" ]; then
        echo "LL2TZ_ZONE exists, linking to /etc/localtime..." >> /tmp/ll2tz-setter.out
        ln -sf "$LL2TZ_ZONE" "/etc/localtime"
    else
        echo "Zone file does not exist, leaving /etc/localtime as-is..." >> /tmp/ll2tz-setter.out
        exit 1
    fi
fi
