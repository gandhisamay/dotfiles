temp=$(sensors | grep "edge" | tr -d '+'| awk '{print $2}')
echo " ${temp}"
