-- Creates a new database called wordpress if it doesn't already exist.
CREATE DATABASE IF NOT EXISTS wordpress;

-- Creates a new user named 'mtemel' with the password '1234' allowing access from any host ('%').
CREATE USER IF NOT EXISTS 'mtemel'@'%' IDENTIFIED BY '1234';

-- Grants all privileges on the wordpress database to the user 'mtemel' from any host ('%').
GRANT ALL PRIVILEGES ON wordpress.* TO 'mtemel'@'%';

-- Refreshes the MySQL server's privileges to make changes take effect immediately.
FLUSH PRIVILEGES;

-- Changes the password for the 'root' user when connecting from 'localhost' to 'root1234'.
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root1234';
