# smartshoppingsystem

[![Build Status](https://travis-ci.org/ngoclt/smartshoppingsystem.svg?branch=master)](https://travis-ci.org/ngoclt/smartshoppingsystem)
[![Built with](https://img.shields.io/badge/Built_with-Cookiecutter_Django_Rest-F7B633.svg)](https://github.com/agconti/cookiecutter-django-rest)

A better solution to interact with shopper. Check out the project's [documentation](http://ngoclt.github.io/smartshoppingsystem/).

# Prerequisites

- [Docker](https://docs.docker.com/docker-for-mac/install/)  
- [Travis CLI](http://blog.travis-ci.com/2013-01-14-new-client/)
- [Heroku Toolbelt](https://toolbelt.heroku.com/)

# Local Development

Start the dev server for local development:
```bash
docker-compose up
```

Run a command inside the docker container:

```bash
docker-compose run --rm web [command]
```

# Continuous Deployment

Deployment is automated via Travis. When builds pass on the master or qa branch, Travis will deploy that branch to Heroku. Follow these steps to enable this feature.

Initialize the production server:

```
heroku create SmartShoppingSystem-prod --remote prod && \
    heroku addons:create newrelic:wayne --app SmartShoppingSystem-prod && \
    heroku addons:create heroku-postgresql:hobby-dev --app SmartShoppingSystem-prod && \
    heroku config:set DJANGO_SECRET_KEY=`openssl rand -base64 32` \
        DJANGO_AWS_ACCESS_KEY_ID="Add your id" \
        DJANGO_AWS_SECRET_ACCESS_KEY="Add your key" \
        DJANGO_AWS_STORAGE_BUCKET_NAME="SmartShoppingSystem-prod" \
        DJANGO_CONFIGURATION="Production" \
        DJANGO_SETTINGS_MODULE="SmartShoppingSystem.config" \
        --app SmartShoppingSystem-prod
```

Initialize the qa server:

```
heroku create SmartShoppingSystem-qa --remote qa && \
    heroku addons:create newrelic:wayne --app SmartShoppingSystem-qa && \
    heroku addons:create heroku-postgresql:hobby-dev --app SmartShoppingSystem-qa && \
    heroku config:set DJANGO_SECRET_KEY=`openssl rand -base64 32` \
        DJANGO_AWS_ACCESS_KEY_ID="Add your id" \
        DJANGO_AWS_SECRET_ACCESS_KEY="Add your key" \
        DJANGO_AWS_STORAGE_BUCKET_NAME="SmartShoppingSystem-qa" \
        DJANGO_CONFIGURATION="Production" \
        DJANGO_SETTINGS_MODULE="SmartShoppingSystem.config" \
        --app SmartShoppingSystem-qa
```

Securely add your Heroku credentials to Travis so that it can automatically deploy your changes:

```bash
travis encrypt HEROKU_AUTH_TOKEN="$(heroku auth:token)" --add
```

Commit your changes and push to master and qa to trigger your first deploys:

```bash
git commit -a -m "ci(travis): add Heroku credentials" && \
git push origin master:qa && \
git push origin master
```

You're now ready to continuously ship! ✨ 💅 🛳

Some commands needed for project:

```bash
cat dump.sql | docker exec -i --user postgres `docker-compose ps -q db` psql

docker exec -i "postgres" pg_restore -C --clean --no-acl --no-owner -U "postgres" -d "postgres" < "backup/dump.sql"


docker exec -i "/smartshoppingsystem_postgres_1" pg_restore -C --clean --no-acl --no-owner -U "postgres" -d "postgres" < "backup/dump"

docker exec -t "/smartshoppingsystem_postgres_1" pg_dump -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql


docker-compose run --rm web ./manage.py makemigrations

docker-compose run --rm web ./manage.py migrate
```