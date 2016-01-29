#!/usr/bin/env python
# -*- coding: utf-8 -*-

'a test module'

__author__ = 'Remind Wang'

def application(environ, start_response):
    start_response('200 OK', [('Content-Type', 'text/html')])
    return '<h1>Hello, %s!</h1>' % (environ['PATH_INFO'][1:] or 'web')

if __name__ == '__main__':
	test()