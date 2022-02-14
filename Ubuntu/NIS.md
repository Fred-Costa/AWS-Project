# Ubuntu-NIS
### Basics Configurations NIS in Ubuntu

************
* SERVIDOR 
************


◽ Start to updating and upgrading your server

  ▶️ `apt update && apt upgrade -y`
  
◽ Changing Hosts

  ▶️ `nano /etc/hosts` ▶️ `(IP SERVER)` `(Hostname@Domain)` `(Hostname)` `(Domain)`
  
◽ Install NIS

  ▶️ `apt install nis -y`
  
◽ Defining your server is NIS Master

  ▶️ `nano /etc/default/nis` 
  ▶️ Chaging NISSERVER = false to `NISSERVER = master` 
  
  
◽ Now, open the `/etc/ypserv.securenets` and adding your Subnet allowed in the NIS Server

  ▶️ EX: `172.31.0.0          255.255.0.0`
  
◽ Changing `nano /var/yp/Makefile`: 

  ▶️ "MERGE_PASSWD=false" for `MERGE_PASSWD=true` (LINE 52)
  
  ▶️ "MERGE_GROUP=false" for `MERGE_GROUP=true` (LINE 56)
  
************
* CLIENT 
************


◽ Install NIS

  ▶️ `apt install nis -y`

◽ Defining Hosts

  ▶️ `nano /etc/hosts` ▶️ `(IP SERVER)` `(Hostname@Domain)` `(Hostname)` `(Domain)`
  
◽ Configurating whitch is the server in `/etc/yp.conf`

  ▶️ Adding `ypserver server.enta.pt server enta.pt`
  
◽ Go to `/etc/nsswitch.conf` and adding `nis` in the end:

  ▶️ `passwd`, `group`, `shadow`, `hosts`
  
◽ Next go to `/etc/pam.d/common-session` and add in the end:
  
  ▶️ `session optional        pam_mkhomedir.so skel=/etc/skel umask=077` 
  
◽ Lastly restart NIS:
  
  ▶️ `systemctl restart nis` 
  
  
************
* SERVIDOR 
************


◽ Now, initialize the NIS server database with the following command:
  
  ▶️ `/usr/lib/yp/ypinit -m`  
  
  ▶️ `press <Ctrl> + D` + ▶️ To confirm, press `Y` and then press `<Enter>`
  
  
◽ For the end, create users and do this command to update users:
  
  ▶️ `cd /var/yp && make` 

