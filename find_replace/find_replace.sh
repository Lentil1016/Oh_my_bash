#!/bin/bash

a=`find target -type f`

for i in ${a[*]}
do
	temp=`basename $i|awk -F '.' '{print $1}'`
	sourcefile=`find source -type f|grep $temp`
	if [ -z $sourcefile ] ; then
		echo 【$i】保持原状
	else
		mv $i backup
		cp $sourcefile target
		echo 【$i】已替换归档
	fi
done
