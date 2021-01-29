FROM alpine:edge

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update && apk upgrade && apk add \
	bash apache2 php7-apache2 curl ca-certificates openssl openssh git php7 php7-phar php7-json php7-iconv php7-openssl tzdata openntpd nano

RUN apk add \
	php7-xdebug \
	php7-mcrypt \
	php7-mbstring \
	php7-soap \
	php7-gmp \
	php7-dom \
	php7-zip \
	php7-bcmath \
	php7-gettext \
	php7-xml \
	php7-xmlreader \
	php7-xmlwriter \
	php7-tokenizer \
	php7-xmlrpc \
	php7-bz2 \
	php7-curl \
	php7-ctype \
	php7-session \
	php7-exif \
	php7-intl \
	php7-fileinfo
	
RUN apk add php7-simplexml
	
RUN cp /usr/bin/php7 /usr/bin/php \
    && rm -f /var/cache/apk/*
	
RUN sed -i "s/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ session_module/LoadModule\ session_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ session_cookie_module/LoadModule\ session_cookie_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ session_crypto_module/LoadModule\ session_crypto_module/" /etc/apache2/httpd.conf \
    && sed -i "s/#LoadModule\ deflate_module/LoadModule\ deflate_module/" /etc/apache2/httpd.conf \
    && sed -i "s#^DocumentRoot \".*#DocumentRoot \"/app/public\"#g" /etc/apache2/httpd.conf \
    && sed -i "s#/var/www/localhost/htdocs#/app/public#" /etc/apache2/httpd.conf \
    && printf "\n<Directory \"/app/public\">\n\tAllowOverride All\n</Directory>\n" >> /etc/apache2/httpd.conf
	
	
RUN mkdir /app && mkdir /app/public && chown -R apache:apache /app && chmod -R 755 /app
COPY www.api/root/ /root/
RUN chmod +x /root/run.sh

EXPOSE 80
ENTRYPOINT ["/root/run.sh"]