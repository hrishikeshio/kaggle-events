import csv
train=[]
trainp=[]
with open("raw/train.csv",'rb') as f:
	r=csv.reader(f)
	print r.next()
	for row in r:
		train.append(row)
print train[:5]
for i in train:
	interested=int(i[4])
	not_interested=int(i[5])
	#print interested,not_interested
	#exit()
	if interested:
		rating = 5
	elif not_interested:
		rating = 0
	else:
		rating=2
	trainp.append([i[0],i[1],rating])
with open("processed/dumbtrain.csv","wb",) as f:
	w=csv.writer(f,delimiter=" ")
	w.writerows(trainp)

train=[]
trainp=[]
with open("raw/test.csv",'rb') as f:
	r=csv.reader(f)
	print r.next()
	for row in r:
		train.append(row)
print train[:5]
for i in train:
	#print interested,not_interested
	#exit()
	trainp.append([i[0],i[1],1])
with open("processed/dumbtest.csv","wb") as f:
	w=csv.writer(f,delimiter=" ")
	w.writerows(trainp)