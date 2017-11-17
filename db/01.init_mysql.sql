CREATE DATABASE if not exists dcxt DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use mysql;
insert into mysql.user (Host,User,Password,ssl_cipher,x509_issuer,x509_subject) values("%","dcxt",password("dcxt"),'','','');
flush privileges;

grant all privileges on *.* to 'root'@'%' identified by 'wxmp68';
grant all privileges on *.* to 'root'@'localhost' identified by 'wxmp68';
grant all privileges on *.* to 'root'@'127.0.0.1' identified by 'wxmp68';

grant all privileges on dcxt.* to 'dcxt'@'%' identified by 'dcxt';
grant all privileges on dcxt.* to 'dcxt'@'localhost' identified by 'dcxt';
grant all privileges on dcxt.* to 'dcxt'@'127.0.0.1' identified by 'dcxt';


flush privileges;
