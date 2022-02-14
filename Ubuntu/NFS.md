# Ubuntu - NFS
### Basics Configurations NFS in Ubuntu 

************
* SERVIDOR 
************

◽ Start to updating and upgrading your machine 

  ▶️ `apt update && apt upgrade -y`
  
◽ Install NFS  

  ▶️ `apt install nfs-kernel-server -y`
  
◽ Changing Hosts

  ▶️ `nano /etc/hosts`
  ▶️ `(IP SERVER)` `(Hostname@Domain)` `(Hostname)` `(Domain)` 
  
◽ Need a paste for where you will export export your files! "homes" its a paste where I created in /var

  ▶️ `nano /etc/exports`
  ▶️ `/mnt/raid5_homes *(rw,sync,no_subtree_check,no_root_squash)` 


◽ This command is used to export the files indicated in /etc/exports
  
  ▶️ `exportfs -a`
  
◽ Restart NFS Server 

  ▶️ `systemctl restart nfs-kernel-server`
  
  
  
***********
* CLIENTE 
***********

◽ Start to updating and upgrading your machine

  ▶️ `apt update && apt upgrade -y`
  
◽ Install NFS
  
  ▶️ `apt install nfs-common -y`
  
◽ Create the name of the folder you created on the server in the same directory 

  ▶️ `mkdir /var/homes`
  
◽  Mount the two folders created 

  ▶️ `mount -t nfs [IPserver]:/mnt/raid5_homes /mnt/raid5_homes`
  
◽  Copy the last line in `/etc/mtab` and copy inside `/etc/fstab` adding on final `nofail`
