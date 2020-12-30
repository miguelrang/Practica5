hostname=`hostname -i`
hostname=`nmap $hostname`

ifconfig=`curl ifconfig.me`
ifconfig=`nmap $ifconfig`

echo "$hostname \n $ifconfig" > file2.txt

base64 file2.txt > file.txt

rm file2.txt