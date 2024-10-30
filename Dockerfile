FROM liquibase/liquibase

USER root

RUN apt-get update && apt-get install -y \
    postgresql-client \
    bash \
&& rm -rf /var/lib/apt/lists/*

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["bash", "/entrypoint.sh"]
