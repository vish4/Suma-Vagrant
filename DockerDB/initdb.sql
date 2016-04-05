CREATE DATABASE IF NOT EXISTS suma;
CREATE USER IF NOT EXISTS 'suma'@'localhost' IDENTIFIED BY '12345';
CREATE USER IF NOT EXISTS 'suma'@'172.%' IDENTIFIED BY '12345';
USE suma;
source /suma/service/config/schema_w_sample.sql;
GRANT ALL ON *.* TO 'suma'@'localhost';FLUSH PRIVILEGES;
GRANT ALL ON *.* TO 'suma'@'172.%';FLUSH PRIVILEGES;
