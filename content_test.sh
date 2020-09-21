#!/bin/bash
rep=`curl http://192.168.1.139:80`
if [ "$rep" == 'GAD' ]; then
	echo "GOOD YA"
else
	echo "NO GAD HADAD NO PARTY"
	exit 1
fi
