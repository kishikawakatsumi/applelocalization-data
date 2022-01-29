#!/bin/sh
docker exec -it postgres pg_dump -U postgres -w database > postgresql-$(date +"%Y%m%d").sql
