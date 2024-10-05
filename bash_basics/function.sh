#!/bin/bash

echo 'Functions provide a way of defining one or more commands as a named unit of
code that can be executed later.' 

greeting () {
  echo Hello World!
}

greeting

echo ''

echo 'Functions can optionally take one or more arguments. Within the function, 
arguments are referenced using a 1-based integer index system.'
echo 'For example, $1 refers to the variable 1, which is assigned to the first
argument given to the function.'

echo ''

echo "greeting 'Peter' 'Paul':"

greeting() {
  echo Hello $1
  echo Hello $2
}

greeting 'Peter' 'Paul'