FROM php:8.4-fpm

ARG UID
ARG GID

ENV DEBIAN_FRONTEND noninteractive
ENV TERM            xterm-color

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sudo \
    curl \
    openssl \
    nano \
    locales \
    tzdata \
    dos2unix \
    iproute2 \
    iputils-ping \
    zip \
    unzip \
    git

RUN usermod -aG sudo www-data && \
    echo "www-data ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN usermod -u ${UID} -s /bin/bash www-data && groupmod -g ${GID} www-data

# Define locale PT-BR
RUN echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen "pt_BR.UTF-8" && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG="pt_BR.UTF-8"

# Define Timezone America/Sao_Paulo
RUN ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions \
    mysqli \
    bcmath \
    gd \
    exif \
    zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY .docker/php/conf.d/*.ini /usr/local/etc/php/conf.d/
COPY .docker/php/php-fpm.d/*.conf /usr/local/etc/php-fpm.d/

RUN chown -R www-data:www-data /var/www

USER www-data
