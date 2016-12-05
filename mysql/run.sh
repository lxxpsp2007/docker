#!/bin/bash

BASE_DIR=/usr/local/mysql-5.6.26
DATA_DIR=/database

INIT_MYSQL (){
    ${BASE_DIR}/scripts/mysql_install_db --user=mysql --basedir=${BASE_DIR} --datadir=${DATA_DIR}
    ${BASE_DIR}/bin/mysqld_safe
}

INIT_USER () {
    ROOT_PASSWORD=123123
${BASE_DIR}/bin/mysql << EOF
    DROP DATABASE test;
    DELETE FROM mysql.user WHERE User='';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    UPDATE mysql.user SET Password=PASSWORD('${ROOT_PASSWORD}') WHERE User='root';
    grant all on *.*  to root@'192.168.%.%' identified by '${ROOT_PASSWORD}';
    grant all on *.*  to root@'172.16.%.%' identified by '${ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOF
}

CHECK_CONN (){
    A=true
    while $A ; do
        ${BASE_DIR}/bin/mysql -e "show databases"
        if [ "$?" = "0" ] ;then
             INIT_USER
             A=false
        fi
        sleep 2
    done
}

if [ ! -e "${DATA_DIR}/mysql" ] ;then
    (CHECK_CONN) &
    INIT_MYSQL
else
    ${BASE_DIR}/bin/mysqld_safe
fi

