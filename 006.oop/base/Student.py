# python define class
class Student(object):
	def __init__(self,name,score):
		self.__name = name
		self.__score = score

	def printScore(self):
		print '%s:%s'%(self.__name,self.__score)

	def getName(self):
		return self.__name

	def getScore(self):
		return self.__score

	def setScore(self,score):
		if 0 <= score <= 100:
			self.__score = score
		else:
			raise ValueError('bad score')