# Install and configure Apache2 package in your server.

-> ` apt install apache2 -y `

* Enable ssl for apache2 configuration
-> `a2enmod ssl`


* Enable the site default 
-> `a2ensite default-ssl.conf`

-> `systemctl restart apache2`


* Configure the "HTTPS" site

-> `nano /etc/apache2/sites-available/default-ssl.conf` 

-> In the `DocumentRoot` change for `htmls` - Change the certificates too! 


-> `cd /var/www/`

-> `cp -r html/ htmls`

-> `cd html/`

* Changing the HTTP (port 80)
* 
-> `cd html/`

-> `nano index.html`

* Changing the HTTPS (8443) 
* 
-> `cd htmls/`

-> `nano index.html`

* For changing the port of HTTPS, go to `nano /etc/apache2/sites-available/default-ssl.conf`

-> Change `<VirtualHost _default_:8443>` for the port you want, in my case i choice 8443

* Restart the Apache2

-> `systemctl restart apache2`
