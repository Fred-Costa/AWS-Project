```
yum install -y httpd
```

```
yum install -y mod_ssl
```

```
cd /var/www/
```

```
cp -r html/ htmls
```

```
nano html/index.html
```

```
nano htmls/index.html
```

```
nano /etc/httpd/conf.d/ssl.conf
```
* line 59, uncomment
* line 59, change to `/var/www/htmls`
* line 75, change to `SSLProtocol -All +TLSv1 +TLSv1.1 +TLSv1.2`
* line 100, change to `SSLCertificateFile /etc/pki/tls/certs/www.inova.pt.crt`
* line 107, change to `SSLCertificateFile /etc/pki/tls/private/www.inova.pt.key`
* line 122, change to `SSLCertificateFile /etc/pki/tls/certs/ca_inova.crt`
 
```
systemctl enable --now httpd
```

```
systemctl status httpd
```
