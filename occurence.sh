#!/bin/bash
echo
echo
echo "Checking the number of times each digit appears on file [demo.txt] under directory /home/ubuntu/app-logs/"
echo
echo
file=/home/ubuntu/app-logs/demo.txt    #Specifying the file to check
echo
for i in {0..9}; do
    #echo -n "$i:";
    echo -n "Number $i occurs:"; 
    grep -o "$i" $file | wc -l; echo
done
echo
echo
