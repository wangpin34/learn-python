from sqlalchemy import Column, String, create_engine
from sqlalchemy.orm import sessionmaker


class Session(object):
	def __init__(self,**options):
		# init db engine:
		engine = create_engine('mysql+mysqlconnector://'+options['username']+':@'+options['host']+':3306/'+options['name']),

	def pop(self):
		return sessionmaker(bind=engine)