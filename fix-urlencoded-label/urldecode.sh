#!/bin/bash
enable_logging=true # or set to false

name=$1
label=$2

# Solution function taken from https://stackoverflow.com/a/37840948/3663357
function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }
decoded=$(urldecode $label)

if [ $enable_logging == "true" ]; then
  log_file="log_urldecode.log"
  touch $log_file
  
  echo "$(date) | pid $$
name           : $name
encoded label  : $label
decoded label  : $decoded
---------------------------------------------------" >> $log_file
fi

# Return the result to be used by rtorrent. echo -n to remove the trailing new line
echo -n $decoded
