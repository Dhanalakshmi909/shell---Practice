#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number variables passed to the script: $#"
echo "Script name: $0"
echo "Current working directory: $PWD"
echo "User running the script: $USER"
echo "Home directory user running the script: $HOME"
echo "PID of the script: $$"
sleep 50 &
echo "PID of last command in back ground: $!" 


            