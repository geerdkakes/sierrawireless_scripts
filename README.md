# sierrawireless scripts

Script to get information from the Sierra Wireless modem using the API.

To set this up:
1. create a user in the modem with the correct rights
2. change the script with the correct username and password
3. run the script.

To run the script use:
```
./monitor_sierra.sh | tee ./logoutput.txt
```

to get more frequent log output, change the timeout to a lower value.

To do: add a timestamp before all log output and record every few seconds.