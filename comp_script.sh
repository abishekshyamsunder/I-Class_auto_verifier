#! /bin/bash
line=$(cmp "$1" "$2" | awk '{print $NF}')
if [ ! -z $line ]; then
    awk -v file="$1" -v line=$line 'NR==line{print "```\n"file":\n"$0; exit}' "$1"
    awk -v file="$2" -v line=$line 'NR==line{print ""file":\n"$0 "\n```"; exit}' "$2"
fi
