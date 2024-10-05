#!/bin/bash

echo 'You can assign a variable using var=<value> syntax, without spaces.'
echo 'eg. name=Hugo will set *name* to Hugo'
name='Hugo'
echo 'You can reference variables by prepending a $ to it (eg. echo $var)'
echo $name

echo 'You can also read input using read <variable>, assigning the given input
to the list of given variable(s).'
echo 'Please enter an animal (no spaces). The input will be saved to the animal variable.'
read animal
echo $animal

