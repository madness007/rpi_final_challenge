#!/usr/bin/env bash

echo "Change default shell (for current user): "

echo "These shells are available: "
echo $(cat /etc/shells)

echo "enter path to the shell you want to use: "
read shellpath
chsh -s $shellpath
