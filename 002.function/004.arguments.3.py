# python function def
print '************** Function arguments Test Programs **************'

print 'keyword arguments'

def person(name, age, **kw):
    print 'name:', name, 'age:', age, 'other:', kw

person('Remind',6)

person('Remind',6,city='shanghai')

kw = {'city':'shanghai','job':'Java'}

person('Remind',6,**kw)


raw_input()