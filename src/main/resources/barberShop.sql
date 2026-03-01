/*Se crea la base de datos solicitada 2 ptos*/
CREATE DATABASE caso01BD
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;


/*Se crea un usuario para la base de datos 2 ptos*/
CREATE USER 'estudiante01'@'%' identified by '119780748';


/*Se asignan todos los privilegios sobre la base de datos solicitada al usuario creado 2 ptos*/
GRANT SELECT, INSERT, UPDATE, DELETE ON caso01BD.* TO 'estudiante01'@'%';
FLUSH PRIVILEGES;

use caso01BD;
/* Se crea la tabla solicitada 2 ptos*/
CREATE TABLE equipo(
id_equipo int auto_increment primary key,
descripcion varchar(30),
fecha_aparicion varchar(10),
miembros int,
imagen_equipo varchar(1024))
ENGINE = InnoDB;


/*Se insertan 4 registros en la tabla solicitada 2ptos */
INSERT INTO equipo(descripcion,fecha_aparicion,miembros,imagen_equipo) VALUES
('Real Madrid', '1902','11','https://imageio.forbes.com/i-forbesimg/media/lists/teams/real-madrid_416x416.jpg?format=jpg'),
('Barcelona', '1899','11', 'https://4kwallpapers.com/images/walls/thumbs_3t/14119.jpg'),
('Herediano','1921','11','https://www.nacion.com/resizer/v2/H5MLOSL5H5DD7FY4JZMZWQU2QI.png?smart=true&auth=b535271eb22274d243ab94bf24cfd93782041fc8f09931c4c4a01479ef5e0970&width=1440&height=752'),
('Inter Miami','2018','11', 'https://1000logos.net/wp-content/uploads/2020/09/Inter-Miami-logo-640x360.png');
