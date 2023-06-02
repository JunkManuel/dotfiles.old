#!/bin/sh

battery_print() {
    PATH_POWER="/sys/class/power_supply"
    #PATH_AC="/sys/class/power_supply/ADP1"
    [[ -d "$PATH_POWER/AC" ]] && PATH_AC="$PATH_POWER/AC"
    [[ -d "$PATH_POWER/ADP1" ]] && PATH_AC="$PATH_POWER/ADP1"
    PATH_BATTERY_0="/sys/class/power_supply/BAT0"
    PATH_BATTERY_1="/sys/class/power_supply/BAT1"

    ac=0
    battery_level_0=0
    battery_level_1=0
    battery_max_0=0
    battery_max_1=0

    if [ -f "$PATH_AC/online" ]; then
        ac=$(cat "$PATH_AC/online")
    fi

    if [ -f "$PATH_BATTERY_0/energy_now" ]; then
        battery_level_0=$(cat "$PATH_BATTERY_0/energy_now")
    fi

    if [ -f "$PATH_BATTERY_0/energy_full" ]; then
        battery_max_0=$(cat "$PATH_BATTERY_0/energy_full")
    fi

    if [ -f "$PATH_BATTERY_1/energy_now" ]; then
        battery_level_1=$(cat "$PATH_BATTERY_1/energy_now")
    fi

    if [ -f "$PATH_BATTERY_1/energy_full" ]; then
        battery_max_1=$(cat "$PATH_BATTERY_1/energy_full")
    fi

    

    if [ "$ac" -eq 1 ] || [ "$PATH_AC" = "" ]; then
        icon="󰂄"
        echo "$icon"
    else
        battery_level=$(("$battery_level_0 + $battery_level_1"))
        battery_max=$(("$battery_max_0 + $battery_max_1"))

        battery_percent=$(("$battery_level * 100"))
        battery_percent=$(("$battery_percent / $battery_max"))
        if [ "$battery_percent" -gt 85 ]; then
            icon=""
        elif [ "$battery_percent" -gt 60 ]; then
            icon=""
        elif [ "$battery_percent" -gt 35 ]; then
            icon=""
        elif [ "$battery_percent" -gt 10 ]; then
            icon=""
        else
            icon=""
        fi

        echo "$icon $battery_percent "
    fi
}

path_pid="/tmp/polybar-battery-combined-udev.pid"

case "$1" in
    --update)
        pid=$(cat $path_pid)

        if [ "$pid" != "" ]; then
            kill -10 "$pid"
        fi
        ;;
    *)
        echo $$ > $path_pid

        trap exit INT
        trap "echo" USR1

        while true; do
            battery_print

            sleep 10 &
            wait
        done
        ;;
esac
