#!/bin/bash

# Goals:
# - Determine the requested resource
#   - If the requested file does not exist, return a 404 Not Found error
# - Otherwise, get the HTML of the requested file and include it in the response body.
# 1) Test if the requested file (path) exists.
# 2) If the file exists, return the string HTTP/1.1 200 OK, followed by a blank line,
#    followed by the contents of the requested file.
# 3) If the file does not exist, output the string HTTP/1.1 404 Not Found.



function server () {
  while true
  do
    read method path version

    if [[ $method = 'GET' ]]
    then
      file_path=./www$path
      if [[ -f $file_path ]]
      then
        echo -ne "HTTP/1.1 200 OK\r\n\r\n"
        cat $file_path
      else
        echo -ne "HTTP/1.1 404 Not Found\r\n\r\n"
      fi
    else
      echo -ne "HTTP/1.1 400 Bad Request\r\n\r\n"
    fi
  done
}

# Allow server and netcat to run concurrently.
coproc SERVER_PROCESS { server; }

# Listen on port 2345 for incoming requests.
# Redirect input from netcat -> SERVER_PROCESS. 
# Redirect output from server -> netcat.
netcat -lv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}

# On echo -n, -e, and \r\n:
# By default, echo appends a newline (\n) to the end of its output. However, newlines
#   can be inconsistently interpreted; therefore, the carriage return (\r) is used
#   to reset the position of the cursor to the start of the line, ensuring consistent
#   processing by HTTP interpreters.
# echo -n is used to suppress the default newline.
# echo -e is used to enable intepretation of additional whitespace characters (\r\n)

# The empty newline is necessary to indicate the end of the headers and the start
#   of the body.
# ie. 
# headers... 
# 
# body...