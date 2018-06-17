FROM redis:4.0

ARG USER="redis"
ARG UID="1000"
ARG GROUP="redis"
ARG GID="1000"
ARG WORKSPACE="/usr/local/etc/redis/"

# system update
RUN apt-get -y update

# locale
RUN apt-get -y install locales && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# timezone (Asia/Tokyo)
ENV TZ JST-9

# etc
ENV TERM xterm

# tools
RUN apt-get -y install git vim less

# config
# COPY redis.conf /usr/local/etc/redis/redis.conf

# user setting
WORKDIR $WORKSPACE
RUN usermod -u $UID $USER && groupmod -g $GID $GROUP

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

