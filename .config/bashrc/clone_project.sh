#!/bin/bash


#
# texproj
# usage: texproj project [dir_dest]
#
# Copies a dir containing a latex project
#

export LATEX_PROJS="/home/adrian/Work/LaTeX/.templates/Projects"

texproj () {

    # Show usage message
    show_usage() {
        printf "usage: texproj [-lh] project dir_dest\n"
    }

    local OPTIND opt
    while getopts ":l" opt; do
        case $opt in
            l)  # List templates
                project_names=$(ls -d $LATEX_PROJS/*/)
                for project in $project_names; do
                    project=${project%/}
                    project=${project##*/}
                    echo "$project"
                done
                return 0;;

            ?)  show_usage
                return 1;;
        esac
    done;

    # Check number of arguments
    if ! (( $# == 2 )); then
        show_usage
        printf "invalid number of arguments: %s" $#
        return 1
    fi

    project="$LATEX_PROJS/$1"
    dir_dest="$2"

    # Check that project exits
    if ! [ -d "$project" ]; then
        echo "invalid project"
        return 1
    fi

    # Copy the dir
    cp -r "$project" "$dir_dest"
}
