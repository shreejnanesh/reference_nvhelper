#!/usr/bin/bash

read -p "yen hesr ninge: " fname
read -p "yen hudukbek: " pattern

echo $fname
echo $pattern

grep -q -i $pattern $fname

status=$?

if test $status -eq 0 ; then
	echo "hun Ide"
fi