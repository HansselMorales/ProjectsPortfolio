--Data Cleaning Project

SELECT *
FROM CleaningProject.dbo.NashvilleHousing

---------------------------------------------------------------------------------------------------

-- Step 1: Standardize Date Format

SELECT SaleDate, cast(SaleDate as date), CONVERT(date,SaleDate)
FROM CleaningProject.dbo.NashvilleHousing

ALTER TABLE NashvilleHousing
ADD SaleDateConverted Date

UPDATE NashvilleHousing
SET SaleDateConverted = CONVERT(date,SaleDate)

---------------------------------------------------------------------------------------------------

-- Populate Property Adress data

SELECT *
FROM CleaningProject.dbo.NashvilleHousing
ORDER BY ParcelID

select c1.ParcelID, c1.PropertyAddress, c2.ParcelID, c2.PropertyAddress, isnull(c1.PropertyAddress, c2.PropertyAddress)
from CleaningProject.dbo.NashvilleHousing c1
join CleaningProject.dbo.NashvilleHousing c2
	on c1.ParcelID = c2.ParcelID
	and c1.[UniqueID ] <> c2.[UniqueID ]
where c1.PropertyAddress is null

UPDATE c1
SET PropertyAddress = isnull(c1.PropertyAddress, c2.PropertyAddress)
FROM CleaningProject.dbo.NashvilleHousing c1
JOIN CleaningProject.dbo.NashvilleHousing c2
	ON c1.ParcelID = c2.ParcelID
	and c1.[UniqueID ] <> c2.[UniqueID ]


---------------------------------------------------------------------------------------------------

-- Breaking out Address into individual columns (Address, City, State)

SELECT PropertyAddress
FROM CleaningProject.dbo.NashvilleHousing
--ORDER BY ParcelID

SELECT
	SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1) as Address,
	SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) as City
FROM CleaningProject.dbo.NashvilleHousing


ALTER TABLE NashvilleHousing
ADD PropertySplitAddress nvarchar(250);

ALTER TABLE NashvilleHousing
ADD PropertySplitCity nvarchar(250);

UPDATE NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1)

UPDATE NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress))

SELECT *
FROM CleaningProject.dbo.NashvilleHousing



SELECT OwnerAddress
FROM CleaningProject.dbo.NashvilleHousing

SELECT PARSENAME(REPLACE(OwnerAddress,',', '.'), 3) as Address,
	PARSENAME(REPLACE(OwnerAddress,',', '.'), 2) as City,
	PARSENAME(REPLACE(OwnerAddress,',', '.'), 1) as State
FROM CleaningProject.dbo.NashvilleHousing


ALTER TABLE NashvilleHousing
ADD OwnerSplitAddress nvarchar(250);

ALTER TABLE NashvilleHousing
ADD OwnerSplitCity nvarchar(250);

ALTER TABLE NashvilleHousing
ADD OwnerSplitState nvarchar(250);

UPDATE NashvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',', '.'), 3)

UPDATE NashvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',', '.'), 2)

UPDATE NashvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',', '.'), 1)


---------------------------------------------------------------------------------------------------

-- Change Y and N to Yes and No in "Sold as Vacant" field

SELECT distinct SoldAsVacant, count(SoldAsVacant)
FROM CleaningProject.dbo.NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY 2 DESC

SELECT SoldAsVacant,
	CASE
		WHEN SoldAsVacant = 'N' THEN 'No'
		WHEN SoldAsVacant = 'Y' THEN 'Yes'
		ELSE SoldAsVacant END AS SoldAsVacantMod
FROM CleaningProject.dbo.NashvilleHousing
where SoldAsVacant in ('Y', 'N')

UPDATE NashvilleHousing
SET SoldAsVacant = CASE
		WHEN SoldAsVacant = 'N' THEN 'No'
		WHEN SoldAsVacant = 'Y' THEN 'Yes'
		ELSE SoldAsVacant END


---------------------------------------------------------------------------------------------------

--  Remove Duplicates

WITH RowNumCTE AS (
SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY ParcelId,
				PropertyAddress,
				SalePrice,
				SaleDate,
				LegalReference
	ORDER BY UniqueId
			) row_num
FROM CleaningProject.dbo.NashvilleHousing
--ORDER BY ParcelID
)


SELECT *
FROM RowNumCTE
WHERE row_num > 1
ORDER BY PropertyAddress;


DELETE
FROM RowNumCTE
WHERE row_num > 1

SELECT *
FROM RowNumCTE
WHERE row_num > 1
--ORDER BY PropertyAddress;


SELECT count(*) -- To compare previous number of rows with number of rows after removing duplicates
FROM CleaningProject.dbo.NashvilleHousing

---------------------------------------------------------------------------------------------------

-- Update Unused Columns

SELECT *
FROM CleaningProject.dbo.NashvilleHousing


ALTER TABLE CleaningProject.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE CleaningProject.dbo.NashvilleHousing
DROP COLUMN SaleDate
