#!/bin/bash


# reMarkable: copy files to Google Drive to the reMarkable folder
cprm () {
    for file in "$@"
    do
        echo "Copying $file..."
        dir_name=$(dirname "$file")
        file_name=$(basename "$file")
        $(cd "$dir_name" && rclone copyto "./$file_name" "adrianGoogleDrive:Zona reMarkable/$file_name")
    done

    echo "End"
}

# reMarkable: move files to Google Drive to the reMarkable folder
mvrm () {
    for file in "$@"
    do
        echo "Moving $file..."
        dir_name=$(dirname "$file")
        file_name=$(basename "$file")
        $(cd "$dir_name" && rclone moveto "./$file_name" "adrianGoogleDrive:Zona reMarkable/$file_name")
    done

    echo "End"
}
