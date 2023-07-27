#!/bin/bash

# Variables
filename_excel="daily_market_price.xlsx"
source_dir="/local/data/market"
target_dir="/options=metadata/c/TugasKalbe/data1"  # Refer to the Question Number 1 Path

# Check if the directory exists in the target path
if [ -d "$target_dir" ]; then
    # Copy the file from source directory to target directory
    cp "$source_dir/$filename_excel" "$target_dir"

    # Create a log file with "File Moved Successfully" content
    log_file="$target_dir/log_file.txt"
    echo "File Moved Successfully" > "$log_file"
else
    echo "Target Directory Not Exists!"
fi

