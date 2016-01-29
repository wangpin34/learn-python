#app.py
#dependencies : flask,sqlalchemy

from flask import Flask, request, render_template

app = Flask(__name__)



#import configs
from conf.config import config
db = config['db']
#import db session 
from dist.dbwrap.session import Session
sessionFactory = Session(**db)
# creare db session


@app.route('/', methods=['POST'])
def addUser():

	# test db
	from dist.entry.user import User
	new_user = User(id=1,name='Lina')
	session = sessionFactory.pop()
	# add to session:
	session.add(new_user)
	# commit session:
	session.commit()
	# close session:
	session.close()



if __name__ == '__main__':
	#run port is 5000 by default
    app.run(port=80)