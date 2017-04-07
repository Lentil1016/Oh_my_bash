#!/bin/bash

student='ahahah'
str='student'
eval echo \$${str}

while read line1
do
	read line2 <./a
	echo "$line1 $line2"
done <./students
