#!/bin/sh

# Display welcome message
echo "Welcom $(whoami)!"4

# Get the hostname
hostname=$(hostname)
echo "You are logged in on host: $hostname"

# Get the date and time of last login
last_login=$(last -2 $LOGNAME | awk 'NR==2 {print $4, $5, $6}')
echo "Last login: $last_login"

# Count local and environment variables
local_variables=$(set | wc -l)
environment_variables=$(env | wc -l)
echo "Number of local variables: $local_variables"
echo "Number of environment variables: $environment_variables"

# Display directories in the search path
echo "Directories in search path:"
echo $PATH | tr ":" "\n"

