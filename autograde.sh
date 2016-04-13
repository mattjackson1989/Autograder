#!/bin/bash


clear

echo "The script is running"

shopt -s globstar
#compile and spit out errors
for d in ~/midterm/*

do
	for i in "$d"/*.c
	do
		if [[ -f $i ]]
		then
			cd $d && cat name.txt >> myerror.txt && cat "$i" >> myerror.txt; 

			cd $d && gcc -c "$i" > output.txt 2>> myerror.txt;
			
		fi
	done;
	echo "Finished compiling "$d" and writing COMPILE error text";
done
#build each program
for d in ~/midterm/*

do
	for i in "$d"/*.c
	do
		if [[ -f $i ]]
		then
			cd $d && gcc "$i" -o house > output2.txt 2>> myerror.txt 
		fi
	done;
	echo "Finished building"$d" and writing BUILD error text";
done
 #run each program with 3 different scenarios and log the output INCOMPLETE
for d in ~/midterm/*

do	
	
	#first case
	echo "FIRST CASE"
	
	_PROGRAM=$(find . -type f -executable | xargs file -i | grep x-exec | cut -d":" -f1);
	echo 20 20 | $_PROGRAM >> "$d"/myerror.txt  
		
	#second case
	echo "SECOND CASE"

	_PROGRAM=$(find . -type f -executable | xargs file -i | grep x-exec | cut -d":" -f1);
	echo 40 30| $_PROGRAM >>"$d"/myerror.txt

	#third case
	echo "THIRD CASE"

	_PROGRAM=$(find . -type f -executable | xargs file -i | grep x-exec | cut -d":" -f1);
	echo 12 34 | $_PROGRAM >>"$d"/myerror.txt


	enscript "$d"/myerror.txt -o "$d"/output.pdf
	echo "Finished running "$d" and writing output text";
done

