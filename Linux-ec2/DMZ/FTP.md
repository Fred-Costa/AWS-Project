```
yum -y install vsftpd
```
```
nano /etc/vsftpd/vsftpd.conf
```
* line 12, change to `anonymous_enable=NO`
* line 114, change to `listen=YES`
* line 123, change to `listen_ipv6=NO`
* add to the bottom `use_localtime=YES`
* add to the bottom
```
pasv_enable=YES
pasv_min_port=10100
pasv_max_port=10200
```
```
ssl_enable=yes
rsa_cert_file=/etc/pki/tls/certs/ftp.enta.pt.crt
rsa_private_key_file=/etc/pki/tls/private/ftp.enta.pt.key
```
```
ssl_ciphers=HIGH
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO
force_local_data_ssl=YES
force_local_logins_ssl=YES
```
```
systemtctl enable --now vsftpd
```
