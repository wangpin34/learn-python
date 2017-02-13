# python function def
print '************** Function arguments Test Programs **************'

# Type check
def power_001(x):
	if not isinstance(x,(int,float)):
		raise TypeError('Bad Operand Type')
	else:
		return x*x;

print power_001(2)

# Default arguments
def power_002(x,n=2):
	if not isinstance(x,(int,float)):
		raise TypeError('Bad Operand Type')
	else:
		sum = 1;
		while n > 0:
			sum = x * sum
			n = n - 1
		return sum

print power_002(2)
print power_002(2,8)


def add_end(L=[]):
    L.append('END')
    return L

print add_end()
print add_end()
print add_end()

# Default argument must be a immutable object like Str, None
def add_end_expected(L=None):
    if L is None:
        L = []
    L.append('END')
    return L

print add_end_expected()
print add_end_expected()

raw_input()
