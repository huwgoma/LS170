#!/bin/bash

echo 'An if statement in bash has the following basic syntax:'
echo 'if [[ <condition> ]]
then
  <commands>
fi'

echo ''

echo 'The brackets are a shorthand syntax for the `test` command, which defines a
number of operations for working with strings, integers, files, etc. For example:'
echo '-n <string> returns true if the length of string is greater than 0.'
echo '<int> -eq <other_int> returns true if int is equal to other_int.'
echo '-e path/to/file returns true if the specified file exists.'

echo ''

echo 'Example 1: Write an expression to output a string if it is longer than 0.'
echo 'if [[ -n $string ]]
then
  echo $string
fi'

echo ''

echo 'Example 2: Write an expression to compare 2 integers and output a string
if they are equal.'
echo 'if [[ $int_1 -eq $int_2 ]]
then
  echo $int_1 and $int_2 are equal!
fi'

echo '' 

echo 'Example 3: Write an expression that outputs File Exists if the file 
conditional.sh exists.'
echo 'if [[ -e ./conditional.sh ]]
then
  echo File exists
fi'
