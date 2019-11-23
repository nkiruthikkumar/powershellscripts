
#Get yesterday's Day of Week
vDOW=$(date --date="yesterday" +"%A")

vFileName="plex_${vDOW}.tar"
echo $vFileName
RemoteFilePath="/mnt/nfs/DNS323/bak/plexlib/$vFileName"


# Stop PlexMediaServer
echo -e  "\nStopping Plex Media Server"
sudo service plexmediaserver stop


# Start zipping /Library folder
echo -e "\n Starting zip "

tarStatus="$(tar cfP /var/lib/plexmediaserver/$vFileName /var/lib/plexmediaserver/Library 2>&1)"


# Start PlexMediaServer again
echo -e "\n Starting Plex Media Server"
sudo service plexmediaserver start


if [ -z "$tarStatus" ]
then	
      	echo "tar operation success..."
	file_size_mb=`du -m "/var/lib/plexmediaserver/$vFileName" | cut -f1`  
	successEmailBody="Backup file size : ${file_size_mb}MB"

	scpStatus="$(scp /var/lib/plexmediaserver/$vFileName $RemoteFilePath  2>&1)"

	if [ -z "$scpStatus" ]
		then
      			echo "scp operation success..."
			printf "To: mail@kiruthik.com\nFrom: dontreply@kiruthik.com\nSubject: Plex-Pi daily backup success\n\nHello!! \n\n $successEmailBody " | msmtp mail@kiruthik.com
		else
      			echo "scp operation failed..."
			echo "$scpStatus"
			printf "To: mail@kiruthik.com\nFrom: dontreply@kiruthik.com\nSubject: Plex-Pi daily backup failed\n\nHello!! \n\n scp failed with error...\n\n$scpStatus " | msmtp mail@kiruthik.com
	fi


else
	echo "tar operation failed..."
	echo "$tarStatus"
	printf "To: mail@kiruthik.com\nFrom: dontreply@kiruthik.com\nSubject: Plex-Pi daily backup failed\n\nHello!! \n\n tar failed with error...\n\n$tarStatus " | msmtp mail@kiruthik.com
fi

cd /var/lib/plexmediaserver
rm -f $vFileName







