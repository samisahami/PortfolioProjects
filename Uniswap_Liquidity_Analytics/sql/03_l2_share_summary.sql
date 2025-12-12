/**********************************************************************************************
SECTION 3 — L2 SHARE SUMMARY (Ethereum vs Layer 2 Migration Over Time)
Database: Uniswap_Liquidity_Analytics
Author: Sam Sahami
**********************************************************************************************/

USE Uniswap_Liquidity_Analytics;
GO


/* =============================================================================
3A. Create L2 Share Summary Table
   - Calculates total TVL per day
   - Calculates total L2 TVL per day
   - Computes daily % of liquidity on Layer 2
   - Used in Power BI L2 Adoption Line Chart
============================================================================= */

DROP TABLE IF EXISTS dbo.uniswap_l2_share_summary;
GO

WITH total_tvl AS (
    SELECT 
        date,
        SUM(tvl_usd) AS total_usd
    FROM dbo.uniswap_tvl_summary
    GROUP BY date
),
l2_tvl AS (
    SELECT
        date,
        SUM(tvl_usd) AS l2_usd
    FROM dbo.uniswap_tvl_summary
    WHERE LOWER(layer) = 'l2'
    GROUP BY date
)

SELECT 
    t.date,
    t.total_usd,
    ISNULL(l.l2_usd, 0) AS l2_usd,
    ISNULL(l.l2_usd * 100.0 / NULLIF(t.total_usd, 0), 0) AS l2_share_percent
INTO dbo.uniswap_l2_share_summary
FROM total_tvl t
LEFT JOIN l2_tvl l 
    ON t.date = l.date
ORDER BY t.date;


/* =============================================================================
3B. Preview — Latest Rows
============================================================================= */

SELECT TOP 10 *
FROM dbo.uniswap_l2_share_summary
ORDER BY date DESC;
