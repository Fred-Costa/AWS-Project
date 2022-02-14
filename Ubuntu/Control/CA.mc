# Install and configure EasyRSA package in your server.

* Instal the Easy-rsa 
->  `apt install easy-rsa -y `


-> cd /etc/ && cp -r /usr/share/easy-rsa/ .


-> cd easy-rsa/


-> ./easyrsa init-pki


-> ./easyrsa build-ca


#Now you can type ./easyrsa and you will have a bunch of available commands.
#I'm going to demonstrate an example of building a VPN Server Certificate.


-> ./easyrsa build-server-full vpn.inova.pt nopass


#You can find the certificate in: /etc/easy-rsa/pki/issued
#As well as the private key in: /etc/easy-rsa/pki/private

#Note: Some packages besides needing the certificate and the key, they also need your "ca.crt" in order to prove that you are a legit signing company.
