
# Simple alias which looking for last modified file with log extensin, and print last 5 lines for all
 alias logwatch='watch '\''find . -type f -mmin -5 -name "*.*log" -exec echo "-------------------------> {} <-------------------------" \; -exec tail -5 {} 2>/dev/null \; '\'''

# Clean all .log files in /log directories
 find /log -type f| grep .log$ | while read file; do :> $file; done

# Kill all process with name XYZ
 p s -aux | grep XYZ | perl -lane 'print $F[1]' | while read proc; do kill -9 $proc; done

# Clean all deleted files holded in memory
 lsof -nP | grep '(deleted)' |  perl -lane 'print $F[1]' | while read dir; do cd /proc/$dir/fd/; ls -l | grep '(deleted)' | perl -lane 'print $F[8]' |  while read file; do :> /proc/$dir/fd/$file; done done

# Quick share dir/filse via web browser
python3 -m http.server 8888

# Run sudo for last command
 sudo !!

# Replace text in file (in two ways)
 sed -i 's#ORIGINAL_VALLUE#NEW_VALUE#g' file1 file2
 perl -p -i -e 's#ORIGINAL#NEW_VALUE#' file1 file2
 
# Monitor RAM memory usage inlive
 watch -n 5 -d '/bin/free -m'

# Encrypted text file
 vim -x file.txt