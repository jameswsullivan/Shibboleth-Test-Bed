FROM ubuntu/mysql

# Set locale to UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# Install essential packages.
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y nano sudo locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8

# Edit the init.sql file to customize your initial database configs.
COPY mysql.init.sql /root/init.sql

# Initialize the database.
RUN mysqld --user=root --initialize --init-file=/root/init.sql

EXPOSE 3306