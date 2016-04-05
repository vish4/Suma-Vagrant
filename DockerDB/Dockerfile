from mysql

RUN apt-get -qq update && \
apt-get install -qq mysql-server -y

RUN mkdir /suma

WORKDIR /suma

#RUN pwd
#RUN git clone https://github.com/cazzerson/Suma.git /suma
ADD initdb.sql /docker-entrypoint-initdb.d/

