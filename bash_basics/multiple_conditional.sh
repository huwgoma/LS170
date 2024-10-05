#!/bin/bash

echo 'We can implement multiple conditions using nested if statements, else and elif
statements, and boolean gates && and ||.'

echo ''

echo 'Example 1: Write an expression that produces 0-2 conditional outputs: 
1) <int> is less than 10.
2) <int> is also less than 5.'

int=4
if [[ $int -lt 10 ]]
then
  echo $int is less than 10.

  if [[ $int -lt 5 ]]
  then
    echo $int is also less than 5.
  fi
fi

echo '==='

echo 'Example 2: Write an expression that prints either <int> is less than 10,
or <int> is not less than 10, depending on the value of int.'
int=10
if [[ $int -lt 10 ]]
then
  echo $int is less than 10
else
  echo $int is not less than 10
fi

echo '==='

echo 'Example 3: Write an expression that prints either <int> is less than 10,
<int> is greater than 20, or <int> is between 10 and 20.'
int=15
if [[ $int -lt 10 ]]
then
  echo $int is less than 10.
elif [[ $int -gt 20 ]]
then
  echo $int is greater than 20.
else
  echo $int is between 10 and 20.
fi

echo '==='

echo 'Example 4: Write an expression that prints <int> is between 10 and 20, if true.'
int=15
if [[ $int -gt 10 && $int -lt 20 ]]
then
  echo $int is between 10 and 20.
fi

echo '==='

echo 'Example 5: Write an expression that prints <int> is less than 5 OR greater
than 10, if true.'
int=11
if [[ $int -lt 5 || $int -gt 10 ]]
then
  echo $int is less than 5 OR greater than 10.
fi

echo '==='

echo 'Example 6: Write an expression that prints <int> is NOT less than 20, if true.'
int=20
if [[ ! $int -lt 20 ]]
then
  echo $int is NOT less than 20.
fi