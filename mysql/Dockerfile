FROM centos:7.2.1511
MAINTAINER  HJ lxxpsp2007@126.com

ADD mysql-5.6.26.tar.gz /usr/local/
ADD my.cnf /usr/local/mysql-5.6.26/etc/
ADD run.sh /
ADD 9z.repo /etc/yum.repos.d/
RUN yum install -y perl perl-Data-Dumper ;mkdir /database ; groupadd -g 27 mysql;useradd mysql -u 27 -g 27 -M -s /sbin/nologin

EXPOSE 3306
CMD [ "/run.sh" ]
ENTRYPOINT [ "bash" ]
