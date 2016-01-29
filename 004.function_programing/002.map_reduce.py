# python map/reduce function
print '************** map/reduce function Test Programs **************'

print 'test map'
def power(x):
	return x * x;

l1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print 'l1:',l1
print 'map l1 with power function:',map(power,l1)


print map(str, [1, 2, 3, 4, 5, 6, 7, 8, 9])


print 'test reduce'
def add(x,y):
	return x + y
l2 = range(1,11)
print 'l2:',l2
print 'l2 total:',reduce(add,l2)

def fn(x,y):
	return x * 10 + y

l3 = [1,9,8,7]
print 'l3:',l3
print '13 to int:',reduce(fn,l3)

l4 = ['ADA','biLL']
print 'l4:',l4
def toName(name):
	#first = name[0:1].upper()
	#last = name[1:].lower()
	#return first + last
	return name.capitalize()
print 'to name by map func:',map(toName,l4)


l5 = [1,2,3,4]
print 'l5:',l5
def prod(list):
	return reduce(lambda x,y : x * y,list)
print 'l5 elements proect:',prod(l5)






raw_input()