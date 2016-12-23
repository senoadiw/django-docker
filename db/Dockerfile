FROM mdillon/postgis:9.6

ENV POSTGRES_DB django_db
ENV POSTGRES_USER django
ENV POSTGRES_PASSWORD password

COPY setup.sh /docker-entrypoint-initdb.d/
