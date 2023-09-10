#!/bin/bash

# dwmblocks
res-dwmblocks () {
    pkill dwmblocks
    dwmblocks & disown
}
