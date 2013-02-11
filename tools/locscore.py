import csv
train=[]
with open("../ntraincat.formatted.csv","rb") as f:
	fr=csv.reader(f)
	for i in fr:
		train.append(i)

test=[]
with open("../nvalidcat.formatted.csv","rb") as f:
	fr=csv.reader(f)
	for i in fr:
		test.append(i)

print train[:5]
ntrain=[]
for i in train:
	score=0
	if i[6]!="":
		if i[10] in i[6] and i[10]!="":
			score+=1*10
		if i[11] in i[6] and i[11]!="":
			score+=1*5
		if i[12] in i[6] and i[12]!="":
			score+=1*15
		if i[13] in i[6] and i[13]!="":
			score+=1*2
	ntrain.append(i[:6]+i[7:10]+[score])
print ntrain[:5]
ntest=[]
for i in test:
	score=0
	if i[6]!="":
		if i[10] in i[6] and i[10]!="":
			score+=1*10
		if i[11] in i[6] and i[11]!="":
			score+=1*5
		if i[12] in i[6] and i[12]!="":
			score+=1*15
		if i[13] in i[6] and i[13]!="":
			score+=1*2
	ntest.append(i[:6]+i[7:10]+[score])
print ntest[:5]

with open("../trainloc.csv","wb") as f:
	fw=csv.writer(f)
	fw.writerows(ntrain)

with open("../testloc.csv","wb") as f:
	fw=csv.writer(f)
	fw.writerows(ntest)
