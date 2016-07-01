FROM ubuntu:trusty
MAINTAINER Andi Bute <andi@projectricochet.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list && \
    apt-get update && \
    apt-get install -y mongodb-org-shell mongodb-org-tools && \
    echo "mongodb-org-shell hold" | dpkg --set-selections && \
    echo "mongodb-org-tools hold" | dpkg --set-selections && \
    mkdir /backup

ADD run.sh /run.sh
ADD check_variables.sh /check_variables.sh
ADD fetch_from_target.sh /fetch_from_target.sh
ADD restore.sh /restore.sh

RUN chmod +x *.sh

CMD ["/run.sh"]