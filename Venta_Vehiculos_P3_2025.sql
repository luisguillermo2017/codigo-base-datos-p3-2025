    --Crear una base de datos
-- PRUEBA DE CAMBIOS
USE Master;
GO
DROP DATABASE IF EXISTS Venta_Vehiculos_P3_2025;
GO

--Crear una base de datos
CREATE DATABASE Venta_Vehiculos_P3_2025;
GO


--Apuntar a la base de datos en la que deseas ejecutar los querys
USE Venta_Vehiculos_P3_2025;
GO
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
SELECT * FROM Cliente

--Crear la tabla Sede
CREATE TABLE Sede (
    Id_Sede TINYINT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    Descripcion NVARCHAR(200) NOT NULL,
    Telefono NVARCHAR(30) NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Sede PRIMARY KEY (Id_Sede)
);

--Consultar todos los datos de mi tabla
SELECT * FROM Sede


--Crear la tabla Puesto
CREATE TABLE Puesto (
    Id_Puesto TINYINT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    --Descripcion NVARCHAR(200) NULL,
    Descripcion NVARCHAR(200),
    Estado BIT NOT NULL,
    CONSTRAINT PK_Puesto PRIMARY KEY (Id_Puesto)
);

--Consultar todos los datos de mi tabla
SELECT * FROM Puesto

--Crear la tabla Tipo_Combinacion
CREATE TABLE Tipo_Combinacion (
    Id_Tipo_Combinacion TINYINT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    Descripcion NVARCHAR(200) NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Tipo_Combinacion PRIMARY KEY (Id_Tipo_Combinacion)
);

--Consultar todos los datos de mi tabla
SELECT * FROM Tipo_Combinacion


--Crear la tabla Estilo
CREATE TABLE Estilo (
    Id_Estilo TINYINT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(30) NOT NULL,
    Descripcion NVARCHAR(200) NOT NULL,
    Estado BIT NOT NULL,
    CONSTRAINT PK_Estilo PRIMARY KEY (Id_Estilo)
);

--Consultar todos los datos de mi tabla
SELECT * FROM Estilo

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

--Consultar todos los datos de mi tabla
SELECT * FROM Empleado

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
    CONSTRAINT FK_Vehiculo_TipoCombinacion FOREIGN KEY (Id_Tipo_Combinacion) REFERENCES Tipo_Combinacion(Id_Tipo_Combinacion),
    CONSTRAINT FK_Vehiculo_Estilo FOREIGN KEY (Id_Estilo) REFERENCES Estilo(Id_Estilo)
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
<<<<<<< HEAD
('Jorge', 'Alp�zar', 'Mej�a', '8555-5555', 'jorge@example.com', '5-0001-0001', '1995-04-08', 1);


INSERT INTO Sede (Nombre, Descripcion, Telefono, Estado) VALUES
('San Jos�', 'Sucursal principal en San Jos� centro', '2222-2222', 1),
('Alajuela', 'Sucursal ubicada en el centro de Alajuela', '2433-1122', 1),
('Heredia', 'Sucursal al norte de Heredia centro', '2266-3344', 1),
('Cartago', 'Sucursal cercana a la Bas�lica', '2555-7788', 1),
('Lim�n', 'Sucursal principal del Caribe', '2750-0000', 0);
=======
('Jorge', 'Alp zar', 'Mej a', '8555-5555', 'jorge@example.com', '5-0001-0001', '1995-04-08', 1);


INSERT INTO Sede (Nombre, Descripcion, Telefono, Estado) VALUES
('San Jos ', 'Sucursal principal en San Jos  centro', '2222-2222', 1),
('Alajuela', 'Sucursal ubicada en el centro de Alajuela', '2433-1122', 1),
('Heredia', 'Sucursal al norte de Heredia centro', '2266-3344', 1),
('Cartago', 'Sucursal cercana a la Bas lica', '2555-7788', 1),
('Lim n', 'Sucursal principal del Caribe', '2750-0000', 0);
>>>>>>> 841c17abaeec6fe1f4213a49dfe11eff232c29f4


