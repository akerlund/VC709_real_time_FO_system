#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import sys

def rest_printer(iterations, number, divisior):

	rest = number%divisior	

	for i in range(iterations):
		print("rest = %i"%(rest))		
		rest = (number+rest)%divisior



if __name__ == "__main__":
	rest_printer(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]))
