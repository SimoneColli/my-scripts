charge_file_path=/sys/class/power_supply/BAT0/capacity
current_charge=$(cat "$charge_file_path")

notify-send "Computer collegato alla corrente" "Batteria attuale $current_charge"
