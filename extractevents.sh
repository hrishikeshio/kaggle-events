awk -F"," -v OFS="," '{print $1,$2,$3,$4,$5,$6,$7,$8,$9}' events.csv >> events3.csv

