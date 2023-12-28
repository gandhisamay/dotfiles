#! /bin/bash
# export DISPLAY=:0

error () {
    echo "$1" >&2
    echo "Exiting" >&2
    exit "$2"
}

debug(){
    [[ -n $DEBUG ]] && echo "$1"
}

# This function returns an awk script
# Which prints the battery percentage
# It's an ugly way to include a nicely indented awk script here
get_awk_source() {
    cat <<EOF
BEGIN {
    FS="=";
}
\$1 ~ /ENERGY_FULL$/ {
    f += \$2;
}
\$1 ~ /ENERGY_NOW\$/ {
    n += \$2;
}
\$1 ~ /CHARGE_FULL$/ {
    f += \$2;
}
\$1 ~ /CHARGE_NOW\$/ {
    n += \$2;
}
END {
    print int(100*n/f);
}
EOF
}


main (){
  BATTERIES=( /sys/class/power_supply/BAT*/uevent )
  NOTIFICATION_SHOWN=""
  DISCHARGING="Discharging,"
  CHARGING="Charging,"

  # while true;do
  IS_BATTERY_DISCHARGING=$(acpi | awk '{print $3}')
  BATTERY_PERCENTAGE=$(awk -f <(get_awk_source) "${BATTERIES[@]}")
  TIME_REMAINING=$(acpi | awk '{print $5}')

  if [[ "$IS_BATTERY_DISCHARGING" == "$DISCHARGING" ]]; then
    if [[ $BATTERY_PERCENTAGE -le 5 ]]; then
      sudo shutdown -h now
    fi
  fi
  # done
}

main
