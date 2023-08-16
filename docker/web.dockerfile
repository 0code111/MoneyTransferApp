FROM nginx:1.25.2

ADD ./docker/vhost.conf /etc/nginx/conf.d/default.conf
