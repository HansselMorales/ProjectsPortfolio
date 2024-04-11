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
