#!/bin/bash

backup_dir="/home/ubuntu"
source_dir="/home/ubuntu"
timestamp=$(date +"%Y%m%d%H%M%S")

tar -czf "$backup_dir/test_$timestamp.tar.gz" "$source_dir"

echo "✅ Backup created: $backup_dir/test_$timestamp.tar.gz"