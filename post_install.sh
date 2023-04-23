#!/bin/sh
sysrc "spindown_timer_enable=YES"
service spindown_timer start
