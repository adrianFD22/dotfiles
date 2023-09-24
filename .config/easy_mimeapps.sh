#!/bin/bash

# $1: minor type
# $2: default desktop entry
create-mimetype-rules () {
	mime_list_path="/usr/share/mime";

	minor_type=$1
	desktop_entry=$2

	major_types=$(ls "$mime_list_path/$1")

	for curr_major_type in $major_types; do
		echo "$minor_type/${curr_major_type%.*}=$desktop_entry;"
	done
}

# Set default desktop entry
create-mimetype-rules text nvim.desktop >> ~/.config/easy-mimeapps.list
