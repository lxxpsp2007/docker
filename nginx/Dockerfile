FROM devel:5000/centos:7.2.1511
MAINTAINER  HJ lxxpsp2007@126.com

ADD nginx-1.10.2.tar.gz /usr/local/
ADD conf.tar.gz /usr/local/nginx-1.10.2/
ADD run.sh /
RUN mkdir -p /var/log/nginx/ ; ln -sf /dev/stdout /var/log/nginx/nginx.log ; ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80
CMD [ "/run.sh" ]
ENTRYPOINT [ "bash" ]
