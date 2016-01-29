# python decorator function
import functools
print '************** decorator function Test Programs **************'
def log(arg):
	if callable(arg):
		@functools.wraps(arg)
		def wrapper(*args,**kw):
			print 'begin call %s():' % arg.__name__ 
			ret = arg(*args,**kw)
			print 'end call %s():'% arg.__name__
			return ret
		return wrapper
	else:
		def decorator(func):
			@functools.wraps(func)
			def wrapper(*args, **kw):
				print '%s %s():' % (arg, func.__name__)
				return func(*args, **kw)
			return wrapper
		return decorator

@log
def now():
	print 'May 15,2015'

@log('execute')
def now_execute():
	print 'May-15,2015'

now()

now_execute()





raw_input()