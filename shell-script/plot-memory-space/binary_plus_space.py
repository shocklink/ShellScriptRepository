#!/bin/python

import os
import sys
#import numpy as np
#import matplotlib as ml
#import matplotlib.pyplot as plt

#print 'Number of arguments:', len(sys.argv), 'arguments.'
#print 'Argument List:', str(sys.argv)
filename = sys.argv[1]

count = 0;
#with open('d2','r') as f:
with open(filename,'r') as f:
    for line in f:
        for word in line.split():
            #print(word),
            #print list(word)
            #print(bin(int(word, 16))[2:].zfill(64)),

            l = list(bin(int(word, 16))[2:].zfill(64))
            #l = list(word);
            #with space separated
            for i, item in enumerate(l):
                print item,

        print

