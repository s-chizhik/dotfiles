#!/bin/bash

HEART_FULL="●"
HEART_MIDDLE="◒"
HEART_EMPTY="○"

CHARGING="⚡"
CRITICAL="⚠"

BAT0=$CRITICAL
BAT1="▁"
BAT2="▂"
BAT3="▃"
BAT4="▄"
BAT5="▅"
BAT6="▆"
BAT7="▇"
BAT8="█"
BAT9="✔"


SEG_L_F=""
SEG_L_L=""
SEG_R_F=""
SEG_R_L=""

__get_battery () {
	echo $(cat /sys/class/power_supply/BAT1/capacity);
}

__get_battery_status () {
	echo $(cat /sys/class/power_supply/BAT1/status);
}

__get_time () {
	echo $(date +"%H:%M:%S")
}

__get_date () {
	echo $(date +"%a %d-%b")
}

__get_username () {
	echo $(whoami);
}

__get_tmp () {
	sudo du /tmp -h --summarize	# nobody cares
}

#[fg=red]#[bg=red]#[fg=black] ###S #[bg=yellow]#[fg=blue]#[bg=blue]#[fg=black] %R  %m-%d-%Y #[fg=yellow]#[bg=green]#[fg=black] ♥ #(cat /sys/class/power_supply/BAT1/capacity)% #[default]'
#set-option -g status-left '#[

BATTERY_LEVEL=$(__get_battery)
BATTERY_STATUS=$(__get_battery_status)

if [[ $BATTERY_LEVEL -eq 100 ]]; then
	BAT_COLOR=green;
	BAT_STATUS=$BAT9;
fi
if [[ $BATTERY_LEVEL -lt 100 ]]; then
	BAT_STATUS=$BAT8;
	BAT_COLOR=green;
fi
if [[ $BATTERY_LEVEL -le 90 ]]; then
	BAT_STATUS=$BAT8;
	BAT_COLOR=green;
fi
if [[ $BATTERY_LEVEL -le 80 ]]; then
	BAT_STATUS=$BAT7;
	BAT_COLOR=green;
fi
if [[ $BATTERY_LEVEL -le 70 ]]; then
	BAT_STATUS=$BAT6;
	BAT_COLOR=yellow;
fi
if [[ $BATTERY_LEVEL -le 60 ]]; then
	BAT_STATUS=$BAT5;
	BAT_COLOR=yellow;
fi
if [[ $BATTERY_LEVEL -le 50 ]]; then
	BAT_STATUS=$BAT4;
	BAT_COLOR=yellow;
fi
if [[ $BATTERY_LEVEL -le 40 ]]; then
	BAT_STATUS=$BAT3;
	BAT_COLOR=yellow;
fi
if [[ $BATTERY_LEVEL -le 30 ]]; then
	BAT_STATUS=$BAT2;
	BAT_COLOR=red;
fi
if [[ $BATTERY_LEVEL -le 20 ]]; then
	BAT_STATUS=$BAT1;
	BAT_COLOR=red;
fi
if [[ $BATTERY_LEVEL -le 10 ]]; then
	BAT_STATUS=$BAT0;
	BAT_COLOR=red;
fi

#if [[ $BATTERY_STATUS -eq Full ]]; then # Full, Discharging, Unknown, Charging
#	BAT_ICON=
#fi
	BAT_ICON=""

if [[ "$BATTERY_STATUS" == "Charging" ]]; then
	BAT_ICON="$CHARGING "
fi

echo \
	"#[bg=white,fg=cyan]"$SEG_L_F"#[fg=black,bg=cyan]" $(__get_tmp) \
	"#[fg=$BAT_COLOR]"$SEG_L_F"#[bg=$BAT_COLOR,fg=black]" $BAT_ICON$BAT_STATUS $BATTERY_LEVEL% \
 	"#[fg=blue]"$SEG_L_F"#[bg=blue,fg=black]" $(__get_date) $SEG_L_L $(__get_time) \
