# python Higher-order function
print '************** Higher-order function Test Programs **************'

print abs
f = abs
print f
print f(-1)

def add(x,y,f):
	return f(x) + f(y)

print add(-1,-9,abs)

raw_input()