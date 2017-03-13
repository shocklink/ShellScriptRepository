#!/bin/python

count = 0;
with open('d','r') as f:
    for line in f:
        for word in line.split():
            #print(word),
            print(bin(int(word, 16))[2:].zfill(64)),
        print
