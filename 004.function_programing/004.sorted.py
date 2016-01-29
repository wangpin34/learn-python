# python sorted function
print '************** sorted function Test Programs **************'

l1 = [2,3,43,42,4,1,10]
print 'l1:',l1
print 'sorted l1:\n',sorted(l1)


def reversed_cmp(x,y):
	if x > y:
		return -1
	elif x < y:
		return 1
	else:
		return 0

print 'descending order list'
print sorted(l1,reversed_cmp)

raw_input()