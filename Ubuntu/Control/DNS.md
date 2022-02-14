### DNS 

* Install bind9
```
apt install bind9 bind9-utils -y
```

* Configure the Forward Zone 
```
cd /var/lib/bind/
```

```
nano forwardZone.enta.pt
```

```
$TTL    604800
@       IN      SOA     enta.pt. root.enta.pt. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
                IN      NS      ns
@               IN      A       172.31.144.100
ns              IN      A       172.31.144.100
control         IN      A       172.31.144.100
teleport        IN      A       172.31.144.100
*.teleport      IN      A       172.31.144.100
www             IN      CNAME   enta.pt.
central         IN      A       172.31.144.104
wazuh           IN      A       172.31.144.105
sales           IN      A       172.31.144.106
marketing       IN      A       172.31.144.107
```

* Configure the Reverse Zone

```
nano reverseZone.enta.pt
```

```
$TTL    604800
@       IN      SOA     enta.pt. root.enta.pt. (
                              1         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      enta.pt.
100.100 IN      PTR     enta.pt.
100.144 IN      PTR     control.enta.pt.
100.144 IN      PTR     teleport.enta.pt.
102.144 IN      PTR     www.enta.pt.
104.144 IN      PTR     central.enta.pt.
105.144 IN      PTR     wazuh.enta.pt.
106.144 IN      PTR     sales.enta.pt.
107.144 IN      PTR     marketing.enta.pt.
```

* Uncomment the forwarders and put 8.8.8.8

```
cd /etc/bind
```
```
nano named.conf.options
```
```
forwarders  {
      8.8.8.8;
};
```

* Configure your zones

```
nano named.conf.local
```
```
zone "enta.pt" {
        type master;
        file "/etc/bind/forwardZone.enta.pt";
};

zone "31.172.in-addr.arpa" {
        type master;
        file "/etc/bind/reverseZone.enta.pt";
};
```

* Restart and Status your bind9

```
systemctl restart bind9 && systemctl status bind9
```

* Update your control server for use your own DNS 

```
nano /etc/netplan/50-cloud-init.yaml
```

```
dhcp4-overrides:
    route-metric: 100
    use-dns: false
nameservers:
    search: [enta.pt]
    addresses: [172.31.144.100]
```

* Confirm and update your network

```
netplan try && netplan apply
```
