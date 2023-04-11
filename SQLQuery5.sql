-- Standardize Date Format 

SELECT * 
FROM PortfolioProject1.dbo.NashvilleHousing;

SELECT SaleDateConverted, CONVERT(Date,SaleDate)
FROM PortfolioProject1.dbo.NashvilleHousing;

Update NashvilleHousing
SET SaleDate = Convert(date,Saledate)

ALTER Table NashvilleHousing
ADD SaleDateConverted Date;

Update NashvilleHousing
SET SaleDateConverted = Convert(date,Saledate)


-- Populate Property Address Data

SELECT *
FROM PortfolioProject1.dbo.NashvilleHousing
--WHERE PropertyAddress is null
ORDER BY ParcelID

SELECT a.ParcelId, a.PropertyAddress, b.ParcelId, b.PropertyAddress, ISNULL(a.PropertyAddress,b.PropertyAddress)
FROM PortfolioProject1.dbo.NashvilleHousing a
JOIN PortfolioProject1.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
where a.PropertyAddress is null

Update a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From PortfolioProject1.dbo.NashvilleHousing a
JOIN PortfolioProject1.dbo.NashvilleHousing b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

-- Breaking out Address into Individual Columns (Address, City, State)

SELECT PropertyAddress
FROM PortfolioProject1.dbo.NashvilleHousing
--WHERE PropertyAddress is null
--ORDER BY ParcelID

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) AS Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress)) as Address

FROM PortfolioProject1.dbo.NashvilleHousing



ALTER Table PortfolioProject1.dbo.NashvilleHousing
ADD PropertySplitAddress Nvarchar(255);

Update PortfolioProject1.dbo.NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )


ALTER Table PortfolioProject1.dbo.NashvilleHousing
ADD PropertySplitCity Nvarchar(255);

Update PortfolioProject1.dbo.NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))


Select *
FROM PortfolioProject1.dbo.NashvilleHousing


Select OwnerAddress
FROM PortfolioProject1.dbo.NashvilleHousing


SELECT 
PARSENAME(Replace(OwnerAddress, ',', '.') , 3)
,PARSENAME(Replace(OwnerAddress, ',', '.') , 2)
,PARSENAME(Replace(OwnerAddress, ',', '.') , 1)
FROM PortfolioProject1.dbo.NashvilleHousing






ALTER Table PortfolioProject1.dbo.NashvilleHousing
ADD OwnerSplitAddress Nvarchar(255);

Update PortfolioProject1.dbo.NashvilleHousing
SET OwnerSplitAddress = PARSENAME(Replace(OwnerAddress, ',', '.') , 3)


ALTER Table PortfolioProject1.dbo.NashvilleHousing
ADD OwnerSplitCity Nvarchar(255);

Update PortfolioProject1.dbo.NashvilleHousing
SET PropertySplitAddress = PARSENAME(Replace(OwnerAddress, ',', '.') , 2)

ALTER Table PortfolioProject1.dbo.NashvilleHousing
ADD OwnerSplitState Nvarchar(255);

Update PortfolioProject1.dbo.NashvilleHousing
SET OwnerSplitAddress = PARSENAME(Replace(OwnerAddress, ',', '.') , 1)

SELECT * 
FROM PortfolioProject1.dbo.NashvilleHousing

-- Change Y and N to Yes and No in "Sold as Vacant" field

SELECT DISTINCT(SoldAsVacant), Count(SoldAsVacant)
FROM PortfolioProject1.dbo.NashvilleHousing
Group By SoldAsVacant
Order by 2


SELECT SoldAsVacant,
Case when SoldAsVacant = 'Y' then 'Yes'
	 when SoldAsVacant = 'N' then 'No'
	 Else SoldAsVacant
	 End
FROM PortfolioProject1.dbo.NashvilleHousing

UPDATE PortfolioProject1.dbo.NashvilleHousing
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' Then 'Yes'
	   When SoldAsVacant = 'N' Then 'No'
	   Else SoldAsVacant
	   END


-- Remove Duplicates 

WITH RowNumCTE AS(
SELECT *, 
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

FROM PortfolioProject1.dbo.NashvilleHousing
--ORDER by ParcelID
)
DELETE
from RowNumCTE
WHERE row_num > 1
--ORDER by PropertyAddress



--Delete Unused Columns



SELECT *
FROM PortfolioProject1.dbo.NashvilleHousing

ALTER TABLE PortfolioProject1.dbo.NashvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE PortfolioProject1.dbo.NashvilleHousing
DROP COLUMN SaleDate










