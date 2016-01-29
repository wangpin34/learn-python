# python function def
print '************** Function arguments Test Programs **************'

print 'changeable arguments'

def calc(*numbers):
    sum = 0
    for n in numbers:
        sum = sum + n * n
    return sum

print calc(2,7,0)

nums = [1,2,3]
print calc(*nums)




raw_input()