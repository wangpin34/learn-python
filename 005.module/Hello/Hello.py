#!/usr/bin/env python
# -*- coding: utf-8 -*-

'a test module'

__author__ = 'Remind Wang'

import sys

def test():
	args = sys.argv
	if len(args) == 1:
		print 'Hello World'
	elif len(args) == 2:
		print 'Hello',args[1]
	else:
		print 'Two many arguments.'

if __name__ == '__main__':
	test()

