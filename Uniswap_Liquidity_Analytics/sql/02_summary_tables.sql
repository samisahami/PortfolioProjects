/**********************************************************************************************
SECTION 2 — SUMMARY TABLES (L1 vs L2, Top Chains)
Database: Uniswap_Liquidity_Analytics
Author: Sam Sahami
**********************************************************************************************/

USE Uniswap_Liquidity_Analytics;
GO


/* =============================================================================
2A. L1 vs L2 Liquidity Summary — Latest Date
   - Calculates total TVL per layer
   - Computes L2 share percentage
============================================================================= */

SELECT 
    layer,
    SUM(tvl_usd) AS total_tvl_usd,
    CAST(
        SUM(tvl_usd) * 100.0 /
        (SELECT SUM(tvl_usd) 
         FROM dbo.uniswap_tvl_summary
         WHERE date = (SELECT MAX(date) FROM dbo.uniswap_tvl_summary))
        AS DECIMAL(5,2)
    ) AS pct_of_total
FROM dbo.uniswap_tvl_summary
WHERE date = (SELECT MAX(date) FROM dbo.uniswap_tvl_summary)
GROUP BY layer
ORDER BY total_tvl_usd DESC;



/* =============================================================================
2B. Top Chains by Total Liquidity — Latest Date
   - Ranks chains by total liquidity
   - Ideal for bar chart in Power BI
============================================================================= */

SELECT TOP 10
    chain,
    SUM(tvl_usd) AS total_tvl_usd
FROM dbo.uniswap_tvl_summary
WHERE date = (SELECT MAX(date) FROM dbo.uniswap_tvl_summary)
GROUP BY chain
ORDER BY total_tvl_usd DESC;
