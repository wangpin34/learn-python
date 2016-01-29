# python function def
print '************** Function arguments Test Programs **************'

print 'default arguments'

def power_001(x):
	if not isinstance(x,(int,float)):
		raise TypeError('Bad Operand Type')
	else:
		return x*x;

print power_001(2)


def power_002(x,n=2):
	if not isinstance(x,(int,float)):
		raise TypeError('Bad Operand Type')
	else:
		sum = 1;
		while n>0:
			sum = x * sum
			n = n - 1
		return sum

print power_002(2)
print power_002(2,8)


def enroll_001(name, gender):
    print 'name:', name
    print 'gender:', gender

enroll_001('Remind','Male')

def enroll_002(name, gender,age=6,city='shanghai'):
    print 'name:', name
    print 'gender:', gender
    print 'age:',age
    print 'city:',city

enroll_002('Remind','Male')
enroll_002('Mona','female',4,'Gaoyou')
enroll_002('Nita','female',city='Shangrao')

def add_end(L=[]):
    L.append('END')
    return L

print add_end()
print add_end()

def add_end_expected(L=None):
    if L is None:
        L = []
    L.append('END')
    return L

print add_end_expected()
print add_end_expected()

raw_input()