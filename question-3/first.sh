#!/bin/bash

# Replace <nginx-endpoint> with your actual Nginx endpoint (IP or hostname)
NGX_ENDPOINT="http://192.168.49.2/v2"

# Loop to send 6 requests
for i in {1..15}; do
  echo "Sending request #$i"
  curl -H "X-Client-Id: my-client-id" "$NGX_ENDPOINT"
  echo -e "\n---\n"  # Print a separator between requests
done
