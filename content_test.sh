#!/bin/bash
rep=`curl http://192.168.1.139:80`
echo $rep
if [[ "$rep" == *"Gad"* ]]; then
	echo "GOOD YA"
else
	echo "NO GAD HADAD NO PARTY"
	exit 1
fi
