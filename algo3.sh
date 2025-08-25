#!/bin/bash

# Function to display welcome message
display_welcome_message() {
    username=$(whoami)
    hostname=$(hostname)
    echo "Welcome $username!"
    echo "You are logged in on host: $hostname"
    last_login=$(last -2 $LOGNAME | awk 'NR==2 {print $4, $5, $6}')
    echo "Last login: $last_login"
}

# Function to count variables
count_variables() {
    local_variables=$(set | wc -l)
    environment_variables=$(env | wc -l)
    echo "Number of local variables: $local_variables"
    echo "Number of environment variables: $environment_variables"
}

# Function to display search path
display_search_path() {
    echo "Directories in search path:"
    echo $PATH | tr ":" "\n"
}

# Function to get three valid integers
get_valid_integers() {
    integers=()
    for i in {1..3}; do
        while true; do
            read -p "Enter integer $i: " num
            if [[ $num =~ ^[0-9]+$ ]]; then
                integers+=($num)
                break
            else
                echo "Invalid input. Please enter a valid integer."
            fi
        done
    done
}

# Function to find largest and smallest numbers
find_largest_smallest() {
    integers=("$@")
    largest=${integers[0]}
    smallest=${integers[0]}
    for num in "${integers[@]}"; do
        if ((num > largest)); then
            largest=$num
        fi
        if ((num < smallest)); then
            smallest=$num
        fi
    done
    echo "Largest number: $largest"
    echo "Smallest number: $smallest"
}

# Function to perform operations
perform_operations() {
    integers=("$@")
    echo "Results of operations:"
    for ((i=0; i<${#integers[@]}-1; i++)); do
        for ((j=i+1; j<${#integers[@]}; j++)); do
            a=${integers[i]}
            b=${integers[j]}
            echo "$a + $b = $((a + b))"
            echo "$a - $b = $((a - b))"
            echo "$a * $b = $((a * b))"
            echo "$a / $b = $((a / b))"
        done
    done
}

# Main function
main() {
    display_welcome_message
    count_variables
    display_search_path
    get_valid_integers
    find_largest_smallest "${integers[@]}"
    perform_operations "${integers[@]}"
    echo "Script is done."
}

# Call main function
main

