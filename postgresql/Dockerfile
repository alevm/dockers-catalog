FROM envygeeks/alpine
MAINTAINER Jordon Bedwell <jordon@envygeeks.io>
RUN \
  apk --update add postgresql postgresql-contrib && \
  docker-helper reset_users postgres:614 && \

  rm -rf /srv/postgresql /etc/postgresql /etc/postgresql.conf && \
  mkdir -p /srv/postgresql /run/postgresql && \
  chown postgres:postgres  /srv/postgresql && \
  chown postgres:postgres  /run/postgresql && \
  chmod og-rwx /srv/postgresql && \
  docker-helper cleanup

ADD copy /
VOLUME /srv/postgresql
EXPOSE 5432
