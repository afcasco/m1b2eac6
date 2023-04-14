# m1b2eac6
<img src="https://www.informatiweb-pro.net/images/logiciels-linux/logiciels/icones/phpldapadmin.jpg"/>
<img src="https://daasi.de/wp-content/uploads/2017/07/OpenLDAP_Logo.png.pagespeed.ce.4pCPKkLfLd.png"/> 
<h2>Run OpenLDAP and phpLDAPadmin</h2>


Includes openldap and phpLDAPadmin installed and running on port 80.

phpLDAPadmin cloned from this repo: https://github.com/breisig/phpLDAPadmin

patched for openssl 3.0 (Anonymous login bug).

<hr>

<h3>To run it use:</h3>

 <code>docker run -it -p 80:80 -e LDAP_PASSWORD=yourpassword -e ORGANIZATION=yourorg -e DOMAIN=your.org.com afcasco/m1b2eac6</code>

<b>ENV VARIABLES:</b>

LDAP_PASSWORD: your ldap admin password

ORGANIZATION: your organization name

DOMAIN: your domain

<h3>Login into phpLDAPadmin</h3>

Go to: localhost/phpldapadmin


