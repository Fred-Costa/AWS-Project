* Install and configure DNS package in your server.

> `yum -y install bind bind-utils`


> `nano /etc/named.conf`

- In "listen-on port 53" add "any;"

- In "allow-query" add "any;".

- At the end of the file before "include" add our zones. Example:

```
zone "inova.pt" IN {
        type master;
        file "db.inova.pt";
        allow-update { none; };
};

zone "0.10.in-addr.arpa" IN {
        type master;
        file "reverse.inova.pt";
        allow-update { none; };
};

``` 

> `cd /var/named/`

> `nano db.inova.pt`

```
$TTL    604800
@       IN      SOA     inova.pt. root.inova.pt. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
                IN      NS      ns
@               IN      A       10.0.100.100
ns              IN      A       10.0.100.100
control         IN      A       10.0.100.100
www             IN      CNAME   enta.pt.
central         IN      A       10.0.100.104
wazuh           IN      A       10.0.100.105
sales           IN      A       10.0.100.106
marketing       IN      A       10.0.100.107
``` 

-> `nano reverse.enta.pt`

``` 
$TTL    604800
@       IN      SOA     inova.pt. root.inova.pt. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      inova.pt.
100.100 IN      PTR     inova.pt.
100.100 IN      PTR     control.inova.pt.
102.100 IN      PTR     www.inova.pt.
``` 

* Permissions for Forward Zone

-> `chown root:named db.inova.pt`

* Permissions for Reverse Zone

-> `chown root:named reverse.inova.pt`


-> `systemctl enable --now named`


-> `systemctl restart named`
