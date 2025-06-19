--Crear una base de datos
USE Master;
GO
DROP DATABASE IF EXISTS Venta_Vehiculos_P3_2025;
GO

CREATE DATABASE Venta_Vehiculos_P3_2025;
GO


--Apuntar a la base de datos en la que deseas ejecutar los querys
USE Venta_Vehiculos_P3_2025;

--Crear la tabla Cliente
CREATE TABLE Cliente (
    Id_Cliente INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    Primer_Apellido NVARCHAR(30) NOT NULL,
    Segundo_Apellido NVARCHAR(30) NOT NULL,
    Telefono NVARCHAR(30) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    Cedula NVARCHAR(30) NOT NULL,
    Fecha_Nacimiento DATE NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Cliente PRIMARY KEY (Id_Cliente)
);

--Consultar todos los datos de mi tabla
--SELECT * FROM Cliente

--Crear la tabla Sede
CREATE TABLE Sede (
    Id_Sede TINYINT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    Descripcion NVARCHAR(200) NOT NULL,
    Telefono NVARCHAR(30) NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Sede PRIMARY KEY (Id_Sede)
);

--Crear la tabla Puesto
CREATE TABLE Puesto (
    Id_Puesto TINYINT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    --Descripcion NVARCHAR(200) NULL,
    Descripcion NVARCHAR(200),
    Estado BIT NOT NULL,
    CONSTRAINT PK_Puesto PRIMARY KEY (Id_Puesto)
);

--Crear la tabla Tipo_Combinacion
CREATE TABLE Tipo_Combinacion (
    Id_Tipo_Combinacion TINYINT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    Descripcion NVARCHAR(200) NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Tipo_Combinacion PRIMARY KEY (Id_Tipo_Combinacion)
);

--Crear la tabla Estilo
CREATE TABLE Estilo (
    Id_Estilo TINYINT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    Descripcion NVARCHAR(200) NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Estilo PRIMARY KEY (Id_Estilo)
);

--Crear la tabla Empleado
CREATE TABLE Empleado (
    Id_Empleado INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    Primer_Apellido NVARCHAR(30) NOT NULL,
    Segundo_Apellido NVARCHAR(30) NOT NULL,
    Telefono NVARCHAR(30) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    Cedula NVARCHAR(30) NOT NULL,
    Id_Sede TINYINT NOT NULL,
    Id_Puesto TINYINT NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Empleado PRIMARY KEY (Id_Empleado),
    CONSTRAINT FK_Empleado_Sede FOREIGN KEY (Id_Sede) REFERENCES Sede(Id_Sede),
    CONSTRAINT FK_Empleado_Puesto FOREIGN KEY (Id_Puesto) REFERENCES Puesto(Id_Puesto)
);

--Crear la tabla Vehiculo
CREATE TABLE Vehiculo (
    Id_Vehiculo INT IDENTITY(1,1) NOT NULL,
    Marca NVARCHAR(30) NOT NULL,
    Modelo NVARCHAR(30) NOT NULL,
    Precio FLOAT NOT NULL,
    Id_Tipo_Combinacion TINYINT NOT NULL,
    Cantidad_De_Puertas TINYINT NOT NULL,
    Id_Estilo TINYINT NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Vehiculo PRIMARY KEY (Id_Vehiculo),
    CONSTRAINT FK_Empleado_TipoCombinacion FOREIGN KEY (Id_Tipo_Combinacion) REFERENCES Tipo_Combinacion(Id_Tipo_Combinacion),
    CONSTRAINT FK_Empleado_Estilo FOREIGN KEY (Id_Estilo) REFERENCES Estilo(Id_Estilo)
);

--Crear la tabla Factura
CREATE TABLE Factura (
    Id_Factura INT IDENTITY(1,1) NOT NULL,
    Id_Empleado INT NOT NULL,
    Id_Cliente INT NOT NULL,
    Fecha_Hora DATETIME NOT NULL,
    Id_Sede TINYINT NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Factura PRIMARY KEY (Id_Factura),
    CONSTRAINT FK_Factura_Empleado FOREIGN KEY (Id_Empleado) REFERENCES Empleado(Id_Empleado),
    CONSTRAINT FK_Factura_Cliente FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
    CONSTRAINT FK_Factura_Sede FOREIGN KEY (Id_Sede) REFERENCES Sede(Id_Sede)
);

--Crear la tabla Factura
CREATE TABLE Factura_Maestro_Detalle (
    Id_Factura_Maestro_Detalle INT IDENTITY(1,1) NOT NULL,
    Id_Factura INT NOT NULL,
    Id_Vehiculo INT NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Factura_Maestro_Detalle PRIMARY KEY (Id_Factura_Maestro_Detalle),
    CONSTRAINT FK_FacturaMaestroDetalle_Factura FOREIGN KEY (Id_Factura) REFERENCES Factura(Id_Factura),
    CONSTRAINT FK_FacturaMaestroDetalle_Vehiculo FOREIGN KEY (Id_Vehiculo) REFERENCES Vehiculo(Id_Vehiculo)
);


INSERT INTO Cliente (Nombre, Primer_Apellido, Segundo_Apellido, Telefono, Email, Cedula, Fecha_Nacimiento, Estado) VALUES
('Luis', 'Loaiza', 'Cordero', '8888-8888', 'luis@example.com', '1-1234-1234', '1990-01-01', 1),
('Mariana', 'Gomez', 'Zamora', '8999-9999', 'mariana@example.com', '2-5678-5678', '1985-02-15', 1),
('Carlos', 'Mora', 'Sanchez', '8777-7777', 'carlos@example.com', '3-3456-3456', '1992-06-25', 1),
('Ana', 'Vargas', 'Chaves', '8666-6666', 'ana@example.com', '4-7890-7890', '1998-12-10', 0),
('Jorge', 'Alp�zar', 'Mej�a', '8555-5555', 'jorge@example.com', '5-0001-0001', '1995-04-08', 1),
('José', 'Hernández', 'López', '8555-5555', 'jose@example.com', '5-0001-1001', '1998-04-08', 1);

INSERT INTO Sede (Nombre, Descripcion, Telefono, Estado) VALUES
('San Jos�', 'Sucursal principal en San Jos� centro', '2222-2222', 1),
('Alajuela', 'Sucursal ubicada en el centro de Alajuela', '2433-1122', 1),
('Heredia', 'Sucursal al norte de Heredia centro', '2266-3344', 1),
('Cartago', 'Sucursal cercana a la Bas�lica', '2555-7788', 1),
('Lim�n', 'Sucursal principal del Caribe', '2750-0000', 0);


INSERT INTO Puesto (Nombre, Descripcion, Estado) VALUES
('Gerente', 'Responsable de toda la sucursal', 1),
('Vendedor', 'Encargado de ventas y atenci�n al cliente', 1),
('Mec�nico', 'Responsable del mantenimiento de veh�culos', 1),
('Asistente', 'Asistente administrativo general', 1),
('Contador', 'Encargado del �rea financiera', 1);


INSERT INTO Puesto (Nombre, Descripcion, Estado) VALUES
('Cajero', NULL, 1),
('Chofer', NULL, 1),
('Recepcionista', NULL, 1),
('Digitador', NULL, 1),
('Supervisor', NULL, 1);


INSERT INTO Tipo_Combinacion (Nombre, Descripcion, Estado) VALUES
('Manual', 'Transmisi�n manual', 1),
('Autom�tica', 'Transmisi�n autom�tica', 1),
('Mixta', 'Transmisi�n mixta (semi)', 1),
('El�ctrico', 'Motor el�ctrico sin marchas', 1),
('CVT', 'Transmisi�n continuamente variable', 1);


INSERT INTO Estilo (Nombre, Descripcion, Estado) VALUES
('Sed�n', 'Veh�culo con carrocer�a cl�sica de 4 puertas', 1),
('SUV', 'Veh�culo deportivo utilitario', 1),
('Hatchback', 'Compacto con maletera integrada', 1),
('Pickup', 'Veh�culo con caj�n de carga', 1),
('Convertible', 'Techo removible para viajes al aire libre', 1);


INSERT INTO Empleado (Nombre, Primer_Apellido, Segundo_Apellido, Telefono, Email, Cedula, Id_Sede, Id_Puesto, Estado) VALUES
('Oscar', 'Ram�rez', 'Z��iga', '8888-0001', 'oscar@example.com', '1-9999-9999', 1, 1, 1),
('Paola', 'Herrera', 'Solano', '8888-0002', 'paola@example.com', '2-8888-8888', 2, 2, 1),
('Roberto', 'Campos', 'Jim�nez', '8888-0003', 'roberto@example.com', '3-7777-7777', 3, 3, 1),
('Daniela', 'Alvarado', 'Vega', '8888-0004', 'daniela@example.com', '4-6666-6666', 4, 4, 1),
('Kevin', 'Salas', 'L�pez', '8888-0005', 'kevin@example.com', '5-5555-5555', 5, 5, 1);


INSERT INTO Vehiculo (Marca, Modelo, Precio, Id_Tipo_Combinacion, Cantidad_De_Puertas, Id_Estilo, Estado) VALUES
('Toyota', 'Corolla', 18500, 1, 4, 1, 1),
('Hyundai', 'Tucson', 22500, 2, 5, 2, 1),
('Suzuki', 'Swift', 14500, 1, 4, 3, 1),
('Ford', 'Ranger', 27000, 3, 2, 4, 1),
('Mazda', 'MX-5', 29000, 4, 2, 5, 1);


INSERT INTO Factura (Id_Empleado, Id_Cliente, Fecha_Hora, Id_Sede, Estado) VALUES
(1, 1, GETDATE(), 1, 1),
(2, 2, GETDATE(), 2, 1),
(3, 3, GETDATE(), 3, 1),
(4, 4, GETDATE(), 4, 1),
(5, 5, GETDATE(), 5, 1);


INSERT INTO Factura_Maestro_Detalle (Id_Factura, Id_Vehiculo, Estado) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);









