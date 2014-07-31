# VERSION 0.1
# DOCKER-VERSION  1.0.1
# AUTHOR:         acaranta <arthur@caranta.com>
# DESCRIPTION:    mediadrop self-containered
# TO_BUILD:       docker build -rm -t mediadrop .
# TO_RUN:         docker run -p 8080:8080 mediadrop

# Latest Ubuntu LTS
from    ubuntu:12.04

# Update
RUN apt-get update && apt-get -y upgrade && apt-get update -y
RUN echo 'mysql-server mysql-server/root_password password pouet' | debconf-set-selections && echo 'mysql-server mysql-server/root_password_again password pouet' | debconf-set-selections
RUN apt-get install -y python-virtualenv git mysql-server gcc mysql-client libjpeg-dev zlib1g-dev libfreetype6-dev libmysqlclient-dev python-dev python-setuptools
RUN git clone https://github.com/mediadrop/mediadrop

WORKDIR /mediadrop
RUN virtualenv --distribute --no-site-packages mediacore_env
RUN /bin/bash -c "source /mediadrop/mediacore_env/bin/activate"
RUN python setup.py develop
RUN perl -pi -e "s/host = 127.0.0.1/host = 0.0.0.0/g" development.ini

RUN /bin/bash -c "cd /mediadrop && mysqld & sleep 4 && mysql -u root -ppouet -e \"create database dbname; grant usage on dbname.* to username@localhost identified by 'pass'; grant all privileges on dbname.* to username@localhost;\" && paster setup-app /mediadrop/development.ini"
ADD start.sh start.sh

EXPOSE 8080

CMD "./start.sh"


