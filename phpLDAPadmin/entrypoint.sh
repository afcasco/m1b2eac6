#!/bin/bash
CONTAINER_FIRST_STARTUP="CONTAINER_FIRST_STARTUP"
if [ ! -e /$CONTAINER_FIRST_STARTUP ]; then
    touch /$CONTAINER_FIRST_STARTUP &&
    echo "slapd slapd/password2 password ${LDAP_PASSWORD}
    slapd slapd/password1 password ${LDAP_PASSWORD}
    slapd slapd/internal/generated_adminpw password ${LDAP_PASSWORD}
    slapd slapd/internal/adminpw password ${LDAP_PASSWORD}
    slapd slapd/unsafe_selfwrite_acl note
    slapd slapd/upgrade_slapcat_failure error
    slapd slapd/ppolicy_schema_needs_update select abort installation
    slapd slapd/purge_database boolean true
    slapd slapd/password_mismatch note
    slapd slapd/dump_database select when needed
    slapd shared/organization string ${ORGANIZATION}
    slapd slapd/invalid_config boolean true
    slapd slapd/dump_database_destdir string /var/backups/slapd-VERSION
    slapd slapd/no_configuration boolean false
    slapd slapd/move_old_database boolean true
    slapd slapd/domain string ${DOMAIN}
    " | debconf-set-selections
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure slapd &&
    service apache2 start && slapd -d -1
else
    service apache2 start && slapd -d -1
fi