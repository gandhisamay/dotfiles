#clear the cache first
cp /home/samaygandhi/.cache/rofi3.druncache /home/samaygandhi/rofi3.druncache
rm -rf /home/samaygandhi/.cache/*
mv /home/samaygandhi/rofi3.druncache /home/samaygandhi/.cache/ 

#now empty the var and tmp libraries 
sudo rm -Rf /tmp/*
sudo rm -Rf /var/log/*

#now time to remove older timeshift shots and store only the most recent 2 shots in memory
snapshot_names=($(ls /timeshift/snapshots/))
snapshot_count=${#snapshot_names[@]}

if [[ snapshot_count -ge 3 ]]; then 
  for (( i=0 ; i<($snapshot_count-2) ; i++ )); 
  do
      sudo timeshift --delete --snapshot "${snapshot_names[$i]}"
  done
fi
