#!/bin/sh

set -e

PATCHRAM_ARGS="--patchram /vendor/firmware/BCM4345C0.hcd \
               --enable_lpm \
               --no2bytes \
               --enable_hci \
               --baudrate 3000000"

chmod 0660 /sys/class/rfkill/rfkill0/state
chmod 0660 /sys/class/rfkill/rfkill0/type
chgrp dialout /sys/class/rfkill/rfkill0/state
chgrp dialout /sys/class/rfkill/rfkill0/type
rfkill unblock bluetooth

/usr/bin/brcm_patchram_plus $PATCHRAM_ARGS /dev/ttyHS0 &
