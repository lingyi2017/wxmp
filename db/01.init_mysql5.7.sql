CREATE DATABASE if not exists `wxmp` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

use mysql;

CREATE USER 'wxmp'@'localhost' IDENTIFIED BY 'wxmp' PASSWORD EXPIRE NEVER;

UPDATE user SET authentication_string= password ('wxmp68') WHERE user='root';

flush privileges;

grant all privileges on *.* to 'root'@'%' identified by 'wxmp68';
grant all privileges on *.* to 'root'@'localhost' identified by 'wxmp68';
grant all privileges on *.* to 'root'@'127.0.0.1' identified by 'wxmp68';

grant all privileges on wxmp.* to 'wxmp'@'%' identified by 'wxmp';
grant all privileges on wxmp.* to 'wxmp'@'localhost' identified by 'wxmp';
grant all privileges on wxmp.* to 'wxmp'@'127.0.0.1' identified by 'wxmp';

flush privileges;
