#!/bin/bash

# Goal: Allow server to receive some input via netcat and use that input 
#       as part of a response.
# 1) Create an indefinite loop in server.
# 2) Within the loop: 
#    - Assign input to a variable named message.
#    - Output: You said <message> 

function server () {
  while true
  do
    read message
    echo You said: $message
  done
}

# Allow server and netcat to run concurrently.
coproc SERVER_PROCESS { server; }

# Listen on port 2345 for incoming requests.
# Redirect input from netcat -> SERVER_PROCESS. 
# Redirect output from server -> netcat.
netcat -lv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}