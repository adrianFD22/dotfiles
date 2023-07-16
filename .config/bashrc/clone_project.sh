#!/bin/bash


#
# texproj
# usage: texproj project [dir_dest]
#
# Copies a dir containing a latex project
#


export LATEX_PROJS="/home/adrian/Work/LaTeX/Templates/Projects"

texproj () {

    # Option to list project names
    while getopts ":l" opt; do
        project_names=$(ls -d $LATEX_PROJS/*/)

        for project in $project_names; do
            project=${project%/}
            project=${project##*/}
            echo $project
        done

        return 0
    done;

    # Check number of arguments
    if ! (( ($# == 2) )); then
        echo "usage: texproj project dir_dest"
        return 1
    fi

    project="$LATEX_PROJS/$1"
    dir_dest="$2"

    # Check that project exits
    if ! [ -d $project ]; then
        echo $
        echo "invalid project"
        return 1
    fi

    # Copy the dir
    cp -r $project $dir_dest
}
