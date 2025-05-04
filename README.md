# Docker image for E-MailRelay ([stormbl8/emailrelay](https://hub.docker.com/r/stormbl8/emailrelay))

[![Docker Pulls](https://img.shields.io/docker/pulls/stormbl8/emailrelay)](https://hub.docker.com/r/stormbl8/emailrelay)
[![GitHub tag](https://img.shields.io/github/v/tag/stormbl8/emailrelay-service)](https://github.com/stormbl8/emailrelay-service/tags)

Available Tags:

[List of all image tags](https://hub.docker.com/r/stormbl8/emailrelay/tags)

- `latest`, `v1.0`
- `v1.0`

Alpine based Docker image for E-MailRelay. You can find more on its [website](http://emailrelay.sourceforge.net).

Container configuration is done via _environment variables_ and _command line arguments_. Command line arguments are given directly to `emailrelay` executable.

To see all command line options of `emailrelay` command:

```bash
docker run --rm stormbl8/emailrelay --help --verbose
```

## Usage

Some usage examples are given in `docker-compose.yml`.

### Example Usage with for Gmail SMTP Service

Sample configuration for sending emails from your Gmail account.

Add your credentials to `emailrelay-client-auth`.

```
client plain example@gmail.com gmail-or-app-password
```

### Example Usage with for AWS SES SMTP Service

Sample configuration for sending emails from your Gmail account.

Add your credentials to `emailrelay-client-auth`.

```
client plain AWS_ACCESSKEY_ID _AWS_SECRET_ACCESSKEY_
```

## Environment Variables
adapt the following variables acording to your environment:

```bash

# Mandatory SMTP config
export SMTP_HOST=emailrelay
export SMTP_PORT=25
export SMTP_USERNAME='username' # your choice
export SMTP_PASSWORD='password' # your choice
export SMTP_SECURITY='false'

# Email relay target (e.g., AWS SES, Gmail)
export SMTP_FROM='noreply@domain.com'
export RELAY_SMTP_HOST='email-smtp.eu-central-1.amazonaws.com' # this must be identical to what your aws location(s) 
export RELAY_SMTP_PORT=587
```

## Client/Server Authentication

Inside `config` directory you will find sample files for usage with filter functionality, SMTP client authentication and relay server authentication.

For any further configuration or details, refer to the [E-MailRelay documentation](http://emailrelay.sourceforge.net).

## Testing

You can test your configuration with _swaks_.

```bash
echo "This is a test message." | swaks --to to@mail.dev --from from@mail.dev --server emailrelay --port 9025
```

Or use a container, after running the containers in `docker-compose.yml` you could run the following command to test with _swaks_ and see the test email on [localhost:8025]().

```bash
docker-compose run \
  --entrypoint /bin/sh \
  emailrelay \
  -c 'echo "This is a test message." | swaks --to <to@mail.dev> --from <from@mail.dev> --server emailrelay --port 25'
```