INSERT INTO Puesto (Nombre, Descripcion, Estado) VALUES
('Gerente', 'Responsable de toda la sucursal', 1),
<<<<<<< HEAD
('Vendedor', 'Encargado de ventas y atenci�n al cliente', 1),
('Mec�nico', 'Responsable del mantenimiento de veh�culos', 1),
('Asistente', 'Asistente administrativo general', 1),
('Contador', 'Encargado del �rea financiera', 1);
=======
('Vendedor', 'Encargado de ventas y atenci n al cliente', 1),
('Mec nico', 'Responsable del mantenimiento de veh culos', 1),
('Asistente', 'Asistente administrativo general', 1),
('Contador', 'Encargado del  rea financiera', 1);
>>>>>>> 841c17abaeec6fe1f4213a49dfe11eff232c29f4


INSERT INTO Puesto (Nombre, Descripcion, Estado) VALUES
('Cajero', NULL, 1),
('Chofer', NULL, 1),
('Recepcionista', NULL, 1),
('Digitador', NULL, 1),
('Supervisor', NULL, 1);


INSERT INTO Tipo_Combinacion (Nombre, Descripcion, Estado) VALUES
<<<<<<< HEAD
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
=======
('Manual', 'Transmisi n manual', 1),
('Autom tica', 'Transmisi n autom tica', 1),
('Mixta', 'Transmisi n mixta (semi)', 1),
('El ctrico', 'Motor el ctrico sin marchas', 1),
('CVT', 'Transmisi n continuamente variable', 1);


INSERT INTO Estilo (Nombre, Descripcion, Estado) VALUES
('Sed n', 'Veh culo con carrocer a cl sica de 4 puertas', 1),
('SUV', 'Veh culo deportivo utilitario', 1),
('Hatchback', 'Compacto con maletera integrada', 1),
('Pickup', 'Veh culo con caj n de carga', 1),
>>>>>>> 841c17abaeec6fe1f4213a49dfe11eff232c29f4
('Convertible', 'Techo removible para viajes al aire libre', 1);


INSERT INTO Empleado (Nombre, Primer_Apellido, Segundo_Apellido, Telefono, Email, Cedula, Id_Sede, Id_Puesto, Estado) VALUES
<<<<<<< HEAD
('Oscar', 'Ram�rez', 'Z��iga', '8888-0001', 'oscar@example.com', '1-9999-9999', 1, 1, 1),
('Paola', 'Herrera', 'Solano', '8888-0002', 'paola@example.com', '2-8888-8888', 2, 2, 1),
('Roberto', 'Campos', 'Jim�nez', '8888-0003', 'roberto@example.com', '3-7777-7777', 3, 3, 1),
('Daniela', 'Alvarado', 'Vega', '8888-0004', 'daniela@example.com', '4-6666-6666', 4, 4, 1),
('Kevin', 'Salas', 'L�pez', '8888-0005', 'kevin@example.com', '5-5555-5555', 5, 5, 1);
=======
('Oscar', 'Ram rez', 'Z  iga', '8888-0001', 'oscar@example.com', '1-9999-9999', 1, 1, 1),
('Paola', 'Herrera', 'Solano', '8888-0002', 'paola@example.com', '2-8888-8888', 2, 2, 1),
('Roberto', 'Campos', 'Jim nez', '8888-0003', 'roberto@example.com', '3-7777-7777', 3, 3, 1),
('Daniela', 'Alvarado', 'Vega', '8888-0004', 'daniela@example.com', '4-6666-6666', 4, 4, 1),
('Kevin', 'Salas', 'L pez', '8888-0005', 'kevin@example.com', '5-5555-5555', 5, 5, 1);
>>>>>>> 841c17abaeec6fe1f4213a49dfe11eff232c29f4


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


--CRUD
--Create
--Read = simple o con parametros
--Update
--Delete = fisico o logico


--Vista
--Store Procedure

--Ejemplos de Read con parametros
--Where trae los datos donde se cumpla la condicion programa luego del where
SELECT * FROM Cliente WHERE Id_Cliente = 4
--Alias, sirve para ponerme un diminutivo o un alias a una tabla y asi llamar mas facil sus columnas
SELECT * FROM Cliente C WHERE C.Id_Cliente = 4
--Usando el alias para traer columnas
SELECT C.Email, C.Nombre FROM Cliente C WHERE C.Id_Cliente = 4
--Usando el alias para traer columnas y renombrando el nombre de una columna(alias)
SELECT C.Nombre AS 'Cliente', C.Email AS 'Correo'  FROM Cliente C WHERE C.Id_Cliente = 4
--Where para filtrar por texto
SELECT C.* FROM Cliente C WHERE C.Primer_Apellido = 'Loaiza'
--Where para filtrar por texto pero no sabiendo todos los datos
SELECT C.* FROM Cliente C WHERE C.Primer_Apellido LIKE 'Loa%'
SELECT C.* FROM Cliente C WHERE C.Primer_Apellido LIKE '%zar'
SELECT C.* FROM Cliente C WHERE C.Cedula LIKE '%7890%'

