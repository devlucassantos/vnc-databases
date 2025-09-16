#!/bin/bash

cd /liquibase/changelog

while ! pg_isready -h "$POSTGRES_HOST" -U "$POSTGRES_USER"; do
    sleep 1
done

liquibase update --username "$POSTGRES_USER" --password "$POSTGRES_PASSWORD" --contexts="$LIQUIBASE_COMMAND_CONTEXTS"
