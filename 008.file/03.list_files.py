import os
# python read and write file
print '************** List files on spec dir **************'

d = raw_input('please input a dir, by default it is current dir:\n')
print 'you choose to list files under ', d

def list(path):
	path = os.path.abspath(path)
	print 'search in ',path
	files = {}
	for f in os.listdir(path):
		name = f
		f = os.path.join(path, f)
		if os.path.isfile(f):
			files[name] = f
		elif os.path.isdir(f):
			subfiles = list(f)
			files[name] = subfiles
		else:
			continue
	return files


print list(d)