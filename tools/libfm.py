import csv
out=[]
with open("../processed/out.txt","rb")as f:
	with open("../processed/dumbtest.csv","rb") as g:
		fr=csv.reader(f)
		gr=csv.reader(g,delimiter=" ")
		for i in gr:
			out.append(i[:2]+fr.next())
print out[:5]

for i in out:
	if i[0]==lastuser:
		rates[i[2]]=i[1]
	else:
		