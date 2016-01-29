#user class
from sqlalchemy import Column, String,Integer, create_engine
from sqlalchemy.ext.declarative import declarative_base

# create base class:
Base = declarative_base()


class User(Base):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True)
    name = Column(String(100))