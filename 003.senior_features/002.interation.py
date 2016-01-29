# python interation 
from collections import Iterable
print '************** Interation Test Programs **************'

d = {'a':1,'b':2,'c':3}
for k in d:
	print k

for v in d.itervalues():
	print v

for k,v in d.iteritems():
	print k,':',v


for x in 'Today':
	print x


if isinstance('abc', Iterable):
	print 'string is iterable'
else:
	print 'string is not iterable'

if isinstance(123, Iterable):
	print 'int is iterable'
else:
	print 'int is not iterable'

print 'make index for list'
for i,value in enumerate(['A','B','C']):
	print i,':',value

for x, y in [(1, 1), (2, 4), (3, 9)]:
    print x, y



raw_input()