# Contenedores de sistemas gestores de Base de Datos
![ImagenDocker](./image/ballena.png)

## coamdos docker con Descripción 

| Comando | Descripción |
| :------ | :---------  |
| **docker --version** | _Verifica la versión de docker_ |
| **docker pull nombre_imagen**| _Descarga una imagen de docker hub_ [DockerHub](https://hub.docker.com/) |
| **docker image**| _Visualiza las imagenes_|
| **docker run**| _Crea un contenedor_|
| **docker ps**| _Visualiza todos los contenedores en ejecución_|
| **docker contenedor ls**| _Visualiza todos los contnedores en ejecución_|
| **docker ps -a**| _Visualiza todos los contenedores en ejecución y no en ejecución_|
| **docker container ls -a**| _Visualiza todos los contenedores en ejecución y no en ejecución_|
| **docker stop  nombre_contenedor o ID**| _Detiene un contenedor_|
| **docker start  nombre_contenedor o ID**| _Inicia un contenedor_|
| **docker rm nombre_contenedor o ID**| _Elimina un contenedor que no está en ejecución_|
| **docker rm -f**| _Elimina un contenedor que está en ejecución_|
| **docker volume ls**| _Lista los volumenes que tiene docker_|
| **docker volume create nombre_volumen **| _Crea un volumen_|
| **docker volume rm nombre_volumen **| _Elimina un volumen_|



## Comandos de contenedores de SGBD
```
docker pull docker/getting-started
```
### Contendor de tutorial de docker
```
docker run -d -name tutorial-docker -p 80:80 docker/getting-started:latest 
o
docker run -d -name tutorial-docker -p 80:80 d7933
```
### contenedor de MariaDB sin volumen
```
docker run -d --name server-MariaDBG3 -p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 d8e96
```

### contenedor de MariaDB con volumen
```
docker run -d --name server-MariaDBG3 -p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 -v vol-mariadbG3:/var/lib/mysql d8e96
```
### contenedor de Postgres con volumen
```docker
docker run -d --name server-postgresG3 -e POSTGRES_PASSWORD=12345 -p 5456:5432 -v vol-postgresG3:/var/lib/postgresql/data eba8ddbdd837
```
### contenedor de SQL con volumen
```
docker run -d --name server-SQLG3 -e SQL_PASSWORD=A1234567_ -p 1451:1433 -v vol-sqlg3:/var/opt/mssql d01cc45e6b92
```



