include .env.local
export

.PHONY: create_mysql_user create_mysql_database setup_database
create_mysql_user:
	@echo "Checking if MySQL user $(DB_USER) exists..."
	@mysql --defaults-file=~/.my.cnf -P $(DB_PORT) -e "SELECT 1 FROM mysql.user WHERE user = '$(DB_USER)';" | grep -q 1 || \
		(echo "Creating MySQL user..." && mysql --defaults-file=~/.my.cnf -P $(DB_PORT) -e "CREATE USER '$(DB_USER)'@'%' IDENTIFIED BY '$(DB_PASSWORD)';")

create_mysql_database:
	@echo "Creating MySQL database..."
	@mysql --defaults-file=~/.my.cnf -P $(DB_PORT) -e "CREATE DATABASE IF NOT EXISTS $(DB_NAME);"
	@mysql --defaults-file=~/.my.cnf -P $(DB_PORT) -e "GRANT ALL PRIVILEGES ON $(DB_NAME).* TO '$(DB_USER)'@'%';"

setup_database: create_mysql_user create_mysql_database


