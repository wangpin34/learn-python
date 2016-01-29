# python function def
print '************** Function arguments Test Programs **************'

print 'mixed arguments'

def func(a, b, c=0, *args, **kw):
    print 'a =', a, 'b =', b, 'c =', c, 'args =', args, 'kw =', kw


func(1,2)

func(1,2,3)

func(1,2,3,4)

func(1,2,city='shanghai')

args = [1,2,3,4]
kw = {'job':'Java'}

func(1,2,**kw)

func(*args)


func(*args,**kw)




raw_input()