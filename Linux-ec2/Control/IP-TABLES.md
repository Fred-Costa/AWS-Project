* Install ip-tables 

> `yum install iptables-services -y`

* Active the iptables

> `systemctl enable --now iptables`

* Flush on iptables

> `iptables -F` 

> `iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && service iptables save`

* Net Forwarding

> `nano /etc/sysctl.d/99-sysctl.conf && sysctl -p`

** Add this line: `net.ipv4.ip_forward = 1`


* Redirect any incoming traffic on port 80 or 443 into your server IP to another machine in the same network.

> `iptables -t nat -A PREROUTING -i eth0 -p tcp -m multiport --dport 80,443 -j DNAT --to-destination 10.0.100.102`
