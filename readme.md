Django+PostgreSQL+PostGIS Development With Docker

Based on https://docs.docker.com/compose/django/

Based on Docker:

* Docker 1.12.3
* image: jedisct1/phusion-baseimage-latest:16.04
* image: mdillon/postgis:9.6
* image: redis:3.0

Python packages:

* Django==1.9.12
* psycopg2==2.6.2
* pytz==2016.10
* django-bower==5.2.0
* Pillow==3.4.2
* supervisor==3.3.1
* redis==2.10.5
* django-redis==4.6.0
* rq==0.7.1
* django-rq==0.9.4
* rq-scheduler==0.7.0

Other:

* nodejs
* phantomjs 2.1.14
* casperjs 1.1.3
* bower 1.8.0

First start:

* git clone https://github.com/senoadiw/django_docker.git
* cd django_docker
* docker-compose build
* # run first compose up to create db
* docker-compose up
* # press ctrl-c after: database systems are ready to accept connections
* docker-compose up -d
* docker-compose ps -a
* # run first migration and create superadmin user
* docker exec -it djangodocker_web_1 bash
    * python manage.py migrate
    * python manage.py createsuperuser
    * exit
* docker-machine ls
* docker-machine ip default
* # open in browser http://dockermachineip:8000

Subsequent starts:

* cd django_docker
* docker-compose up -d
* docker-machine ip default
* docker exec -it djangodocker_web_1 bash
* # open in browser http://dockermachineip:8000
