### ENTA - NAT 
nano /etc/iptables/rules.v4
* Internet
```
-A POSTROUTING -t nat -o eth0 -j MASQUERADE
```

* Wazuh
```
-A PREROUTING -i eth0 -p tcp -m tcp --dport 443 -j DNAT --to-destination 172.31.144.105
```

* FTP 
```
-A PREROUTING -i eth0 -p tcp -m tcp --dport 20 -j DNAT --to-destination 172.31.144.102
-A PREROUTING -i eth0 -p tcp -m tcp --dport 21 -j DNAT --to-destination 172.31.144.102
-A PREROUTING -i eth0 -p tcp -m multiport --dports 10000,10100 -j DNAT --to-destination 172.31.144.102
-A PREROUTING -i eth0 -p tcp -m tcp --dport 990 -j DNAT --to-destination 172.31.144.102
```

* HTTP & HTTPS
```
-A PREROUTING -i eth0 -p tcp -m tcp --dport 990 -j DNAT --to-destination 172.31.144.102
```
