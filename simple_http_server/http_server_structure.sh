#!/bin/bash

function server () {
# processing logic for incoming data
}

# The coproc method creates a coprocess, which allows the `server` function
# to be run asynchronously alongside netcat.
# This coprocess is named SERVER_PROCESS, and executes `server`.
coproc SERVER_PROCESS { server; }

# netcat -lv 2345 listens on port 2345 for incoming requests.
# <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]} redirects input from netcat to 
# SERVER_PROCESS (using read), and redirects output from server (using echo) to netcat. 
netcat -lv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}