FROM php:8.1-rc-apache
RUN docker-php-ext-install mysqli  
ARG UID
EXPOSE $UID


# Update Ubuntu Software repository
RUN apt clean
RUN apt update
RUN apt install apt-transport-https -y
ENV TZ=America/Argentina
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Software propierties common build-essential binutils-doc git
RUN apt install software-properties-common curl -y
RUN apt update

# Librerias 
RUN apt install wget nano zip unzip -y --fix-missing

RUN apt-get update \
    && apt-get install -y git acl openssl openssh-client wget zip vim librabbitmq-dev libssh-dev \
    && apt-get install -y libpng-dev zlib1g-dev libzip-dev libxml2-dev libicu-dev \
    && docker-php-ext-install intl pdo pdo_mysql zip gd soap bcmath sockets \
    && pecl install xdebug \
    && docker-php-ext-enable --ini-name 05-opcache.ini opcache xdebug
    


# Instalacion de composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer





