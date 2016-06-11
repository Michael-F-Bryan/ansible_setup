#!/bin/bash

dest="/etc/audit/rules.d/2_setuid.rules"
AWK="/usr/bin/awk"
FIND="/usr/bin/find"
SORT="/usr/bin/sort"
GREP="/bin/egrep"

# Clear the destination file
echo "" > $dest

# Iterate through all ext2/3/4 drives installed
for i in `cat /etc/fstab | $GREP '(ext4|ext3|ext2)' | $AWK '{print($2)}'` 
do
  # For each one with either the set uid or set gid bit active, add a line
  # to the rules file and echo it to stderr
  for some_file in `$FIND $i -xdev -type f \( -perm -4000 -o -perm -2000 \) -print | $SORT` 
  do
    echo $some_file >&2
    echo $some_file | $AWK '{ print("-w", $1, "-F perm=x -F auid>500 -F auid!=-1 -k privileged -k ids-exec-high") }' >> $dest
  done
done

