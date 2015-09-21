#!/bin/bash

HEART_FULL="●"
HEART_MIDDLE="◒"
HEART_EMPTY="○"

CHARGING="⚡"

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
	echo $(date +"%H:%M")
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

if [[ $BATTERY_LEVEL -le 100 ]]; then
	BAT_STATUS=$HEART_FULL;
	BAT_COLOR=green;
fi
if [[ $BATTERY_LEVEL -le 66 ]]; then
	BAT_STATUS=$HEART_MIDDLE;
	BAT_COLOR=yellow;
fi
if [[ $BATTERY_LEVEL -le 33 ]]; then
	BAT_STATUS=$HEART_EMPTY;
	BAT_COLOR=red;
fi

if [[ $BATTERY_STATUS -eq Full ]]; then # Full, Discharging, Unknown, Charging
	BAT_ICON=
fi

if [[ $BATTERY_STATUS -eq Charging ]]; then
	BAT_ICON="$CHARGING "
fi

echo \
	"#[bg=white,fg=yellow]"$SEG_L_F"#[fg=black,bg=yellow]" $(__get_tmp) \
	"#[fg=$BAT_COLOR]"$SEG_L_F"#[bg=$BAT_COLOR,fg=black]" $BAT_ICON$BAT_STATUS $BATTERY_LEVEL% \
 	"#[fg=blue]"$SEG_L_F"#[bg=blue,fg=black]" $(__get_date) $SEG_L_L $(__get_time) \
