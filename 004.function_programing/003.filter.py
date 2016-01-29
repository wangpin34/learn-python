# python filter function
print '************** filter function Test Programs **************'

def is_odd(x):
	return x%2 == 1
l1 = range(1,11)
print 'l1:',l1
print 'filter odd...'
print filter(is_odd,l1)


def not_empty(s):
	return s and s.strip()
l2 = ['A', '', 'B', None, 'C', '  ']
print 'l2',l2
print 'filter non-empty string...'
print filter(not_empty,l2)

def not_prime(num):
	l = range(2,num/2)
	for i in l:
		if num % i == 0:
			return True
	return False

l3 = range(2,101)
print 'l3',l3
print 'filter non-prime numbers...'
print filter(not_prime,l3)

raw_input()