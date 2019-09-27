vDateTime=$(date +"%Y%m%d-%I_%M_%S%p")
vFileName="plex_${vDateTime}.tar"
echo $vFileName
vFilePath="/mnt/sda2/bak/plexlib/$vFileName"
echo $vFilePath
tarStatus="$(tar cfP /var/lib/plexmediaserver/$vFileName /var/lib/plexmediaserver/Library 2>&1)"

if [ -z "$tarStatus" ]
then	
      	echo "tar operation success..."
	file_size_mb=`du -m "/var/lib/plexmediaserver/$vFileName" | cut -f1`  
	successEmailBody="Backup file size : ${file_size_mb}MB"

	scpStatus="$(scp /var/lib/plexmediaserver/$vFileName kk@10.82.88.141:/mnt/sda2/bak/plexlib/. 2>&1)"

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

rm -f /var/lib/plexmediaserver/*.tar











