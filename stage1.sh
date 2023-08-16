#!/usr/bin/env bash

echo "Enter a definition:"
read -a user_input
arr_length="${#user_input[@]}"
definition="${user_input[0]}"
constant="${user_input[1]}"

stringRegex='^[a-z]+_to_[a-z]+$'
numberRegex='^-?[0-9]+(\.[0-9]+)?$'

if [ "$arr_length" == "2" ] && [[ "$definition" =~ $stringRegex ]] && [[ "$constant" =~ $numberRegex ]]; then
    echo "Enter a value to convert:"
    read input

    while true; do
        if ! [[ "$input" =~ ^$numberRegex$ ]]; then
            echo "Enter a float or integer value!"
            read  input
        else
            break
        fi
    done

    result=$(echo "scale=2; $constant * $input" | bc -l)
    printf "Result: %s\n" "$result"
else
    echo "The definition is incorrect!"
fi