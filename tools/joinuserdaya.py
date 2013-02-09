import csv
train=[]
test=[]
with open("raw/train.csv","rb") as f:
	fr=csv.reader(f)
	trainheader=fr.next()
	for i in fr:
		train.append(i)
print train[:5]
users={}
with open("raw/users.csv","rb") as f:
	fr=csv.reader(f)
	userheader=fr.next()
	
	for i in fr:
		users[int(i[0])]=i[1:]
print users[3197468391]

with open("processed/traincat.csv","wb") as f:
	fw=csv.writer(f)
	fw.writerow(trainheader+userheader[1:])
	for i in train:
		fw.writerow(i+users[int(i[0])])

with open("raw/test.csv","rb") as f:
	fr=csv.reader(f)
	validheader=fr.next()
	for i in fr:
		test.append(i)
print test[:5]

with open("processed/testcat.csv","wb") as f:
	fw=csv.writer(f)

	fw.writerow(validheader+userheader[1:])
	for i in test:
		fw.writerow(i+users[int(i[0])])