--Update
UPDATE Cliente SET Segundo_Apellido = 'Chavez', Email = 'anavargas@example.com'  WHERE Id_Cliente = 4   
--Update sin where, tener cuidado al ejecutar, solo cuando me conviene
UPDATE Cliente SET Telefono = '89736600' 
SELECT * FROM Cliente

--Delete
--Delete Fisico
DELETE Cliente WHERE Id_Cliente = 6


INSERT INTO Cliente (Nombre, Primer_Apellido, Segundo_Apellido, Telefono, Email, Cedula, Fecha_Nacimiento, Estado) VALUES
('Veronica', 'Loaiza', 'Cordero', '8888-8882', 'vero@example.com', '1-1234-1258', '1990-01-01', 1)

--Delete logico
SELECT * FROM Empleado
UPDATE Empleado SET Estado = 0 WHERE Id_Empleado = 3

<<<<<<< HEAD
--- fin del dia miercoles 18 Junio 2025
--- comentario final
=======
--View
--Vista: una consulta predefinida que puede traer diferentes resultados pero que su codigo nunca cambia
SELECT * FROM Cliente
SELECT * FROM Cliente WHERE Id_Cliente = 4

--Crear un view
CREATE OR ALTER VIEW V_Listar_Clientes
AS
SELECT * FROM Cliente WHERE Estado = 1

--Ejecutando un View
SELECT * FROM V_Listar_Clientes

--Segundo ejemplo de creaci n de una vista
CREATE VIEW V_Lista_Cliente_Unico
AS
SELECT 
* 
FROM Cliente 
WHERE Id_Cliente = 2
AND Estado = 1
AND Nombre = 'Mariana'

--Ejecuci n de la vista
SELECT * FROM V_Lista_Cliente_Unico

--Store Procedure
--Procedimiento almacenado. Sirve para guardar una consulta que permite traer datos de manera dinamica
SELECT * FROM Cliente WHERE Id_Cliente = 

--Crear un procedimiento almacenado
CREATE PROCEDURE SP_Cliente_Por_Id
(@Id_Cliente INT)
AS
BEGIN

    SELECT * FROM Cliente WHERE Id_Cliente = @Id_Cliente

END

--Ejecuci n formal de un SP
EXECUTE SP_Cliente_Por_Id @Id_Cliente = 4

--Creando un segundo SP
CREATE OR ALTER PROCEDURE SP_Cliente_Por_Id
(@Id_Cliente1 INT, @Id_Cliente2 INT)
AS
BEGIN

    SELECT * FROM Cliente WHERE Id_Cliente = @Id_Cliente1 OR Id_Cliente = @Id_Cliente2

END

EXECUTE SP_Cliente_Por_Id @Id_Cliente1 = 1, @Id_Cliente2 = 4


--Consulta para filtrar por rangos
SELECT * FROM Cliente WHERE Id_Cliente > 2
SELECT * FROM Cliente WHERE Id_Cliente > 2 AND Id_Cliente < 5
SELECT * FROM Cliente WHERE Id_Cliente IN(1,2,7)

--Crear un procedimiento almacenado con validaciones
CREATE OR ALTER PROCEDURE SP_Cliente_Por_Id
(@Id_Cliente INT)
AS
BEGIN

    IF(@Id_Cliente > 0)
    BEGIN
        SELECT * FROM Cliente WHERE Id_Cliente = @Id_Cliente
    END
    ELSE
    BEGIN
        SELECT 'Debes ingresar un id cliente'
    END
    
END

<<<<<<< HEAD
>>>>>>> 841c17abaeec6fe1f4213a49dfe11eff232c29f4
=======



--SP Create
--Read simple es una vista
--SP con Read con parametros
--SP update
--SP delete fisico
--SP delete logico


