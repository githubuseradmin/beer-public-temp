#!/bin/bash
#echo "Enter path"
#read path
[ ! -d $1 ] && echo "Directory not exist" && exit
#echo "Bytes:" $(find $path -type f -printf "%s\t%p\n" | sort -n | tail -1 | awk '{print $1}') > result.txt
file=$(find $1 -type f -printf "%s\t%p\n" | sort -n | tail -1 | awk '{print $2}')
echo "Bytes:" $(wc -c < $file) > result.txt
echo "Words:" $(wc -w < $file) >> result.txt
echo "Characters:" $(wc -m < $file) >> result.txt
lines=$(wc -l < $file)
echo "Lines:" $(($lines+1)) >> result.txt
