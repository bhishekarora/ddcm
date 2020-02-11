
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


mkBanner "-" "100"  " Enter the target Server ip and port in the format ip:port e.g 192.168.1.15:2375 ";

mkBanner "-" "100"  " Please make sure you have enabled your remote docker daemon to accept remote connections";


read target 

echo   "Setting docker host value to target SET DOCKER_HOST=tcp://$target  ";

export  DOCKER_HOST=tcp://$target

echo " Listing remote running containers "

 docker ps -a

echo " "
echo "Please specify your container to copy data"


read remcontainer

#echo "Contents before copy"

 docker run --rm  --volumes-from $remcontainer  busybox  ls /$dir


echo  "------------Copying the files ----"



docker cp $dir  $remcontainer:/


echo "Data Copied";


#mkBanner "-" "50"  " Contents of target container after copy"
docker run --rm  --volumes-from $remcontainer busybox  ls /$dir


echo " Resetting docker host value to default"
export DOCKER_HOST=''


#mkBanner "-" "50" "MAINTAINER : Abhishek Arora / Code: git@bhishekarora"

