#!/bin/bash

numbers=()

echo "Enter multiple decimal numbers, separated by space:"
read -a numbers
echo
largest=${numbers[0]}
for number in "${numbers[@]}"; do
  if (( $(echo "$number > $largest" | bc -l) )); then
    largest=$number
  fi
done
echo
echo "The largest number from the above given set is: $largest"
echo
echo
