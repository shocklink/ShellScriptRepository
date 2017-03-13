import numpy as np
import matplotlib.pyplot as plt
import sys
#from __future__ import print_function

print 'Number of arguments:', len(sys.argv), 'arguments.'
print 'Argument List:', str(sys.argv)
filename = sys.argv[1]
cachename = ""
if len(sys.argv) >= 3:
    cachename = sys.argv[2]


    cachearray = []
    with open(cachename, "r") as ins:
        for line in ins:
            line = line.replace(" ", "")
            line = line.replace("1", "2")
            #print line
            cachearray.append(tuple(map(int, line.rstrip())))

    cachearray = np.array(cachearray)
    col=0
    for line in cachearray:
        col += 1
        if len(line) != 1024:
            print 'error in', cachename
            print 'col',col,'=',len(line)

#input('Press any key to continue')

#with open("d.array.test", "r") as ins:
#    array = []
#    for line in ins:
#        array.append(line.rstrip())
#print array

#with open("d.free.bin", "r") as ins:
array = []
with open(filename, "r") as ins:
    for line in ins:
        line = line.replace(" ", "")
        #print line
        array.append(tuple(map(int, line.rstrip())))

#print array
#print np.array(array)
array = np.array(array)

col=0
for line in array:
    col += 1
    if len(line) != 1024:
        print 'error in', filename
        print 'col',col,'=',len(line)


if cachename == "":
    sum_array = array
else:
    # 1 is green, 2 is red
    # free is green, cache is red
    sum_array = array + cachearray

f1=open('combined.bin', 'w+')
import numpy
numpy.set_printoptions(threshold=numpy.nan)
print >>f1, sum_array
f1.close()
#data = np.array([[0,1,1,1], [1,0,0,1], [1,1,1,0], [0,0,0,1]])
# get the indices where data is 1
#x,y = np.argwhere(array == 1).T
#
#plt.scatter(x,y)
#plt.show()

linearray = sum_array
#linearray = np.array(linearray)
#for row in range(len(sum_array)):
for col in reversed(range(len(sum_array[0]))):
    if col % 4 == 0:
        linearray = np.insert(linearray, col, values=3, axis=1)
#print col, linearray[0], linearray[1]


f2=open('line.bin', 'w+')
print >>f2, linearray 
f2.close()

from matplotlib import mpl,pyplot
# make a color map of fixed colors
cmap = mpl.colors.ListedColormap(['blue', 'green', 'red','black'])
#bounds=[-1,0.9,1.9,2.9,4]
bounds=[0,1,2,3]
norm = mpl.colors.BoundaryNorm(bounds, cmap.N)

#plt.figure(figsize=(10,10))
#plt.matshow(sum_array)
plt.matshow(linearray, cmap = cmap)
plt.show()
plt.savefig('books_read.png')
