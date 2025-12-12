/**********************************************************************************************
SECTION 4 — CHAIN SHARE SUMMARY (Top Chains by Liquidity Share)
Database: Uniswap_Liquidity_Analytics
Author: Sam Sahami
**********************************************************************************************/

USE Uniswap_Liquidity_Analytics;
GO


/* =============================================================================
4A. Create Chain Share Summary Table
   - Aggregates total TVL per chain
   - Calculates liquidity share % of each chain
   - Used in Power BI Top Chains Bar Chart
============================================================================= */

DROP TABLE IF EXISTS dbo.uniswap_chain_share;
GO

SELECT
    chain,
    SUM(tvl_usd) AS total_usd,
    SUM(tvl_usd) * 100.0 / 
        (SELECT SUM(tvl_usd) FROM dbo.uniswap_tvl_summary) AS percent_of_total
INTO dbo.uniswap_chain_share
FROM dbo.uniswap_tvl_summary
GROUP BY chain
ORDER BY total_usd DESC;


/* =============================================================================
4B. Preview — Top Chains by Liquidity
============================================================================= */

SELECT TOP 10 *
FROM dbo.uniswap_chain_share
ORDER BY total_usd DESC;
