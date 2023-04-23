#!/bin/sh
set -e

# Clone truenas-spindown-timer
SPINDOWN_TIMER_VERSION=2.2.0
SPINDOWN_TIMER_DIR=/opt/truenas-spindown-timer

git config --global advice.detachedHead false
git config --global user.email "root@localhost"
git config --global user.name "root"

git clone https://github.com/ngandrass/truenas-spindown-timer.git "$SPINDOWN_TIMER_DIR"
git -C "$SPINDOWN_TIMER_DIR" checkout tags/v${SPINDOWN_TIMER_VERSION}
find /opt/truernas-spindown-timer-patches -name "*.patch" -exec git -C "$SPINDOWN_TIMER_DIR" apply {} \;

# Setup service
chmod u+x /usr/local/etc/rc.d/spindown_timer
sysrc "spindown_timer_enable=YES"
service spindown_timer start
