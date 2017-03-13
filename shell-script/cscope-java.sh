#!/bin/bash
CSCOPE_FILE=cscope.out
if [ -n "$1" ]; then
	echo "Source code directory: " $1
	echo "Create file map : " $CSCOPE_FILE
	find $1 -name "*.aidl" -o -name "*.cc" -o -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.java" -o -name "*.mk" -iname "*.s" > $CSCOPE_FILE
	cscope -bkq -i $CSCOPE_FILE
	ctags -R --exclude=.svn --exclude=.git --exclude=out
else
	echo "Please key-in path of project"
fi
