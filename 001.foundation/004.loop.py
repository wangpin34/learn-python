# loop foundation
print '************** Loop Test Programs **************'
names = ['Ada','Amy','Aliy']
for name in names:
	print name

sum = 0
for x in [1,2,3,4,5,6,7,8,9,10]:
	sum += x

print sum

bigsum = 0
for x in range(101):
	bigsum += x

print bigsum

n=100
disSum = 0
while n>0:
	disSum += n
	n = n - 1

print disSum


raw_input()