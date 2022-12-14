Create database Vehiculos

use Vehiculos

create table Placa
(
IdPlaca int identity primary key,
NumPlaca varchar(6) unique,
IdUsuario int,
Monto money default 0,
constraint FK_IdUsuario FOREIGN KEY (IdUsuario) references Usuarios(IdUsuario)

)
create table Usuarios
(
IdUsuario int identity primary key,
Usuario varchar(50) unique,
clave varchar(30),
Nombre varchar(50),
Apellido varchar(50)

)

---PROCEDIMIENTO DE ALAMECENADO TABLA USUARIOS---
create procedure IngresarUsuarios
@Usuario varchar(50),
@Clave varchar(30),
@Nombre varchar(50),
@Apellido varchar(30)
as
begin
insert into Usuarios(Usuario,Clave,Nombre,Apellido) values(@Usuario, @Clave, @Nombre,@Apellido) 
end
exec IngresarUsuarios  'Mari@uh.com', '111','Mari', 'Pérez'

create procedure BorrarUsuario
@IdUsuario int
 as
 begin
 delete Usuarios where IdUsuario =@IdUsuario
 end
 exec BorrarUsuario 10

 create procedure ActualizarUsuarios
@IdUsuario int,
@Clave varchar(30),
@Nombre varchar(50),
@Apellido varchar(50)
as
 begin
 update Usuarios set  Clave=@Clave, Nombre=@Nombre, Apellido=@Apellido where IdUsuario  = @IdUsuario
 end
 exec ActualizarUsuarios 2,'222', 'David', 'Segura'


 create procedure llenartabla
 as
 begin
 Select *from Usuarios 
 end
create procedure ConsultaUsuario
@IdUsuario int
 as
 begin
 Select Usuario, Clave, Nombre, Apellido from Usuarios where IdUsuario =@IdUsuario
 end
 exec ConsultaUsuario 2

 create procedure ValidarUsuarios
 @Usuario varchar(30),
 @Clave varchar(30)
 as
 begin
 select *from Usuarios where Usuario=@Usuario and Clave=@Clave
 end
 exec ValidarUsuarios 'Mari@uh.com' ,'111'

 ---PROCEDIMIENTO DE ALAMECENADO TABLA PLACAS---
create procedure IngresarPlaca
@NumPlaca varchar(6),
@IdUsuario int,
@Monto money 
as
begin
insert into Placa(NumPlaca,IdUsuario,Monto) values(@NumPlaca, @IdUsuario, @Monto) 
end
exec IngresarPlaca  'ABC129', '1', '300'

create procedure BorrarPlaca
@IdPlaca int
 as
 begin
 delete Placa where IdPlaca =@IdPlaca
 end
 exec BorrarPlaca 2

 create procedure ActualizarPlaca
@IdPlaca int,
@NumPlaca varchar(6),
@IdUsuario int,
@Monto Money
as
 begin
 update Placa set  NumPlaca=@NumPlaca, IdUsuario=@IdUsuario, Monto=@Monto where IdPlaca  = @IdPlaca
 end
 exec ActualizarPlaca  1, 'ABC111', '1', '300'


 create procedure llenartabla1
 as
 begin
 Select *from Placa 
 end

CREATE procedure ConsultaPlaca
@IdPlaca int

 as
 begin
 Select *from Placa where IdPlaca =@IdPlaca
 end
 exec ConsultaPlaca 1

