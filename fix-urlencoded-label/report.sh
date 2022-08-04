#!/bin/bash
enable_logging=true # or set to false

name="$1"
base_path="$2"
loaded_file="$3"
tied_to_file="$4"
hash="$5"
label="$6"
complete=$"7"

if [ $enable_logging == "true" ]; then
  log_file="log_report.log"
  touch $log_file
  
  echo "$(date) | pid $$
name           : $name
base_path      : $base_path
loaded_file    : $loaded_file
tied_to_file   : $tied_to_file
hash           : $hash
label          : $label
complete       : $complete
---------------------------------------------------" >> $log_file
fi
