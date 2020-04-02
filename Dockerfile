#
# DIAMONTIS Informatique
# STIEN Jordan
# Fork : stevenmartins/ci-env
#

FROM ubuntu:19.10

RUN apt-get update && apt-get install -y curl ca-certificates xz-utils phpunit apt-utils

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get update && apt-get install -y \
  openssh-client \
  rsync \
  bzip2 \
  python3 \
  python3-pip \
  lsb-release \
  apt-transport-https \
  ca-certificates \
  python3-virtualenv \
  python-virtualenv \
  nodejs \
  git \
  libmcrypt-dev \
  php \
  php-mysql \
  php-bcmath \
  php-bz2 \
  php-sqlite3 \
  php-intl \
  php-mysql \
  php-gd \
  php-mbstring \
  php-zip \
  libjpeg-dev \
  libzlcore-dev \
  libtiff5-dev \
  libfreetype6-dev \
  libwebp-dev \
  libtk-img-dev \
  composer \
  unzip \
  zip \
  php-xdebug && rm -r /var/lib/apt/lists/

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install -y mysql-server mysql-client libmysqlclient-dev --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install -g gulp grunt bower typescript yarn webpack
RUN echo '{ "allow_root": true }' > /root/.bowerrc

CMD ["/bin/bash"]
