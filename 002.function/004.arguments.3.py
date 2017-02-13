# python function def
print '************** Function arguments Test Programs **************'

print 'keyword arguments'

def person(name, age, **kw):
    print 'name:', name, 'age:', age
    for name, value in kw.items():
        print '{0}: {1}'.format(name, value)

person('Remind',6)

person('Remind',6,city='shanghai')

namedParameters = {'city':'shanghai','job':'Java'}

person('Remind',6, city = 'shanghai', job = 'Java')
person('Remind',6, **namedParameters)


raw_input()
