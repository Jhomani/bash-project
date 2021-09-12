#!/bin/bash
# ---- arrars
#arr=() 	Create an empty array
#arr=(1 2 3) 	Initialize array
#${arr[2]} 	Retrieve third element
#${arr[@]} 	Retrieve all elements
#${!arr[@]} 	Retrieve array indices
#${#arr[@]} 	Calculate array size
#arr[0]=3 	Overwrite 1st element
#arr+=(4) 	Append value(s)
#str=$(ls) 	Save ls output as a string
#arr=( $(ls) ) 	Save ls output as an array of files
#${arr[@]:s:n} 	Retrieve n elements starting at index s


#create files
#declare -a arr=("element1" "element2" "element3")

## You could also store these lines to a variable:
#read -r -d '' VAR << EOM
#This is line 1.
#This is line 2.
#Line 3.
#EOM


read -a arr

for i in "${arr[@]}"
do
   echo "$i"
done

read -p 'Projects '  projectName

echo It\'s nice to meet you $projectName

