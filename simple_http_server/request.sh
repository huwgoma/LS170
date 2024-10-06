#!/bin/bash

# Goal: 
# - The requests should consist of one line, with 3 parts (method, path, HTTP version)
# - The method should be GET
# 1) Remove the current echo line
# 2) Update the read line to read the input to 3 variables: method, path, version
# 3) Create an if statement that tests whether method is equal to GET.
#  - If true, output the string HTTP/1.1 200 OK
#  - Otherwise, output HTTP/1.1 400 Bad Request.

function server () {
  while true
  do
    read method path version
    if [[ $method = 'GET' ]]
    then
      echo HTTP/1.1 200 OK
    else
      echo HTTP/1.1 400 Bad Request
    fi
  done
}

# Allow server and netcat to run concurrently.
coproc SERVER_PROCESS { server; }

# Listen on port 2345 for incoming requests.
# Redirect input from netcat -> SERVER_PROCESS. 
# Redirect output from server -> netcat.
netcat -lv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}