  
# Create the docker image and container

docker build -t "mysql-single" .

# Run a container with that image

docker run -d -p 3307:3306 mysql-single

# Check the admin password

docker logs ff1cc6a87214

docker run -d --net=host -v  /home/acme-air/mysql-data:/home/mysql  mysql-single /bin/bash -c "/usr/bin/mysql_install_db"
