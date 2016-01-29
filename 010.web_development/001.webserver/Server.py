# server.py
# import from wsgiref module
from wsgiref.simple_server import make_server
# import our defined application func from Hello module:
from Hello import application

# create a http server,ip address is empty, port is 8000, handle function is application:
httpd = make_server('', 8000, application)
print "Serving HTTP on port 8000..."
# start listener:
httpd.serve_forever()