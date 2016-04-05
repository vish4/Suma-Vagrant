from ubuntu:14.04

RUN apt-get update -y && apt-get install -y \
 git \
 apache2 \
 apache2-dev \
 wget \
 mysql-client \
 python-mysqldb \
 libapache2-mod-auth-mysql \
 libfcgi-dev libfcgi0ldbl libjpeg62-dbg libmcrypt-dev \
 libssl-dev libbz2-dev libjpeg-dev libfreetype6-dev libpng12-dev libxpm-dev \
 libxml2-dev libpcre3-dev libbz2-dev libcurl4-openssl-dev libjpeg-dev libpng12-dev libxpm-dev \
 libfreetype6-dev libmysqlclient-dev libt1-dev libgd2-xpm-dev libgmp-dev libsasl2-dev libmhash-dev \
 unixodbc-dev freetds-dev libpspell-dev libsnmp-dev libtidy-dev libxslt1-dev libmcrypt-dev libdb5.3-dev \
 apache2-mpm-prefork \
 php5-fpm

RUN wget -O /var/tmp/php-5.3.29.tar.gz http://us1.php.net/get/php-5.3.29.tar.gz/from/this/mirror
RUN mkdir -p /vagrant /opt/build /usr/include/freetype2/freetype && \
    ln -s /usr/include/freetype2/freetype.h /usr/include/freetype2/freetype/freetype.h && \
    tar zxf /var/tmp/php-5.3.29.tar.gz -C /opt/build && \
    cd /opt/build/php-5.3.29 && \
    ./configure \
    --with-mcrypt \
    --enable-mbstring \
    --with-openssl \
    --with-mysql \
    --with-mysql-sock \
    --with-apxs2=/usr/bin/apxs2 \
    --with-mpm=prefork \
    --with-gd \
    --with-jpeg-dir=/usr/lib \
    --enable-gd-native-ttf \
    --with-pdo-mysql \
    --with-libxml-dir=/usr/lib \
    --with-mysqli=/usr/bin/mysql_config \
    --with-curl \
    --enable-zip \
    --enable-sockets \
    --with-zlib \
    --enable-exif \
    --enable-ftp \
    --with-iconv \
    --with-gettext \
    --enable-gd-native-ttf \
    --with-t1lib=/usr \
    --with-freetype-dir=/usr \
    --with-config-file-path=/etc/php5/apache2/php.ini

WORKDIR /opt/build/php-5.3.29

#Install PHP
RUN make && \
make install && \
apt-get install php5-mysql -y

#Suma Source Code in docker Container
WORKDIR /vagrant

EXPOSE 80 3306

CMD sh /vagrant/Config_Softlinks.sh && /etc/init.d/apache2 start && sed -r -i 's/host.*/host: '$DB_PORT_3306_TCP_ADDR'/' /vagrant/configs/service/config/config.yaml && sh /vagrant/postfix.sh && tail -f /dev/null
