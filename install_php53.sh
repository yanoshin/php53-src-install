#!/bin/bash

sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

sudo yum install -y --skip-broken libxml2 libxml2-devel libjpeg libjpeg-devel libpng libpng-devel libcurl-devel
# not require ? mysql-devel

sudo mkdir /usr/local/mysql

if [ ! -f ./php-5.3.29.tar.gz ]; then
    wget http://jp2.php.net/get/php-5.3.29.tar.gz/from/this/mirror -O php-5.3.29.tar.gz
    tar zxvf php-5.3.29.tar.gz
fi

if [ ! -d ./php-5.3.29 ]; then
    echo "you should get php5.3 source code"
    exit 1;
fi

cd php-5.3.29

./configure  --prefix=/usr/local/lib/php-5.3.29 \
--with-config-file-path=/usr/local/lib/php-5.3.29 \
--enable-force-cgi-redirect=0 \
--enable-mbstring \
--enable-mbstr-enc-trans \
--enable-track-vars --enable-mbregex \
--with-mysql \
--with-zlib-dir=/usr/include/ \
--with-gd \
--with-curl \
--with-openssl \
--with-jpeg-dir=/usr/include \
--with-png-dir=/usr/include \
--program-suffix=53 \
--with-libdir=lib64

sudo make
#sudo make test
sudo make install


