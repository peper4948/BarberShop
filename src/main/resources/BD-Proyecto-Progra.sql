
-- crear BD --
CREATE DATABASE barbershop;

-- crear un usuario --
CREATE USER 'barber'@'localhost' IDENTIFIED BY 'ClaveSegura123';

-- asignacion de permisos
GRANT SELECT, INSERT, UPDATE, DELETE ON barbershop TO 'barber'@'localhost';
FLUSH PRIVILEGES;


-- CREACION DE TABLAS --

-- TABLA: usuario --
-- Guarda los usuarios registrados -- 
-- Permite login y control de permisos --
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    correo VARCHAR(80) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
) ENGINE = InnoDB;

-- TABLA: cita --
-- Guarda las reservas hechas por los clientes -- 
CREATE TABLE cita (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estado ENUM('Pendiente','Confirmada','Cancelada') DEFAULT 'Pendiente',
    id_usuario INT NOT NULL,
    id_barbero INT NOT NULL,
    id_servicio INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_barbero) REFERENCES barbero(id_barbero),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
) ENGINE=InnoDB;

-- TABLA: servicio --
-- Guarda los servicios que ofrece la barbería --
CREATE TABLE servicio (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- TABLA rol --
-- Guarda los tipos de usuario del sistema --
CREATE TABLE rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- TABLA: barbero --
-- Guarda los empleados que atienden citas --
CREATE TABLE barbero (
    id_barbero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    descripcion TEXT,
    activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- TABLA: producto --
-- Guarda los productos que se venden en tienda --
CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- TABLA: pedido --
-- Representa una compra realizada por un usuario --
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(12,2) NOT NULL,
    estado ENUM('Pendiente','Pagado','Cancelado') DEFAULT 'Pendiente',
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
) ENGINE=InnoDB;

-- TABLA: detalle_pedido --
-- Guarda los productos que incluye cada pedido --
-- Permite que un pedido tenga varios productos --
CREATE TABLE detalle_pedido (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
) ENGINE=InnoDB;