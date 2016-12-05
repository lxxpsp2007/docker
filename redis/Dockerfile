FROM devel:5000/centos:7.2.1511
MAINTAINER  HJ lxxpsp2007@126.com
USER nobody
ADD redis-3.2.5-bin/ /usr/local/bin
ADD redis.conf /etc

EXPOSE 6379
CMD [ "/etc/redis.conf" ]
ENTRYPOINT [ "/usr/local/bin/redis-server" ]
