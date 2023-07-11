#!/bin/bash

# Open multiple tabs with different search engines for searching a term


# Search engines to open
declare -a engines_list=("arxiv" "scholar" "google" "ddg")

# Create the qtb command
command=""

for curr_engine in "${engines_list[@]}"
do
    command="${command} open -t ${curr_engine} $1;;"
done

command="${command} message-info 'Multiples seaches of $1'"

# Return command
echo "$command" >> "$QUTE_FIFO"
