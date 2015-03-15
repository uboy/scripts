#!/bin/sh
 
# ./ctags_with_dep.sh file1.c file2.c ... to generate a tags file for these files.
 
gcc -M $* | sed -e 's/[\\ ]/\n/g' | \
sed -e '/^$/d' -e '/\.o:[ \t]*$/d' | \
ctags -L - --c++-kinds=+p --fields=+iaS --extra=+q 
#find `pwd` -regex ".*\.\(cc\|hh\|c\|h\|cpp|hpp\)" | tr "\n" " " | gcc -M -
