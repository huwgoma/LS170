#!/bin/bash

# Goals:
# - Add some HTTP Headers to the response message.

# Where does the response end?
# Content-Length header: Defines the size of the message body (data payload),
# in bytes.
# - For 400 and 404, Content-Length = 0

# How is the response data formatted?
# Content-Type header: Indicates the media type of the response data.
# - For 200: Content-Type = text/html;charset=utf-8

# 1) Add a Content-Type header to the 200 response (=text/html; charset=utf-8)
#  - This should be on its own line.
# 2) Add a Content-Length header for all 3 responses (200, 404, 400). 
#  - This should be on its own line.
#  - Length is measured in bytes.
#  - 404/400: = 0
#  - 200: The actual length of the content (HTML) we are sending.
#  - Use wc -c to measure the number of bytes in the file


function server () {
  while true
  do
    # Parse Request 
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
      file_path=./www$path

      if [[ -f $file_path ]]
      then
        echo -ne "HTTP/1.1 200 OK\r\n"
        echo -ne "Content-Type: text/html; charset=utf-8\r\n"
        echo -ne "Content-Length: `wc -c < $file_path`\r\n"
        echo -ne "\r\n"
        cat $file_path
      else
        echo -ne "HTTP/1.1 404 Not Found\r\n\r\n"
        echo -ne "Content-Length: 0\r\n\r\n"
      fi
    else
      echo -ne "HTTP/1.1 400 Bad Request\r\n\r\n"
      echo -ne "Content-Length: 0\r\n\r\n"
    fi
  done
}

coproc SERVER_PROCESS { server; }
netcat -klv 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}