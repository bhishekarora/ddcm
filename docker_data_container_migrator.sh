


#/bin/bash

# Banner construction details 
function mkBanner() {
  mkBorder $1 $2
  echo -e " $3"
  mkBorder $1 $2
}

function mkBorder() {
  for i in $(eval echo {1..$2}); do
    printf $1
  done
  echo ""
} 




mkBanner "-" "50" "Docker Data Container Directory  Migrator "


echo " Enter Source container Name or ID"
echo " "
read id
echo " "

echo  "You entered $id"

echo " "

mkBanner "-" "50"  "Checking volumes for $id"
echo " "

volume=`sudo docker container inspect $id  |grep Destination`

echo   "Volume found for $id"

echo "$volume"



echo " "
echo   " Specify  Directory from Destination column above  without forward slash  e.g mydir if Destination  is /mydir "



echo " "

read dir 

	 if [ ! -d $(pwd)/dvmbackup ]; then
                echo "Temp bkup dir not found , creating one ";
		echo " "
                mkdir dvmbackup  2>>/dev/null
         else
	    echo " Temp bkup dir found, reusing ";
	    echo " "
         fi


loc=`sudo docker run --rm --volumes-from $id -v $(pwd)/dvmbackup:/backup busybox tar -cvf /backup/backup_$id_$dir.tar /$dir 2>>/dev/null`


	  if [ ! -f $(pwd)/dvmbackup/backup_$id_$dir.tar ]; then
                echo "There was a problem ";
		echo " "
          else
            echo "Backup created";
 	    echo " "
          fi

mkBanner "-" "50"  " Enter the target Container Name or ID ";
read target 

mkBanner "-" "50"  " Contents of target Container before copy ";


sudo docker run --rm  --volumes-from $target busybox  ls /$dir


echo  "------------Copying the files ----"


sudo docker run --rm --volumes-from $target -v $(pwd)/dvmbackup/:/backups  busybox    tar xvf /backups/backup_$id_$dir.tar

echo "Data Copied";
mkBanner "-" "50"  " Contents of target container after copy"
sudo docker run --rm  --volumes-from targetdatacontainer busybox  ls /$dir



mkBanner "-" "50" "MAINTAINER : Abhishek Arora / Code: git@bhishekarora"
