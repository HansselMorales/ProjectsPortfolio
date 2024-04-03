select *
from xyz_co;

-- CTE for cleaning and formatting columns' headers
with T1 as (
select
	dense_rank() over(order by NOMBRES_Y_APELLIDOS) CODE_EMPLEADO,
	case
		when DEPARTAMENTO like 'Adminis%' then 'Administración'
		when DEPARTAMENTO like 'A%reo' then 'Aéreo'
		else DEPARTAMENTO
	end as DEPARTAMENTO,
	FECHA,
	case
		when `�SE CONECT�?` like 'S%' then 'SÍ'
		else `�SE CONECT�?`
	end as SE_CONECTÓ,
	TIEMPO_DE_CONEXI�N TIEMPO_DE_CONEXIÓN,
	COMENTARIOS
from (
select trim('"' from NOMBRE_Y_APELLIDOS) NOMBRES_Y_APELLIDOS,
DEPARTAMENTO,
FECHA,
`�SE CONECT�?`,
TIEMPO_DE_CONEXI�N,
COMENTARIOS
from xyz_co) a
order by FECHA asc, DEPARTAMENTO asc)

-- Assigning a code for each employee (employees' personal information is private). Final table to export
select
case
when CODE_EMPLEADO < 10 then concat('E00',CODE_EMPLEADO)
else concat('E0',CODE_EMPLEADO)
end as CODE_EMPLEADO,
FECHA,
SE_CONECTÓ,
TIEMPO_DE_CONEXIÓN,
COMENTARIOS
from T1;
