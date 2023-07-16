#!/bin/bash


# reMarkable: copy files to Google Drive to the reMarkable folder
cprm () {
    for file in "$@"
    do
        echo "Copying $file..."
        rclone copyto "$file" "adrianGoogleDrive:Zona reMarkable/$file"
    done

    echo "End"
}

# reMarkable: move files to Google Drive to the reMarkable folder
mvrm () {
    for file in "$@"
    do
        echo "Moving $file..."
        rclone moveto "$file" "adrianGoogleDrive:Zona reMarkable/$file"
    done

    echo "End"
}
