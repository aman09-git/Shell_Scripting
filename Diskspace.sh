!#/bin/bash
#purpose: Checking the space
#Vesion: 1.0
#Created date: 18th Sep 2024
#Modified date:
#Authod: Aman Srivastava




# Check disk space using df -h
echo "Checking disk space usage..."
df -h

#Check the threshold
threshold=80

echo "Disk usage summary:"
df -h | awk 'NR>1 {print $5 " " $1}' | while read output;
do
  usage=$(echo $output | awk '{print $1}' | sed 's/%//')
  partition=$(echo $output | awk '{print $2}')

  if [ $usage -ge $threshold ]; then
    echo "Warning: Partition $partition is at $usage% usage."
  fi
done


#END
