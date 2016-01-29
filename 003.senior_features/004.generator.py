# python list generator 
print '************** Generator Test Programs **************'

l = [x * x for x in range(10)]

print l

g = (x * x for x in range(10))
print g

for x in g:
	print x

def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        yield b
        a, b = b, a + b
        n = n + 1


for x in fib(10):
	print x








raw_input()