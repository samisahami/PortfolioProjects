/**********************************************************************************************
SECTION 1 — DATA EXPLORATION & QUALITY CHECKS
Database: Uniswap_Liquidity_Analytics
Author: Sam Sahami  
**********************************************************************************************/

USE Uniswap_Liquidity_Analytics;
GO

-- Total number of rows in the raw TVL dataset
SELECT COUNT(*) AS total_rows 
FROM dbo.uniswap_tvl_summary;

-- Preview first 10 records
SELECT TOP 10 * 
FROM dbo.uniswap_tvl_summary;

-- Check earliest and latest dates in dataset
SELECT 
    MIN(date) AS earliest_date,
    MAX(date) AS latest_date
FROM dbo.uniswap_tvl_summary;

-- Unique chains and layers in dataset
SELECT DISTINCT chain 
FROM dbo.uniswap_tvl_summary 
ORDER BY chain;

SELECT DISTINCT layer 
FROM dbo.uniswap_tvl_summary 
ORDER BY layer;
