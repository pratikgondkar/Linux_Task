#!/bin/bash
set -x

##=== Prerequisite
##=== This script required a template file, here in our case trainer.template
##=== having content {{fname}} is trainer of {{topic}}

template_file=$1

# Read the template file content
template_content=$(cat "$template_file")

# Identify key-value pairs
while [ "$#" -gt 0 ]; do
    key_value="$1"
    key="${key_value%=*}"
    value="${key_value#*=}"
    
    # Replace variables in the template
    template_content=$(echo "$template_content" | sed "s|{{$key}}|$value|g")
    shift
done

# Print the final template
echo "$template_content"


