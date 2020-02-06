# ddcm
Docker data container migrator 

Data container 1 
docker create -v /data --name sourcedatacontainer busybox true

Data container 2 
docker create -v /data --name targetdatacontainer busybox true


Migrate data between them 

clone the repo
git clone 
cd 
chmod +x 

will ask for sudo if doing with a normal user.
Follow the instructions


==============================
Sample run 
==================
--------------------------------------------------
 Docker Data Container Directory  Migrator 
--------------------------------------------------
 Enter Source container Name or ID
 
sourcedatacontainer
 
You entered sourcedatacontainer
 
--------------------------------------------------
 Checking volumes for sourcedatacontainer
--------------------------------------------------
 
[sudo] password for mike: 
Volume found for sourcedatacontainer
                "Destination": "/data",
 
 Specify  Directory from Destination column above  without forward slash  e.g mydir if Destination  is /mydir 
 
data
Temp bkup dir not found , creating one 
 
Backup created
 
--------------------------------------------------
  Enter the target Container Name or ID 
--------------------------------------------------
targetdatacontainer
--------------------------------------------------
  Contents of target Container before copy 
--------------------------------------------------
mongodata
------------Copying the files ----
data/
data/mongodata
Data Copied
--------------------------------------------------
  Contents of target container after copy
--------------------------------------------------
mongodata
--------------------------------------------------
 MAINTAINER : Abhishek Arora / Code: git@bhishekarora
--------------------------------------------------





