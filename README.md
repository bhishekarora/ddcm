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



Sample run 

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



END
+++++++++++++++++++++++



How to enable remote daemon support on docker 

# These commands get run inside of your VM.

# Create the directory to store the configuration file.
sudo mkdir -p /etc/systemd/system/docker.service.d

# Create a new file to store the daemon options.
sudo nano /etc/systemd/system/docker.service.d/options.conf

# Now make it look like this and save the file when you're done:
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H unix:// -H tcp://0.0.0.0:2375

# Reload the systemd daemon.
sudo systemctl daemon-reload

# Restart Docker.
sudo systemctl restart docker

