#!/bin/bash

int=10

if [[ !($int -lt 5 || $int -gt 10) ]]
then
  echo $int is greater than 5 and less than 10
fi