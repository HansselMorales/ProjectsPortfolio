-- Data Cleaning

select *
FROM [SacoLogsSatProject].[dbo].['23-03']

-- Converting [TIEMPO DE CONEXIÓN] nvarchar values (03h 15m) into numeric values (3.25) which represent connections in hours (decimal)
select [TIEMPO DE CONEXIÓN],
		CAST(REPLACE(
		(CASE
			WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
			ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
			'h','') AS int), --Query to convert hour values with string format into integer values
		
		CAST( REPLACE( CASE
			WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
			ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT), --Query to convert minute values with string format into integer values
		-- Sum of hours and (minutes divided by 60) to obtain decimal hour values
		ROUND(
			CASE
				WHEN
					CAST(REPLACE(
					(CASE
						WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
						ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
						'h','') AS int) IS NULL THEN 0
				ELSE 
					CAST(REPLACE(
					(CASE
					WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
					ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
					'h','') AS int) END
					+
				CAST( REPLACE( CASE
					WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
					ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)
FROM [SacoLogsSatProject].[dbo].['06-01 (2)']


-- Adding new columns TIEMPO_CONEXIÓN to tables
ALTER TABLE [SacoLogsSatProject].[dbo].['06-01']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['06-01 (2)']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['20-01']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['27-01']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['03-02']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['10-02']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['17-02']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['24-02']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['02-03']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['09-03']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['16-03']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['23-03']
ADD TIEMPO_CONEXION float

ALTER TABLE [SacoLogsSatProject].[dbo].['30-03']
ADD TIEMPO_CONEXION float



-- Populating new columns with values in decimal format (hours)

UPDATE [SacoLogsSatProject].[dbo].['06-01']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)


UPDATE [SacoLogsSatProject].[dbo].['06-01 (2)']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['20-01']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['27-01']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['03-02']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['10-02']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['17-02']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['24-02']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['02-03']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['09-03']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['16-03']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['23-03']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)

UPDATE [SacoLogsSatProject].[dbo].['30-03']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)


---------------------------------------------------------------------------------------------------------------------------------------------------

-- Dropping unused columns

ALTER TABLE [SacoLogsSatProject].[dbo].['06-01']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°], [F8]

ALTER TABLE [SacoLogsSatProject].[dbo].['06-01 (2)']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°], [F8]

ALTER TABLE [SacoLogsSatProject].[dbo].['20-01']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°], [F8]

ALTER TABLE [SacoLogsSatProject].[dbo].['27-01']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°], [F8]

ALTER TABLE [SacoLogsSatProject].[dbo].['03-02']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°], [F8]

ALTER TABLE [SacoLogsSatProject].[dbo].['10-02']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°]

ALTER TABLE [SacoLogsSatProject].[dbo].['17-02']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°]

ALTER TABLE [SacoLogsSatProject].[dbo].['24-02']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°], [F8]

ALTER TABLE [SacoLogsSatProject].[dbo].['02-03']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°]

ALTER TABLE [SacoLogsSatProject].[dbo].['09-03']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°]

ALTER TABLE [SacoLogsSatProject].[dbo].['16-03']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°]

ALTER TABLE [SacoLogsSatProject].[dbo].['23-03']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°]

ALTER TABLE [SacoLogsSatProject].[dbo].['30-03']
DROP COLUMN [TIEMPO DE CONEXIÓN], COMENTARIOS, [N°], [F8]

---------------------------------------------------------------------------------------------------------------------------------------------------

-- Changing wrong date in ['06-01 (2)']
UPDATE [SacoLogsSatProject].[dbo].['06-01 (2)']
SET FECHA = FECHA + 7


---------------------------------------------------------------------------------------------------------------------------------------------------

-- Creating Employees Table

-- Unioning all existing tables
WITH CTEAllMonths AS (
select *
from SacoLogsSatProject.dbo.['06-01']
UNION ALL
select *
from SacoLogsSatProject.dbo.['06-01 (2)']
UNION ALL
select *
from SacoLogsSatProject.dbo.['20-01']
UNION ALL
select *
from SacoLogsSatProject.dbo.['27-01']
UNION ALL
select *
from SacoLogsSatProject.dbo.['03-02']
UNION ALL
select *
from SacoLogsSatProject.dbo.['10-02']
UNION ALL
select *
from SacoLogsSatProject.dbo.['17-02']
UNION ALL
select *
from SacoLogsSatProject.dbo.['24-02']
UNION ALL
select *
from SacoLogsSatProject.dbo.['02-03']
UNION ALL
select *
from SacoLogsSatProject.dbo.['09-03']
UNION ALL
select *
from SacoLogsSatProject.dbo.['16-03']
UNION ALL
select *
from SacoLogsSatProject.dbo.['23-03']
UNION ALL
select *
from SacoLogsSatProject.dbo.['30-03']
),

