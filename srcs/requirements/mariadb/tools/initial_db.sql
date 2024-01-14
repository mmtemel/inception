CREATE DATABASE IF NOT EXISTS wordpress;
--wordpress adında yeni bir veritabanı oluşturur.

CREATE USER IF NOT EXISTS 'mtemel'@'%' IDENTIFIED BY '1234';
--mtemel adında ve şifresi 1234 olarak yeni kullanıcı oluşturur.

--mtemel kullanıcısına wordpress DB üzerinde tüm yetkileri verir.
GRANT ALL PRIVILEGES ON wordpress.* TO 'mtemel'@'%';

--Sunucu tablosunu yeniler, değişiklikler anında aktif olur.
FLUSH PRIVILEGES;


--root kullanıcısının şifresini root1234 olarak değiştirir.
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root1234';
