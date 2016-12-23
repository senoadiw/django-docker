#!/usr/bin/env bash

echo "host    all             all             192.168.0.0/16               md5" >> /var/lib/postgresql/data/pg_hba.conf
echo "listen_addresses = '*'" >> /var/lib/postgresql/data/postgresql.conf
echo "port = 5432" >> /var/lib/postgresql/data/postgresql.conf
