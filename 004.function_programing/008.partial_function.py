# python decorator function
import functools
print '************** partial function Test Programs **************'
print int('11111111',base=2)
print int('11111111',base=8)
print int('11111111',base=16)


int2 = functools.partial(int, base=2)

print int2('11111111')


max2 = functools.partial(max,10)

print max2(2,3,4,5)

raw_input()