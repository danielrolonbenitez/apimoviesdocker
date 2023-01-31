-- for MySQL 8
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

----create user all privilegios  SELECT * FROM sometable\G  --

CREATE USER 'api'@localhost IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'api'@localhost IDENTIFIED BY '123456';

--all access to network
GRANT USAGE ON *.* TO 'api'@'%' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'api';

FLUSH PRIVILEGES;


create database apimovies;