-- Assigning an unique value to each employee
CTERanked AS 
(SELECT *, DENSE_RANK() OVER(ORDER BY [NOMBRE Y APELLIDOS]) RankedColumn
FROM CTEAllMonths),

-- Formatting unique values to obtain unique codes for each employee
CTEWithEmpUC AS
(SELECT *, 
	CASE
		WHEN RankedColumn < 10 THEN CONCAT('E00', RankedColumn)
		ELSE CONCAT('E0', RankedColumn)
	END AS EMPLEADO_UC
FROM CTERanked)

-- Creating Employees Table
CREATE TABLE SacoLogsSatProject.dbo.Employees
(EMPLEADO_UC nvarchar(50) PRIMARY KEY NOT NULL,
[NOMBRE Y APELLIDOS] varchar(200),
DEPARTAMENTO varchar(150)
)

-- Inserting values from existing CTEWithEMpUC table (must be run along with CTEs code)
INSERT INTO SacoLogsSatProject.dbo.Employees (EMPLEADO_UC, [NOMBRE Y APELLIDOS], DEPARTAMENTO)
SELECT DISTINCT EMPLEADO_UC, [NOMBRE Y APELLIDOS], DEPARTAMENTO
FROM CTEWithEmpUC

-- Voilá!! Table created
SELECT *
FROM Employees

------------------------------------------------------------------------------------------------------------------------------

-- Adding new column EMPLEADO_UC to tables
ALTER TABLE SacoLogsSatProject.dbo.['06-01']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['06-01 (2)']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['20-01']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['27-01']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['03-02']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['10-02']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['17-02']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['24-02']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['02-03']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['09-03']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['16-03']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['23-03']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['30-03']
ADD EMPLEADO_UC nvarchar(50)

