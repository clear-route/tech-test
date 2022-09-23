import csv 
listA = []
with open('latest-customers.txt') as f:
    data = csv.reader(f, delimiter=',')
    for row in data:
        listA.append(row)
listA.pop(0)
newlist = [x for x in listA if 60>int(x[1])>39]
for i, row in enumerate(newlist):
    del row[1:3]
    newlist[i]=row

with open('affectedCustomers.txt', 'w', newline='') as f:
    r = csv.writer(f) 
    r.writerows(newlist)

