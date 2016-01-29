from sqlalchemy import Column, String, create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

# create base class:
Base = declarative_base()

# define class User:
class User(Base):
    # table name:
    __tablename__ = 'user'

    # table column:
    id = Column(String(20), primary_key=True)
    name = Column(String(20))

# init db engine:
engine = create_engine('mysql+mysqlconnector://root:@localhost:3306/remind')
# create db session type:
DBSession = sessionmaker(bind=engine)
# creare db session
session = DBSession()

new_user = User(id='1', name='Lina')
# add to session:
session.add(new_user)
# commit session:
session.commit()
# close session:
session.close()