-- Populating new column EMPLEADO_UC with unique codes for each employee
UPDATE SacoLogsSatProject.dbo.['06-01']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['06-01'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['06-01 (2)']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['06-01 (2)'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['20-01']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['20-01'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['27-01']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['27-01'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['03-02']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['03-02'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['10-02']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['10-02'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['17-02']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['17-02'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['24-02']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['24-02'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['02-03']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['02-03'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['09-03']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['09-03'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['16-03']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['16-03'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['23-03']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['23-03'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

UPDATE SacoLogsSatProject.dbo.['30-03']
SET EMPLEADO_UC = e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['30-03'] s
JOIN SacoLogsSatProject.dbo.Employees e
ON s.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

SELECT e.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['30-03'] s3003
JOIN SacoLogsSatProject.dbo.Employees e
ON s3003.[NOMBRE Y APELLIDOS] = e.[NOMBRE Y APELLIDOS]

SELECT *
FROM SacoLogsSatProject.dbo.['30-03']

SELECT *
FROM [SacoLogsSatProject].[dbo].['06-01 (2)']


-- It is important to mention that since employees' personal information is confidential, the public version of the dashboard will only contain EMPLEADO_UC
-- to identify each employee


------------------------------------------------------------------------------------------------------------------------------
-- Cleaning values with TIEMPO_CONEXION > allowed (employees were allowed to connect for up to: 4 hours in Jan and 5 hours in the next months)

UPDATE SacoLogsSatProject.dbo.['06-01']
SET TIEMPO_CONEXION = 4
WHERE TIEMPO_CONEXION > 4

UPDATE SacoLogsSatProject.dbo.['06-01 (2)']
SET TIEMPO_CONEXION = 4
WHERE TIEMPO_CONEXION > 4

UPDATE SacoLogsSatProject.dbo.['20-01']
SET TIEMPO_CONEXION = 4
WHERE TIEMPO_CONEXION > 4

UPDATE SacoLogsSatProject.dbo.['27-01']
SET TIEMPO_CONEXION = 4
WHERE TIEMPO_CONEXION > 4

UPDATE SacoLogsSatProject.dbo.['03-02']
SET TIEMPO_CONEXION = 5
WHERE TIEMPO_CONEXION > 5

UPDATE SacoLogsSatProject.dbo.['10-02']
SET TIEMPO_CONEXION = 5
WHERE TIEMPO_CONEXION > 5

UPDATE SacoLogsSatProject.dbo.['17-02']
SET TIEMPO_CONEXION = 5
WHERE TIEMPO_CONEXION > 5

UPDATE SacoLogsSatProject.dbo.['24-02']
SET TIEMPO_CONEXION = 5
WHERE TIEMPO_CONEXION > 5

UPDATE SacoLogsSatProject.dbo.['02-03']
SET TIEMPO_CONEXION = 5
WHERE TIEMPO_CONEXION > 5

UPDATE SacoLogsSatProject.dbo.['09-03']
SET TIEMPO_CONEXION = 5
WHERE TIEMPO_CONEXION > 5

UPDATE SacoLogsSatProject.dbo.['16-03']
SET TIEMPO_CONEXION = 5
WHERE TIEMPO_CONEXION > 5

UPDATE SacoLogsSatProject.dbo.['23-03']
SET TIEMPO_CONEXION = 5
WHERE TIEMPO_CONEXION > 5

UPDATE SacoLogsSatProject.dbo.['30-03']
SET TIEMPO_CONEXION = 5
WHERE TIEMPO_CONEXION > 5



------------------------------------------------------------------------------------------------------------------------------
-- Correcting duplicate values for the employee 'Palomino Cueva, Katherine Lucia'

-- Updating Employees table
UPDATE SacoLogsSatProject.dbo.Employees
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

-- Updating tables ['06-01'], ['06-01 (2)'], ['20-01'], ['27-01'], ['03-02'], ['10-02']
-- Changing column [NOMBRE Y APELLIDOS] since the employee only appears once within those tables
UPDATE SacoLogsSatProject.dbo.['06-01']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

UPDATE SacoLogsSatProject.dbo.['06-01 (2)']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

UPDATE SacoLogsSatProject.dbo.['20-01']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

UPDATE SacoLogsSatProject.dbo.['27-01']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

UPDATE SacoLogsSatProject.dbo.['03-02']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

UPDATE SacoLogsSatProject.dbo.['10-02']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

-- Updating table ['17-02']
-- Multiple changes since the employee appears twice within the table
-- Since connection was registered for EMPLEADO_UC = 'E025' (row that contains wrong employee's department information):
-- Setting DEPARTAMENTO = 'Comercial'
UPDATE SacoLogsSatProject.dbo.['17-02']
SET DEPARTAMENTO = 'Comercial'
WHERE EMPLEADO_UC = 'E025'

-- Changing EMPLEADO_UC = 'E025' to be EMPLEADO_UC = 'E027'
UPDATE SacoLogsSatProject.dbo.['17-02']
SET EMPLEADO_UC = 'E027'
WHERE EMPLEADO_UC = 'E025'

-- Deleting row with no registered connection (EMPLEADO_UC = 'E027' AND SacoLogsSatProject.dbo.['17-02'].[¿SE CONECTÓ?] = 'NO')
-- Conserving row with EMPLEADO_UC = 'E027' AND SacoLogsSatProject.dbo.['17-02'].[¿SE CONECTÓ?] = 'SÍ'
DELETE
FROM SacoLogsSatProject.dbo.['17-02']
WHERE EMPLEADO_UC = 'E027' AND SacoLogsSatProject.dbo.['17-02'].[¿SE CONECTÓ?] = 'NO'


-- Updating tables ['24-02'], ['02-03'], ['09-03'], ['16-03'], ['23-03'], ['30-03']
-- Multiple changes since the employee appears twice within the table
-- Since connection was registered for EMPLEADO_UC = 'E027' (row that contains incomplete employee's names):
-- Updating [NOMBRE Y APELLIDOS] with complete names and deleting row with EMPLEADO_UC = 'E025' (wrong employee's department information)
UPDATE SacoLogsSatProject.dbo.['24-02']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

DELETE
FROM SacoLogsSatProject.dbo.['24-02']
WHERE EMPLEADO_UC = 'E025'

UPDATE SacoLogsSatProject.dbo.['02-03']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

DELETE
FROM SacoLogsSatProject.dbo.['02-03']
WHERE EMPLEADO_UC = 'E025'

UPDATE SacoLogsSatProject.dbo.['09-03']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

DELETE
FROM SacoLogsSatProject.dbo.['09-03']
WHERE EMPLEADO_UC = 'E025'

UPDATE SacoLogsSatProject.dbo.['16-03']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

DELETE
FROM SacoLogsSatProject.dbo.['16-03']
WHERE EMPLEADO_UC = 'E025'

UPDATE SacoLogsSatProject.dbo.['23-03']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

DELETE
FROM SacoLogsSatProject.dbo.['23-03']
WHERE EMPLEADO_UC = 'E025'

UPDATE SacoLogsSatProject.dbo.['30-03']
SET [NOMBRE Y APELLIDOS] = 'Palomino Cueva, Katherine Lucia'
WHERE EMPLEADO_UC = 'E027'

DELETE
FROM SacoLogsSatProject.dbo.['30-03']
WHERE EMPLEADO_UC = 'E025'



-- Deleting EMPLEADO_UC = 'E025' in Employees table
DELETE
FROM SacoLogsSatProject.dbo.Employees
WHERE EMPLEADO_UC = 'E025'

SELECT *
FROM SacoLogsSatProject.dbo.['30-03']

----------------------------------------------------------------------------------------------------------------
-- Changing department values for employees who now are part of Ventas department

-- Employees table
SELECT *
FROM SacoLogsSatProject.dbo.Employees

UPDATE SacoLogsSatProject.dbo.Employees
SET DEPARTAMENTO = 'Ventas'
WHERE EMPLEADO_UC = 'E003'

UPDATE SacoLogsSatProject.dbo.Employees
SET DEPARTAMENTO = 'Ventas'
WHERE EMPLEADO_UC = 'E004'

UPDATE SacoLogsSatProject.dbo.Employees
SET DEPARTAMENTO = 'Ventas'
WHERE EMPLEADO_UC = 'E024'

-- The other tables
SELECT b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['06-01'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['06-01']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['06-01'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['06-01 (2)']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['06-01 (2)'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['20-01']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['20-01'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['27-01']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['27-01'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['03-02']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['03-02'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['10-02']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['10-02'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['17-02']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['17-02'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['24-02']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['24-02'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['02-03']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['02-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['09-03']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['09-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['16-03']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['16-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['23-03']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['23-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['30-03']
SET DEPARTAMENTO = b.DEPARTAMENTO
FROM SacoLogsSatProject.dbo.['30-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

----------------------------------------------------------------------------------------------------------------

-- APRIL DATA UPDATES

SELECT *
FROM SacoLogsSatProject.dbo.['06-04']



-- Checking out values in NOMBRE Y APELLIDOS column that have changed
SELECT *
FROM SacoLogsSatProject.dbo.['06-04'] a
FULL JOIN SacoLogsSatProject.dbo.Employees b
ON a.[NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
--WHERE b.[NOMBRE Y APELLIDOS] IS NULL


-- Updating values in NOMBRE Y APELLIDO column on Employees table (some previous employees' full name values were not complete)
SELECT *
FROM Employees

UPDATE SacoLogsSatProject.dbo.Employees
SET [NOMBRE Y APELLIDOS] = 'Cuentas Sachay, Claudia Raquel'
WHERE EMPLEADO_UC = 'E009'

UPDATE SacoLogsSatProject.dbo.Employees
SET [NOMBRE Y APELLIDOS] = 'Diaz Diaz, Dimberly Diane'
WHERE EMPLEADO_UC = 'E012'

UPDATE SacoLogsSatProject.dbo.Employees
SET [NOMBRE Y APELLIDOS] = 'Garay Rodriguez, Jessica Katherine'
WHERE EMPLEADO_UC = 'E015'

UPDATE SacoLogsSatProject.dbo.Employees
SET [NOMBRE Y APELLIDOS] = 'Rodriguez Gonzaga, Rosita Angelica'
WHERE EMPLEADO_UC = 'E033'

-- Adding new employees to Employees table
INSERT INTO Employees
VALUES ('E038', 'Flores Carita, Christian', 'Operaciones Impo')


-- Adding new columns TIEMPO_CONEXION to April tables
ALTER TABLE SacoLogsSatProject.dbo.['06-04']
ADD TIEMPO_CONEXION float

ALTER TABLE SacoLogsSatProject.dbo.['13-04']
ADD TIEMPO_CONEXION float

ALTER TABLE SacoLogsSatProject.dbo.['20-04']
ADD TIEMPO_CONEXION float

ALTER TABLE SacoLogsSatProject.dbo.['27-04']
ADD TIEMPO_CONEXION float


-- Populating TIEMPO_CONEXION column with decimal-formatted values
UPDATE [SacoLogsSatProject].[dbo].['06-04']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)


UPDATE [SacoLogsSatProject].[dbo].['13-04']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)


UPDATE [SacoLogsSatProject].[dbo].['20-04']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)


UPDATE [SacoLogsSatProject].[dbo].['27-04']
SET TIEMPO_CONEXION = ROUND(
						CASE
							WHEN
								CAST(REPLACE(
								(CASE
									WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
									ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
									'h','') AS int) IS NULL THEN 0
							ELSE 
								CAST(REPLACE(
								(CASE
								WHEN REPLACE([TIEMPO DE CONEXIÓN], ' ','.') LIKE '%m'THEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),2)
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN], ' ','.'),1) END),
								'h','') AS int) END
								+
							CAST( REPLACE( CASE
								WHEN PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) LIKE '%h' THEN '0'
								ELSE PARSENAME(REPLACE([TIEMPO DE CONEXIÓN],' ','.'),1) END,'m','') AS INT)*1.0/60,2)


-- Adding new column EMPLEADO_UC to April tables
SELECT b.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['06-04'] a
FULL JOIN SacoLogsSatProject.dbo.Employees b
ON a.[NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
WHERE a.[NOMBRE Y APELLIDOS] IS NOT NULL

ALTER TABLE SacoLogsSatProject.dbo.['06-04']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['13-04']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['20-04']
ADD EMPLEADO_UC nvarchar(50)

ALTER TABLE SacoLogsSatProject.dbo.['27-04']
ADD EMPLEADO_UC nvarchar(50)


-- Populating EMPLEADO_UC column
UPDATE SacoLogsSatProject.dbo.['06-04']
SET EMPLEADO_UC = b.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['06-04'] a
FULL JOIN SacoLogsSatProject.dbo.Employees b
ON a.[NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
WHERE a.[NOMBRE Y APELLIDOS] IS NOT NULL

UPDATE SacoLogsSatProject.dbo.['13-04']
SET EMPLEADO_UC = b.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['13-04'] a
FULL JOIN SacoLogsSatProject.dbo.Employees b
ON a.[NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
WHERE a.[NOMBRE Y APELLIDOS] IS NOT NULL

UPDATE SacoLogsSatProject.dbo.['20-04']
SET EMPLEADO_UC = b.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['20-04'] a
FULL JOIN SacoLogsSatProject.dbo.Employees b
ON a.[NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
WHERE a.[NOMBRE Y APELLIDOS] IS NOT NULL

UPDATE SacoLogsSatProject.dbo.['27-04']
SET EMPLEADO_UC = b.EMPLEADO_UC
FROM SacoLogsSatProject.dbo.['27-04'] a
FULL JOIN SacoLogsSatProject.dbo.Employees b
ON a.[NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
WHERE a.[NOMBRE Y APELLIDOS] IS NOT NULL

SELECT *
FROM SacoLogsSatProject.dbo.['27-04']


-- Dropping unused colummns
ALTER TABLE SacoLogsSatProject.dbo.['06-04']
DROP COLUMN COMENTARIOS, [N°], [TIEMPO DE CONEXIÓN]

ALTER TABLE SacoLogsSatProject.dbo.['13-04']
DROP COLUMN COMENTARIOS, [N°], [TIEMPO DE CONEXIÓN]

ALTER TABLE SacoLogsSatProject.dbo.['20-04']
DROP COLUMN COMENTARIOS, [N°], [TIEMPO DE CONEXIÓN]

ALTER TABLE SacoLogsSatProject.dbo.['27-04']
DROP COLUMN COMENTARIOS, [N°], [TIEMPO DE CONEXIÓN]



-- Updating values in NOMBRE Y APELLIDO column on previous tables (some previous employees' full name values were not complete)
SELECT b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['30-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC


UPDATE SacoLogsSatProject.dbo.['06-01']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['06-01'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['06-01 (2)']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['06-01 (2)'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['20-01']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['20-01'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['27-01']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['27-01'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['03-02']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['03-02'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['10-02']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['10-02'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['17-02']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['17-02'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['24-02']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['24-02'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['02-03']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['02-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['09-03']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['09-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['16-03']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['16-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['23-03']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['23-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC

UPDATE SacoLogsSatProject.dbo.['30-03']
SET [NOMBRE Y APELLIDOS] = b.[NOMBRE Y APELLIDOS]
FROM SacoLogsSatProject.dbo.['30-03'] a
JOIN SacoLogsSatProject.dbo.Employees b
ON a.EMPLEADO_UC = b.EMPLEADO_UC
