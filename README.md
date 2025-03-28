
4. =======================================================================================================================================
   backup.sh    file----it will take the backup of /home/ubuntu  files or directories and create a file in tar.gz to compress the data and store it on  /home/ubuntu  same directory
   #!/bin/bash

backup_dir="/home/ubuntu"
source_dir="/home/ubuntu"
timestamp=$(date +"%Y%m%d%H%M%S")

tar -czf "$backup_dir/test_$timestamp.tar.gz" "$source_dir"

echo "✅ Backup created: $backup_dir/test_$timestamp.tar.gz"
=========================================================================================already attach the snap also of my server for better check

system health check script-===========================



    
