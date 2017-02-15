import os

# python read and write file
print '************** Create and Remove file **************'

print 'We can open a non-exist file, then it is created by os'

with open('./King.md', 'w') as k:
	k.write('# Every one can be their King')

print 'It just created a file named King.md in current directory'

print 'It tries to remove the file named diary.md created by previous python program'

os.remove('./diary.md')