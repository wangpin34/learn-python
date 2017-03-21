# python read and write file
print '************** Read and Write file **************'

with open('./01.read_write.py', 'r') as f:
	for line in f.readlines():
		print(line.strip())

print 'Try to write to file'
with open('./diary.md', 'w') as dm:
	dm.write('# This is my diary')

print 'See, it creates a file when we try to open a nonexist file with w mode'


print 'bye'