--Crear un SP para crear un cliente
CREATE PROCEDURE SP_Cliente_Insertar
(
@Nombre NVARCHAR(30),
@Primer_Apellido NVARCHAR(30),
@Segundo_Apellido NVARCHAR(30),
@Telefono NVARCHAR(30),
@Email NVARCHAR(50),
@Cedula NVARCHAR(30),
@Fecha_Nacimiento DATE
)
AS
BEGIN
    INSERT INTO Cliente (Nombre, Primer_Apellido, Segundo_Apellido, Telefono, Email, Cedula, Fecha_Nacimiento, Estado) VALUES
    (@Nombre, @Primer_Apellido, @Segundo_Apellido, @Telefono, @Email, @Cedula, @Fecha_Nacimiento, 1)
END

--Una nueva manera de ejecutar un SP
EXEC SP_Cliente_Insertar 'Fernanda', 'Loria', 'Castillo', '85201478', 'flc@outlook.es', '707770896', '1995-12-06'

SELECT * FROM Cliente

--SP para actualizar un cliente
CREATE PROCEDURE SP_Cliente_Actualizar
(
@Id_Cliente INT,
@Nombre NVARCHAR(30),
@Primer_Apellido NVARCHAR(30),
@Segundo_Apellido NVARCHAR(30),
@Telefono NVARCHAR(30),
@Email NVARCHAR(50),
@Cedula NVARCHAR(30),
@Fecha_Nacimiento DATE,
@Estado BIT
)
AS
BEGIN

    UPDATE 
    Cliente 
    SET
    Nombre = @Nombre,
    Primer_Apellido = @Primer_Apellido,
    Segundo_Apellido = @Segundo_Apellido, 
    Telefono = @Telefono,
    Email = @Email,
    Cedula = @Cedula,
    Fecha_Nacimiento = @Fecha_Nacimiento,
    Estado = @Estado
    WHERE Id_Cliente = @Id_Cliente

END

--Ejecuci n del SP Actualizar
EXEC SP_Cliente_Actualizar 8, 'Fernanda Gabriela', 'Vasquez', 'Cascante', '88665544', 'fgvc@hotmail.com', '707770896', '1995-12-06', 1

--Crear un SP para un delete fisico de un cliente
CREATE PROCEDURE SP_Cliente_Borrado_Fisico
(
@Id_Cliente INT
)
AS
BEGIN
    DELETE Cliente WHERE Id_Cliente = @Id_Cliente
END

--Ejecuci n del SP Delete Fisico
EXEC SP_Cliente_Borrado_Fisico 8

--Crear un SP para delete logico. Vamos a crear una funcionalidad para activar o desactivar
CREATE PROCEDURE SP_Cliente_Activar_Inactivar
(
@Id_Cliente INT,
@Estado BIT
)
AS
BEGIN
    UPDATE Cliente SET Estado = @Estado  WHERE Id_Cliente = @Id_Cliente
END

--Ejecuci n del SP delete fisico(activar o inactivar)
EXEC SP_Cliente_Activar_Inactivar 7,1


SELECT * FROM Cliente

--Otras consultas mas avanzadas
--Subquery
--Variables
--JOINS
--Triggers
--Devolver una respuesta en formato JSON
--Indices
--Backup de bases de datos
--Creaci n de usuarios
--Configuraci n de Puertos para que el motor sea consumido por un tercero
--DBA: Database Administrator

--TOP
SELECT TOP 4 * FROM Cliente

--Ejemplo de MYSQL para ver una diferencia
SELECT * FROM Cliente LIMIT 4

--MAX
SELECT MAX(Precio) AS 'Precio_maximo' FROM Vehiculo

--MIN
SELECT MIN(Precio) AS 'Precio_minimo' FROM Vehiculo

--CONCAT
SELECT 
CONCAT(E.Nombre, ' ', E.Primer_Apellido, ' ', E.Segundo_Apellido) AS 'Nombre Completo'
FROM 
Empleado E

--AVG
SELECT AVG(Precio) FROM Vehiculo

--COUNT
SELECT COUNT(*) AS 'Cantidad de Clientes' FROM Cliente

--Order by
SELECT * FROM Cliente ORDER BY Cedula
SELECT * FROM Cliente ORDER BY Cedula ASC
SELECT * FROM Cliente ORDER BY Cedula DESC

--Subquery
--Realizar una consulta dentro de otra consulta.

SELECT * FROM Empleado WHERE Id_Empleado = (SELECT Id_Empleado FROM Empleado WHERE Cedula = '4-6666-6666')

SELECT * FROM Factura WHERE Id_Empleado = (SELECT Id_Empleado FROM Empleado WHERE Cedula = '4-6666-6666')

>>>>>>> c96daced673e7d6fcb35b25e8f9da7217292fb1f
