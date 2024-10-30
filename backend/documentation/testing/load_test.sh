#!/bin/bash
# to run : 
# 1) chmod +x load_test.sh
# 2) ./load_test.sh

# Define the API endpoint URL
URL="http://localhost:3000/api/clients"  # Change to your API's endpoint

# Define the total number of requests to send
NUM_REQUESTS=1000  # Total requests to send

# Set the maximum number of concurrent requests
MAX_CONCURRENT_REQUESTS=50  # Adjust this number based on your system's capacity

# Create a log file to store response statuses
LOG_FILE="api_load_test.log"

# Function to log the current date and status message
log_status() {
    echo " $1" >> "$LOG_FILE"
}

# Clear the log file at the start
echo "Starting API load test..." > "$LOG_FILE"

# Send requests in parallel, limiting concurrency
for ((i=1; i<=NUM_REQUESTS; i++)); do
    # Send a request and capture the HTTP status code
    {
        HTTP_RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
        log_status "Request #$i: HTTP Status $HTTP_RESPONSE"
    } &
    
    # Limit the number of concurrent requests
    if (( i % MAX_CONCURRENT_REQUESTS == 0 )); then
        wait  # Wait for all background jobs to finish
    fi
done

# Wait for any remaining background processes to finish
wait

# Log completion message
log_status "Sent $NUM_REQUESTS requests."
echo "Load test completed. Check $LOG_FILE for details."
