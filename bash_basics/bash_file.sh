#!/bin/bash

echo 'Commands are just regular files with the executable permission.'
echo 'bash files have the .sh extension.'
echo 'To run a bash file, you can pass it to the bash command in the terminal.'
echo 'eg. bash bash_file.sh'

echo ''

echo 'Alternatively, you can omit the preceding bash command by specifying the
program that should be used to execute the file, in the file itself.'
echo 'On Line 1, add the following line: #!/bin/bash'
echo 'This will tell the terminal to use the program at /bin/bash to run the 
given bash file.'

echo ''

echo 'Next, if you run bash_file.sh, it will fail, because the terminal interprets
it as a command, rather than a file.'
echo 'We can fix this by prepending a ./ (indicating the current directory) to the 
file name, specifying it as a file.'

echo ''

echo 'This should raise an error: -bash: ./bash_file.sh: Permission denied.'
echo 'This is because the file does not have the executable permission.'
echo 'To fix this, run the chmod command and add the executable permission (+x) to
the bash_file.sh file.'
echo 'eg. chmod +x bash_file.sh'

echo ''

echo 'This should allow us to run ./bash_file.sh in the terminal.'