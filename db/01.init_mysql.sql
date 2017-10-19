CREATE DATABASE if not exists wxmp DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use mysql;
insert into mysql.user (Host,User,Password,ssl_cipher,x509_issuer,x509_subject) values("%","wxmp",password("wxmp"),'','','');
flush privileges;

grant all privileges on *.* to 'root'@'%' identified by 'wxmp68';
grant all privileges on *.* to 'root'@'localhost' identified by 'wxmp68';
grant all privileges on *.* to 'root'@'127.0.0.1' identified by 'wxmp68';

grant all privileges on wxmp.* to 'wxmp'@'%' identified by 'wxmp';
grant all privileges on wxmp.* to 'wxmp'@'localhost' identified by 'wxmp';
grant all privileges on wxmp.* to 'wxmp'@'127.0.0.1' identified by 'wxmp';


flush privileges;
