- `apt -y install postfix postfix-doc dovecot-imapd dovecot-pop3d sasl2-bin`
> 2 

> enta.pt

- `dpkg-reconfigure postfix`
> 2

> enta.pt

> ubuntu

> dont change

> no

> delete all

> 0

> (+)

> ipv4

- `nano /etc/postfix/main.cf` 

* Change Certificates

> smtpd_tls_cert_file=/etc/ssl/certs/YOURCERT.crt
> smtpd_tls_key_file=/etc/ssl/private/YOURCERTkey 

- `nano /etc/postfix/master.cf` 

* Uncomment 1º Group

> submission inet n       -       y       -       -       smtpd
> -o syslog_name=postfix/submission
> -o smtpd_tls_security_level=encrypt
> -o smtpd_tls_security_level=encrypt

* Add below -o smtpd_sasl
 
> -o smtpd_client_restrictions=permit_sasl_authenticated,reject

* Uncomment 2º Group

> smtps     inet  n       -       y       -       -       smtpd
> -o syslog_name=postfix/smtps
> -o smtpd_tls_wrappermode=yes
> -o smtpd_sasl_auth_enable=yes

* ADD
* 
> -o smtpd_client_restrictions=permit_sasl_authenticated,reject

- `nano /etc/postfix/sasl/smtpd.conf` 

* Add 

> pwcheck_method: saslauthd
> mech_list: PLAIN LOGIN

- `nano /etc/default/saslauthd` 

* Change 

> START=yes
> OPTIONS="-c -m /var/spool/postfix/var/run/saslauthd"

- `postconf -e 'home_mailbox = Maildir/'` 

- `nano /etc/dovecot/conf.d/10-auth.conf` 

* Uncomment and change

> disable_plaintext_auth = no

- `disable_plaintext_auth = no` 

* Uncomment 

> mail_location = maildir:~/Maildir

* Comment 

> #mail_location = mbox:~/mail:INBOX=/var/mail/%u

- `nano /etc/dovecot/conf.d/10-ssl.conf`

> ssl = yes

* Uncomment and change 

> ssl_cert = </etc/ssl/certs/YOURCERTIFICATE.crt
> ssl_key = </etc/ssl/private/YOURCERTIFICATE.key

* When 1 user is created, its created automaticaly the paste maildir

> cd /etc/skel/

> maildirmake.dovecot Maildir

* Out of the root

- `adduser postfix sasl`

- `adduser dovecot sasl`

* Restart all services 

- `systemctl restart saslauthd.service postfix dovecot`

* Confirm with the command: 

- `ss -tulp | grep dovecot`

-  `ss -tulp | grep master`

