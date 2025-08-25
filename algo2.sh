#!/bin/bash
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
    echo "Valid integers entered: ${integers[@]}"
}

# Call the function to get valid integers

get_valid_integers
