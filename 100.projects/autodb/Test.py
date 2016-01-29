import os
dir = 'E:/work/portaldb/t17'
tempdir = './temp'
sqlFiles = [dir+'/'+x for x in os.listdir(dir) if os.path.splitext(x)[1] == '.sql']

print 'file amount:',len(sqlFiles)

dbname = raw_input('Please Input the dbname you want to create:')
if len(dbname) == 0:
	print 'dbname will be found from sql file...'
else:
	print 'db',dbname,'will be created...'
	if not os.path.exists(tempdir):
		os.mkdir(tempdir)
	dbdir = tempdir+"/"+dbname
	if not os.path.exists(dbdir):
		os.mkdir(dbdir)
	for p in sqlFiles:
		filename = os.path.split(p)[1]
		resFile = open(p, 'r')
		content = resFile.read()
		resFile.close()
		content = content.replace('portaldb',dbname)
		content = content.replace('portalDB',dbname)
		#print 'create',filename
		desFile = open(dbdir+'/'+filename, 'w')
		desFile.write(content)
		desFile.close()

	sqlFiles =  [dbdir+'/'+x for x in os.listdir(dbdir) if os.path.splitext(x)[1] == '.sql']


def execSql(sqlFiles,dir):
    def adjustList(index,fileList):
	    path = os.path.split(fileList[index])[1]
	    prefix = path.split('.')[0]
	    nextPrefix = os.path.split(fileList[index+1])[1].split('.')[0]
	    if prefix == nextPrefix:
		    nextPath = fileList[index+1]
		    fileList[index+1] = path
		    fileList[index] = nextPath
		    print 'switch order of ',path,'and',nextPath
		    return 0

    fileNum = len(sqlFiles)
    n = 0
    while n < fileNum:
		filePath = sqlFiles[n]
		status = os.system('mysql -u root < '+filePath)
		if status != 0:
			print 'failed in',os.path.split(filePath)[1]
			state = adjustList(n,sqlFiles)
			if state == 0:
				n = 0
			else:
				n = n + 1
		else:
		    n = n + 1;

execSql(sqlFiles,dir)

	

raw_input()