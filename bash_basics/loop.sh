#!/bin/bash

echo 'Bash provides several basic looping constructs: while, until, and for.'
echo 'Loops are delimited by the do/done keywords.'

echo '==='

echo 'while/until loops take a condition, specified by [[<condition>]], and will run 
WHILE the condition is truthy/UNTIL the condition is truthy. For example:'

echo 'Loop while counter (0++) is less than or equal to max (10).'
counter=0
max=10

while [[ $counter -le max ]]
do
  echo $counter
  ((counter++))
done

echo ''

echo 'Loop until counter (0++) is greater than max (10).'
counter=0
max=10

until [[ $counter -gt max ]]
do
  echo $counter
  ((counter++))
done

echo ''

echo 'For loops are slightly different, and iterate through a list of values.'
echo 'For loops use the syntax `for value in values`, where `value` is assigned to
the current value on each iteration. For example:'

echo 'Loop through numbers 1-10 and print each number.'
numbers='1 2 3 4 5 6 7 8 9 10'

for num in $numbers
do
  echo $num
done