# Install and configure EasyRSA package in your server.

* Instal the Easy-rsa 

-> `apt install easy-rsa -y`

-> `cd /etc/`

-> `cp -r /usr/share/easy-rsa/ .`

-> `cd easy-rsa/`

* Create a paste where certificates and ca will be
-> `./easyrsa init-pki`

* Create a Subordinate Certfificate Authority
-> `./easyrsa build-ca subca`

### Now you can type ./easyrsa and you will have a bunch of available commands.

### I'm going to demonstrate an example of building a VPN Server Certificate.

-> `./easyrsa build-server-full vpn.inova.pt nopass`

### Certificates stay here: `/etc/easy-rsa/pki/issued`
### Private keys stay here: `/etc/easy-rsa/pki/private`
