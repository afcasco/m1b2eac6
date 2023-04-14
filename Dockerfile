FROM ubuntu:20.04
ARG LDAP_PASSWORD
ARG ORGANIZATION
ARG DOMAIN
COPY ./phpLDAPadmin/ /var/www/html/phpldapadmin
RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get -yq install slapd php7.4 ldap-utils php-xml php-ldap nano
EXPOSE 80 389
ENTRYPOINT ["/var/www/html/phpldapadmin/entrypoint.sh"]