git clone this to your pi os. then run the docker installer and portainer installer.  
if permission denied, try doing chmod u+x example.sh

cd to the path/directory where the 2 scripts are installed.  

if i put my 2 scripts inside a folder called dockerportainer in my desktop, itll be something like this  
for example:  
```
cd Desktop/dockerportainer
```

Give them permission:  
```
sudo chmod +x Pi_DockerInstaller.sh
```  
```
sudo chmod +x Pi_PortainerInstaller.sh
```

Run the scripts:  
```
sudo ./Pi_DockerInstaller.sh
```
Restart
```
sudo reboot
```
```
cd Desktop/dockerportainer
```
```
sudo ./Pi_PortainerInstaller.sh
``` 


this script puts portainer on port 9000. static ip followed by port  
example:  
```
xxx.xxx.xxx.xxx:9000
```
