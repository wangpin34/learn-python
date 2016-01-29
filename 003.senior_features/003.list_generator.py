# python list generator
import os 
print '************** List Generator Test Programs **************'

l = range(1,101)
print l

print [x * x for x in range(1, 11)]


print [x * x for x in range(1,11) if x%2 == 0]


print [m + n for m in 'ABC' for n in 'xyz']

print [d for d in os.listdir('.')]

d = {'x': 'A', 'y': 'B', 'z': 'C' }

print [k + '=' + v for k, v in d.iteritems()]

L = ['Hello', 'World', 'IBM', 'Apple']

print [s.lower() for s in L]

raw_input()
