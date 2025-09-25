SHOW DATABASES;

USE mysql;

SELECT * FROM user;
-- CREATE DATABASE menudb;

GRANT ALL PRIVILEGES ON menudb.* TO 'swcamp'@'%';
SHOW GRANTS FOR 'swcamp'@'%';

create database employeedb;
show databases;

GRANT ALL PRIVILEGES ON employeedb.* TO 'swcamp'@'%';
