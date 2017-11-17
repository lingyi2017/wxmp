CREATE DATABASE if not exists `dcxt` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

use mysql;

CREATE USER 'dcxt'@'localhost' IDENTIFIED BY 'dcxt' PASSWORD EXPIRE NEVER;

UPDATE user SET authentication_string= password ('wxmp68') WHERE user='root';

flush privileges;

grant all privileges on *.* to 'root'@'%' identified by 'wxmp68';
grant all privileges on *.* to 'root'@'localhost' identified by 'wxmp68';
grant all privileges on *.* to 'root'@'127.0.0.1' identified by 'wxmp68';

grant all privileges on dcxt.* to 'dcxt'@'%' identified by 'dcxt';
grant all privileges on dcxt.* to 'dcxt'@'localhost' identified by 'dcxt';
grant all privileges on dcxt.* to 'dcxt'@'127.0.0.1' identified by 'dcxt';

flush privileges;
