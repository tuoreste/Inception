-- to start MariaDB service
-- rc-services mariadb start

FLUSH PRIVILEGES;
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_ROOT_PASSWORD');

CREATE DATABASE IF NOT EXISTS '$DB_NAME';
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost';
CREATE USER IF NOT EXISTS '$DB_USER'@'%';
SET PASSWORD FOR '$DB_USER'@'localhost' = PASSWORD('$DB_PASSWORD');
SET PASSWORD FOR '$DB_USER'@'%' = PASSWORD('$DB_PASSWORD');
GRANT ALL PRIVILEGES ON '$DB_NAME'.* TO '$DB_USER'@'localhost';
GRANT ALL PRIVILEGES ON '$DB_NAME'.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;

-- to stop MariaDB service
-- rc-services mariadb stop
