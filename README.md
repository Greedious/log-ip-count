# Log IP Count Script 💻

This Bash script processes a web server log file, counts the number of requests made by each IP address, and optionally outputs the top 5 IP addresses with the most requests. The result can either be displayed directly or saved to a file if an additional flag is provided.

## Requirements
- A Unix-like environment (Linux, macOS, or Windows Subsystem for Linux)


## Usage

To run the script, use the following command format:

```
bash ./log-count.sh <log-filename> [-f]
```

Parameters:
- log-filename: The path to the log file you want to analyze. The log file should have each log entry starting with an IP address followed by the rest of the log data.
- f (optional): If provided, the results will be saved to a file instead of being deleted after execution. The results will be saved in a file named result_<timestamp> where <timestamp> is the Unix timestamp at the time of execution.

## Example

```
bash ./log-count.sh access.log -f
```
This will analyze the access.log file, count the number of requests from each IP address, and save the results in a file named result_<timestamp>.

```
bash ./log-count.sh access.log
```
This will analyze the access.log file and display the top 5 IP addresses with the most requests. The result file will be deleted after the script finishes.


## Error handling: 

- If the log-filename is not provided, the script will display the following usage information: 
 ```
 USAGE: log-count <log-filename> [-f for creating file for the result]
 ```

- If the specified log file does not exist, the script will output:
```
Error: The log file '<log-filename>' does not exist
```

## Author

Abdulghani Alkouwatli.
