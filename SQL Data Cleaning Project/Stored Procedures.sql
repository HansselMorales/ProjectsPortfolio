-- Syntax for MySQL Procedure

--DELIMITER $$
--CREATE PROCEDURE Price(UniqueID INT)
--BEGIN
--	SELECT SalePrice
--	FROM CleaningProject.dbo.NashvilleHousing
--	WHERE UniqueID = UniqueID
--END $$

--DELIMITER ;

---------------------------------------------------------------------------------------------------------
-- Syntax for SQL Server Procedure

CREATE PROCEDURE Price(@UniqueID INT) AS
BEGIN
	SELECT SalePrice
	FROM CleaningProject.dbo.NashvilleHousing
	WHERE UniqueID = @UniqueID
END

EXEC Price 43107


ALTER PROCEDURE Price(@UniqueID INT) AS
BEGIN
	SELECT OwnerName, SaleDateConverted as SaleDate, SalePrice, 
	PropertySplitAddress as PropertyAddress, OwnerSplitAddress as OwnerAddress
	FROM CleaningProject.dbo.NashvilleHousing
	WHERE UniqueID = @UniqueID
END

EXEC Price 43107