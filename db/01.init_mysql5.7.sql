CREATE DATABASE if not exists `qyfw` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

use mysql;

CREATE USER 'qyfw'@'localhost' IDENTIFIED BY 'qyfw' PASSWORD EXPIRE NEVER;

UPDATE user SET authentication_string= password ('wxmp68') WHERE user='root';

flush privileges;

grant all privileges on *.* to 'root'@'%' identified by 'wxmp68';
grant all privileges on *.* to 'root'@'localhost' identified by 'wxmp68';
grant all privileges on *.* to 'root'@'127.0.0.1' identified by 'wxmp68';

grant all privileges on qyfw.* to 'qyfw'@'%' identified by 'qyfw';
grant all privileges on qyfw.* to 'qyfw'@'localhost' identified by 'qyfw';
grant all privileges on qyfw.* to 'qyfw'@'127.0.0.1' identified by 'qyfw';

flush privileges;
