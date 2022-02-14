# Install and configure vsftpd package in your server.

-> `apt install vsftpd -y`

* In FTP Configuration (implicit) `nano /etc/vsftpd.conf` 

-> Add your certificates and change ssl_enable to yes: 

``` 
rsa_cert_file=/etc/ssl/certs/yourcrt.crt
rsa_private_key_file=/etc/ssl/private/yourkey.key
ssl_enable=YES
```
-> Add the following lines:
``` 
pasv_enable=YES
pasv_min_port=10000 
pasv_max_port=10100

allow_anon_ssl=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
require_ssl_reuse=NO
ssl_ciphers=HIGH

implicit_ssl=YES
listen_port=990
``` 
* Restart the FTP server 

-> `systemctl restart vsftpd.service`
