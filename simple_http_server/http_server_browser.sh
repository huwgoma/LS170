#!/bin/bash

# Goals:
# Right now, request messages are just one line (eg. GET /lion.html HTTP/1.1)
# However, browser requests are typically multi-line, with a number of headers 
#   following the request line.
#   eg. GET /lion.html HTTP/1.1
#       Host: localhost:2345 [...]
# - To fix this, we need to read ALL lines, until the end of the message (signified
#   by an empty line), then process the entire thing as one request.

function server () {
  while true
  do
    # Parse request 
    message_arr=()
    check=true
    while $check
    do
      read line
      message_arr+=($line)
      if [[ "${#line}" -eq 1 ]]
      then
        check=false
      fi
    done
    method=${message_arr[0]}
    path=${message_arr[1]}

    # Generate response
    if [[ $method = 'GET' ]]
    then
      if [[ -f ./www$path ]]
      then
        echo -ne "HTTP/1.1 200 OK\r\n\r\n"
        cat ./www$path
      else
        echo -ne "HTTP/1.1 404 Not Found\r\n\r\n"
      fi
    else
      echo -ne "HTTP/1.1 400 Bad Request\r\n\r\n"
    fi
  done
}

coproc SERVER_PROCESS { server; }
netcat -lv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}