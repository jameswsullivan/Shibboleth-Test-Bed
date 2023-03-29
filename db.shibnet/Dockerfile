FROM ubuntu/mysql

# Install essential packages.
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install sudo -y && \
    apt-get install nano -y

# Edit the init.sql file to customize your initial database configs.
COPY init.sql /root/init.sql

# Initialize the database.
RUN mysqld --user=root --initialize --init-file=/root/init.sql

EXPOSE 3306

