import csv
train=[]
with open("raw/train.csv","rb") as f:
	fr=csv.reader(f)
	fr.next()
	for i in fr:
		train.append(i)
print train[:5]
users={}
with open("raw/users.csv","rb") as f:
	fr=csv.reader(f)
	fr.next()
	for i in fr:
		users[int(i[0])]=i[1:]
print users[3197468391]

with open("processed/traincat.csv","wb") as f:
	fw=csv.writer(f)
	for i in train:
		fw.writerow(i+users[int(i[0])])