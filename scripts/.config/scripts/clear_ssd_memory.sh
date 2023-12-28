#clear the cache first
cp ~/.cache/rofi3.druncache ~/rofi3.druncache
rm -rf ~/.cache/*
mv ~/rofi3.druncache ~/.cache/ 

#now empty the var and tmp libraries 
sudo rm -Rf /tmp/*
sudo rm -Rf /var/log/*

#now time to remove older timeshift shots and store only the most recent 2 shots in memory
#this part of the script is yet to be implemented
