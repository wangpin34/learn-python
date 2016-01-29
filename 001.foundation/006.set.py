# Set foundation
print '************** Set Test Programs **************'
s1 = set([1,2])
print 's1:',s1

#duplicate elements will not be stored
s2 = set([1,1,1,1,4,5])
print 's2:',s2

s2.add(3)
print 'add 3 to s2:',s2

s2.add(3)
print 'add 3 to s2:',s2

s2.remove(3)
print 'remove 3 from s2:',s2

#remove non-exist element
#s2.remove(10) # throw exception
print 'remove non-exist 10 from s2',s2


print 's1 and s2 intersection:',s1&s2
print 's2 and s2 union:',s1|s2




raw_input()