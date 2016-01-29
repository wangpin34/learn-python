from base.Student import Student
from inherit.Animal import Animal
from inherit.Dog import Dog
bar = Student('Mona',100)
bar.printScore()

print bar.getScore()

bar.setScore(98)

print bar.getScore()

#bar.setScore(-1)
print bar._Student__score

print 'Animal Classes'
animal = Animal()
dog = Dog()

animal.run()
dog.run()
dog.eat()


print isinstance(dog, Animal)

print dir(dog)

raw_input()