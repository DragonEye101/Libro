/**a.	Cada libro pertenece a una categoría; se requiere conocer nombre y descripción de las categorías. **/
create table categoria
(
id int not null,
nombre varchar(20) not null,
descripcion varchar (40) not null,
primary key (id));

/**b.	Se desea conocer el sexo de los clientes. ***/
alter table cliente 
add sexo boolean;

/**c.	No se registrará la edad del cliente, sino su fecha de nacimiento. 
Se debe cambiar el tipo de dato en atributo edad, de smallint a date. **/
alter table cliente
modify column edad date;

alter table libro
add column categoria int (11);

alter table libro add 
constraint categoria_libro foreign key
(
categoria
)
references categoria(id)
on update cascade
on delete cascade;

/**a.	El stock total de libros por cada categoría. Debe aparecer el nombre de la categoría (cantidad, nombre). */
select sum(Stock) , nombre
from libro, categoria
where categoria = id
group by id;

/**b.	El nombre del libro más barato. **/
select min(Precio) as precio, Titulo_Nombre
from libro
order by Precio desc
limit 1;

/**c.	La cantidad de mujeres registradas por región. Debe aparecer el nombre de la región. **/
select count(sexo) as ' Cantidad de mujeres', Nombre_region
from cliente, comuna, region
where ID_Region = region_ID_Region
and ID_Comuna = comuna_ID_Comuna
and sexo = 0
group by ID_Region;

/**d.	Nombres y apellidos de clientes en una sola columna, sexo, edad, nombre región, nombre comuna,
 con los nombres de columnas Nombre_completo, sexo_cliente, Edad, Region, Comuna. **/
select concat(Nombre1_cliente, ' ' , Nombre2_cliente, ' ', Apellido_paterno_cliente, ' ', Apellido_materno_cliente) as nombre,
sexo, year(curdate())-year(edad) as edad, Nombre_region as region, Nombre_comuna as comuna
from cliente, comuna, region
where comuna_ID_Comuna = ID_Comuna
and region_ID_Region = ID_Region;

/**e.	Las comunas (con su respectiva región) donde vive gente que haya comprado alguna vez el libro “El Principito”. **/
select Nombre_comuna, Nombre_region
from comuna, region, cliente, compra, libro_has_compra, libro
where region_ID_Region = ID_Region
and comuna_ID_Comuna = ID_Comuna
and Cliente_RUT = RUT
and compra_ID_Compra = ID_Compra
and libro_ISBN = ISBN
and Titulo_Nombre = 'El Principito';

/**f.	El total de cada compra, su fecha, su IVA, forma de pago (nombre), nombre y apellido del cliente,
 solo de las compras hechas por mujeres, de montos superiores a $20000 hechas en noviembre del presente año (aplicable a cualquier año). **/
 
 /**h.	Cuantas veces ha sido comprado cada libro. Debe aparecer el nombre del libro. **/
 select count(*), Titulo_Nombre
 from libro, libro_has_compra
 where ISBN = libro_ISBN
 group by Titulo_Nombre ;
 
 
 /**INSERTS**/
 insert into autor values(1,'Neftali', 'Reyes', 'Basoalto', 1904-06-12, 'Chileno');
 insert into autor values(2,'Ester', 'Salas', 'Paz', 1902-02-28,'Chilena');
 
 insert into editorial values(1,'Alquimia editoriales', '+947184756');
 insert into editorial values(2,'Montacerdos', '+923857819');
 
  insert into categoria values (1,'Fantasia', 'Muy fantaseoso');
 insert into categoria values (2,'Software', 'Desarrollo de software');
 
 insert into libro values(07, 'Harry Potter', 123, 1997, 12, 15000,1,1);
 insert into libro values(08, 'Exprime el Mac', 153,2009,4,30000,2,2);
 

 
 insert into libro_has_autor values (07,1);
 insert into libro_has_autor values(08,2);
 
 insert into region values (8, 'Bio-Bio', 1);
 insert into region values (7, 'Maule', 2);
 
 insert into comuna values (1, 'Talcahuano', 8);
 insert into comuna values (2, 'Talca', 7);
 
 insert into cliente values ('1235-2', 'Bastian', 'Alonso', 'Araneda', 'Cea', '4785147', '123', '1998-04-02', 1, 1);
 insert into cliente values ('7855-8', 'Barbara', 'Andrea', 'Ortega', 'Gonzalez', '8762769', '321', '2000-05-25', 2, 0);
 
 insert into forma_pago values(1,'Efectivo');
 insert into forma_pago values(2, 'Debito');
 
 insert into compra values (1, 1000, 15000, '7855-8', 1, '2022-07-01');
 insert into compra values (2, 500, 30000, '1235-2', 2, '2022-07-01');
 
 insert into libro_has_compra values (07, 1, 1);
 insert into libro_has_compra values (08,2,1);
 
 

delimiter //
create function precio_dcto( precio smallint, dcto smallint)
returns smallint
begin
declare precio_final smallint;
set precio_final = precio - dcto;
return precio_final;
end;
//

select ID_Compra, total, Desc_compra, precio_dcto(total,Desc_compra)
from compra;
