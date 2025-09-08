#!/bin/bash

#SPECIAL VARIABLES IN SHELL

echo "All variables passed to the script :: $@"
echo "No. of variables passed to the script :: $#"
echo "Current working directory :: $PWD"
echo "Home directory of user :: $HOME"
echo "Script name :: $0"
echo "Which user running this script :: $USER"
echo "PID of the current script :: $$"
sleep 10 &
echo "PID of the last command running in the background :: $!"