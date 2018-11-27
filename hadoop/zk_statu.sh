#!/bin/bash
function getstatus(){
	exec 9<> /dev/tcp/$1/2181 2> /dev/null
	echo stat >&9
	MODE=$(cat <&9 | grep -Po "(?<=Mode:).*")  # ?<=不显示Mode:
	exec 9<&-
	echo ${MODE:-NULL}
}
for i in node{1..3} nn01
do
	echo -ne "$i\t"
	getstatus $i
done
