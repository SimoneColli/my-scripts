max_charge=95
charge_file_path=/sys/class/power_supply/BAT0/capacity

# controllare se la carica contenuta nel file segnato da cahre_file_path
# e' >= max_charge, se e' cosi' eseguire sudo systemctl start tlp e
# sudo tlp ac


notify-send "Computer collegato alla corrente" "Notifica proveniente dallo script ac_connected.sh"

# Leggi il valore della carica dalla batteria
current_charge=$(cat "$charge_file_path")

# Controlla se la carica è maggiore o uguale a max_charge
if [ "$current_charge" -ge "$max_charge" ]; then
    # Avvia il servizio tlp in modalità AC
    
    if sudo systemctl start tlp && sudo tlp ac; then
        notify-send "Utilizzo l'energia dell'AC"
    else
        echo "Errore nell'esecuzione di tlp. Assicurati che tlp sia installato. E di disporre dei permessi corretti"
    fi

    # Invia una notifica
fi