#!/bin/sh
set -e

# Clone truenas-spindown-timer
SPINDOWN_TIMER_VERSION=2.2.0
git clone https://github.com/ngandrass/truenas-spindown-timer.git /opt/truenas-spindown-timer
git -C /opt/truenas-spindown-timer checkout tags/v${SPINDOWN_TIMER_VERSION}

# Setup service
chmod u+x /usr/local/etc/rc.d/spindown_timer
sysrc "spindown_timer_enable=YES"
service spindown_timer start
