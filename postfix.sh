#!/bin/bash
# Install Postfix.

# TO DO: Ask user to enter an authenticate username and password for the mailserver. collect mailname and destination from the user and feed it to preseed.txt or just let default installation of postfix server run. The user will enter all the details prompted.
 
# pre config (Need to change)
 echo "postfix postfix/main_mailer_type string Internet site" > preseed.txt; \
 echo "postfix postfix/mailname string example.com" >> preseed.txt; \
 echo "postfix postfix/destinations string ncsu.edu" >> preseed.txt;

 # load preseed,install and authentication config
 debconf-set-selections preseed.txt;
 apt-get install -y postfix sasl2-bin;
 echo "[smtp.mandrill.com]   mandrill_username:mandrill_apikey" > /etc/postfix/sasl_passwd \
 chown root:root /etc/postfix/sasl_passwd;\
 chmod 600 /etc/postfix/sasl_passwd; \
 postmap /etc/postfix/sasl_passwd; \
 /etc/init.d/postfix restart
