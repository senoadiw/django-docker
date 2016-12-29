**Django+PostgreSQL+PostGIS Development With Docker**

Based on https://docs.docker.com/compose/django/

Built with:

* Win 7 SP1
* Virtualbox 5.1.12
* Docker Toolbox 1.12.3
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

* install Docker from https://www.docker.com/
* # note: consider installing Docker machines on largest OS partition => http://stackoverflow.com/a/37246965/5551336
* # note: if using Docker Toolbox on Windows, please clone repo in directory under C:\Users => https://docs.docker.com/engine/tutorials/dockervolumes/
* # note: if using Docker Toolbox on Windows, add COMPOSE_CONVERT_WINDOWS_PATHS to system environment variable => http://stackoverflow.com/a/41320171/5551336
* cd path/to/source/dir/under/c/users
* git clone https://github.com/senoadiw/django-docker.git
* cd django-docker
* docker-compose build
* # wait until build complete
* # first compose up will create new db
* docker-compose up -d
* docker-compose ps
* # run first migration and create superadmin user
* docker exec -it djangodocker_web_1 bash
    * python manage.py migrate
    * python manage.py createsuperuser
    * exit
* # get docker default machine IP address
* docker-machine ls
* docker-machine ip default
* # open in browser http://dockermachineip:8000

Subsequent starts:

* cd django_docker
* docker-compose up -d
* # or: docker-compose start
* # below is to access Django's manage.py tool
* docker-machine ip default
* docker exec -it djangodocker_web_1 bash
* # open in browser http://dockermachineip:8000

Docker Compose commands:

* (create if not created and) start all containers in background:
    * docker-compose up -d
* list container status:
    * docker-compose ps
* start all containers:
    * docker-compose start
* stop all containers:
    * docker-compose stop
    * docker stop $(docker ps -a -q)
* restart all containers:
    * docker-compose restart
    * docker restart $(docker ps -a -q)
* delete all containers:
    * # stop containers first
    * docker-compose rm -f
    * (WARNING: may delete other unrelated containers): docker rm $(docker ps -a -q)

Docker Machine commands:

* list all machines
    * docker-machine ls
* start default machine
    * docker-machine start default
* stop default machine
    * docker-machine stop default
* Delete default machine (WARNING: will delete all images and containers in default machine)
    * docker-machine rm default
* Create new default machine using Virtualbox driver with 2GB RAM, 2 CPU, 20GB storage
    * docker-machine create --driver virtualbox --virtualbox-memory 2048 --virtualbox-cpu-count 2 --virtualbox-disk-size 20480 default

PostgreSQL db settings

* db port: 8432 (from host)
* db name: django_db
* db role: django
* db pass: password
