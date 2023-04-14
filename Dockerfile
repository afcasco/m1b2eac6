FROM ubuntu:20.04
ARG LDAP_PASSWORD
ARG ORGANIZATION
ARG DOMAIN
COPY ./phpLDAPadmin/ /var/www/html/phpldapadmin
#COPY reconfigure-slapd.sh .
COPY ./entrypoint.sh entrypoint.sh
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt-get -yq install slapd php7.4 ldap-utils php-xml php-ldap nano
#RUN ./reconfigure-slapd.sh
EXPOSE 80 389
#ENTRYPOINT ["/bin/sh", "-c" , "service apache2 start && slapd -d -1"]
ENTRYPOINT ["./entrypoint.sh"]