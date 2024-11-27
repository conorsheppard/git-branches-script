#! /bin/bash

COLUMNS=1

while getopts ":g:" opt; do
   case $opt in
		g) input="$OPTARG";;
	esac
done

shift $((OPTIND - 1))

if [ "$input" = "" ]
then
   branch_regex=''
else
	branch_regex=$input
fi

num_branches=$1
int_regex='^[0-9]+$'

if [[ -n "$input" && -n "$1" ]]; then
	num_branches=$(($num_branches + 1))
elif [[ -n "$input" && -z "$1" ]]; then
	num_branches=11
elif ! [[ $num_branches =~ $int_regex ]]; then
   num_branches=10
fi

recent="for-each-ref --sort=-committerdate refs/heads --format=%(HEAD)%(refname:short) --count=${count:=${num_branches}}"

arr=( $(git $recent | grep "$branch_regex") )

if [ "${#arr[@]}" == 0 ]
then
	echo "No branches to display";
	exit 1;
fi

PS3="Enter a number: "

select i in ${arr[@]}
do
	break
done

echo "$(echo $i | sed 's/[*]//g')" | xargs git checkout
