#!/bin/bash

# count=5

# echo "starting countdown..."

# while [ $count -gt 0 ]
# do 
#     echo "Time left: $count"
#     sleep 1
#     count=$((count -1))
# done

# echo "Times up!"

while IFS= read -r line; do
    echo "processing line: $line"
done < 20-script-1.sh    


