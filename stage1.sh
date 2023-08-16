#!/usr/bin/env bash

echo -e "Enter a definition:"
read -a user_input
arr_length="${#user_input[@]}"
definition="${user_input[0]}"
constant="${user_input[1]}"

stringRegex='^[a-z]+_to_[a-z]+$'
numberRegex='^-?[0-9]+(\.[0-9]+)?$'

if [ "$arr_length" == "2" ] && [[ "$definition" =~ $stringRegex ]] && [[ "$constant" =~ $numberRegex ]]; then
    echo "The definition is correct!"
else
    echo "The definition is incorrect!"
fi
