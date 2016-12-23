# Use phusion/baseimage as base image https://github.com/jedisct1/phusion-baseimage-latest
FROM jedisct1/phusion-baseimage-latest:16.04

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# >>> START CUSTOM BUILD
ENV PYTHONUNBUFFERED 1

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
RUN echo "deb http://kambing.ui.ac.id/ubuntu/ xenial main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://kambing.ui.ac.id/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://kambing.ui.ac.id/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://kambing.ui.ac.id/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://kambing.ui.ac.id/ubuntu/ xenial-proposed main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://kambing.ui.ac.id/ubuntu/ xenial main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://kambing.ui.ac.id/ubuntu/ xenial-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://kambing.ui.ac.id/ubuntu/ xenial-security main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://kambing.ui.ac.id/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb-src http://kambing.ui.ac.id/ubuntu/ xenial-proposed main restricted universe multiverse" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    build-essential \
    python-dev \
    python-pip \
    libpq-dev \
    libjpeg8-dev \
    libfreetype6-dev \
    libz-dev \
    libjpeg-dev \
    gettext

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g phantomjs-prebuilt@2.1.14
RUN npm install -g casperjs@1.1.3
RUN npm install -g bower@1.8.0

RUN mkdir /source
WORKDIR /source
ADD requirements.txt /source/
RUN pip install -r requirements.txt
ADD . /source/
# <<< END CUSTOM BUILD

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
