# dict foundation
print '************** Dict Test Programs **************'
score = {'Ada':87,'Bob':60,'Clare':99}
print score

if 'Lisa' in score:
	print 'Lisa has score'
else:
	print 'Lisa has no score'

print 'Ada\'s score is ',score['Ada']
print 'Bob\'s score is ',score.get('Bob')
print 'Lisa\'s score is ',score.get('Lisa',100)

raw_input()