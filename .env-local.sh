#!/bin/sh

## Standard docker-compose files to use (these must be exactly the same as in '.env')
export COMPOSE_FILE=docker-compose.yml 
## Additional docker-compose file for 'emailrelay'
#export COMPOSE_FILE=$COMPOSE_FILE:docker-compose.yml

########################################################################################
##### Mandatory configuration
########################################################################################

### Mail configuration
export SMTP_HOST=emailrelay
export SMTP_PORT=25
## authenticating user
export SMTP_USERNAME='emailrelay'
export SMTP_PASSWORD='3m81lr3l8y'

## Enable STARTTLS for email connection.
export SMTP_SECURITY='false'

### Emailrelay for SMTP server 
### check also correspding authentication in 'emailrelay_client_auth.example'
export SMTP_FROM='noreply@domain.com'
export RELAY_SMTP_HOST='email-smtp.eu-central-1.amazonaws.com' # You can use AWS SES , gmail or etc
# Emailrelay configuration (common ports)
export RELAY_SMTP_PORT=587
# check

#### Check completeness of environment
########################################################################################
if [ -n "$(docker-compose config -q 2>&1)" ]; then
    echo "There are some problems with the configuration, please check output below"
    echo
    docker-compose config -q
    if [ "$CALL_FROM_INSTALLER_SH" = "true" ]; then
        exit 1
    fi
else
    echo "The configuration looks OK! No variables are missing."
fi

#EOF