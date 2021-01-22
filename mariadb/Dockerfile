FROM alpine:3.12

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>
LABEL wikiurl="https://wiki.ixpcontrol.com/docker-image/mariadb"
LABEL version="alpha"

COPY root/ /
RUN chmod +x /root/*.sh

RUN apk add --no-cache mariadb=10.4.15-r0 && \
  /bin/sh /root/clean.sh && \
  # removed in cleaning
  touch /usr/share/mariadb/mysql_test_db.sql && \
  # allow anyone to connect by default
  sed -i -e 's/127.0.0.1/%/' /usr/share/mariadb/mysql_system_tables_data.sql && \
  mkdir /run/mysqld && \
  chown mysql:mysql /etc/my.cnf.d/ /run/mysqld /usr/share/mariadb/mysql_system_tables_data.sql

COPY sh/resolveip.sh /usr/bin/resolveip
COPY sh/run.sh /run.sh
COPY my.cnf /tmp/my.cnf



# This is not super helpful; mysqld might be running but not accepting connections.
# Since we have no clients, we can't really connect to it and check.
#
# Below is in my opinion better than no health check.
HEALTHCHECK --start-period=5s CMD pgrep mysqld

VOLUME ["/var/lib/mysql"]
ENTRYPOINT ["/root/run.sh"]
EXPOSE 3306