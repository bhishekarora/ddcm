# ddcm
Docker data container migrator 

Data container 1 
docker create -v /data --name sourcedatacontainer busybox true

Data container 2 
docker create -v /data --name targetdatacontainer busybox true


Migrate data between them 

clone the repo
git clone 
cd ddcm
chmod +x
./docker_data_container_migrator 

Follow the wizard..

=====================


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

