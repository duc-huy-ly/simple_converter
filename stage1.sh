#!/usr/bin/env bash
set -euo pipefail

echo "Enter a definition:"
read -r -a user_input
arr_length="${#user_input[@]}"
definition="${user_input[0]}"
constant="${user_input[1]}"

stringRegex='^[a-z]+_to_[a-z]+$'
numberRegex='^-?[0-9]+(\.[0-9]+)?$'

calculate () {
    result=$(echo "scale=2; $constant * $input" | bc -l)
    printf "Result: %s\n" "$result"
}

input() {
    echo "Enter a value to convert:"
        read -r input

        while true; do
            if ! [[ "$input" =~ ^$numberRegex$ ]]; then
                echo "Enter a float or integer value!"
                read -r input
            else
                break
            fi
        done
        calculate
}

if [ "$arr_length" == "2" ] && [[ "$definition" =~ $stringRegex ]] && [[ "$constant" =~ $numberRegex ]]; then
    input
else
    echo "The definition is incorrect!"
fi