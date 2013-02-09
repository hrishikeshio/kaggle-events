import csv
from operator import itemgetter
result=[]
with open("../outcat3.csv","rb") as f:
	fr=csv.reader(f)
	for i in fr:
		result.append([100-float(i[0])])
print result[:5]
test=[]
with open("../raw/test.csv",'rb') as f:
	fr=csv.reader(f)
	fr.next()
	for i in fr:
		test.append([int(i[0])]+[int(i[1])])
print test[:5]
test2=[]
for i,j in zip(test,result):
	test2.append(i+j)
print test2[:5]
test2.sort(key=itemgetter(0,2))
print test2
temp=test2[0][0]
temp2=[]
submission=[]
for i in test2:
	if i[0]==temp:
		#print i[0]

		temp2.append(i[1])
	else:
		submission.append([temp]+[temp2])
		temp2=[]
		temp2.append(i[1])
	temp=i[0]
submission.append([temp]+[temp2])
print submission[:5]

with open("submitoutcat3.csv","wb") as f:
	fw=csv.writer(f)
	fw.writerows(submission)