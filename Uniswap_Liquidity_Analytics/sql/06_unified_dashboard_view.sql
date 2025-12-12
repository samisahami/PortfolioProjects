/**********************************************************************************************
SECTION 6 — UNIFIED DASHBOARD VIEW
Database: Uniswap_Liquidity_Analytics
Author: Sam Sahami

Purpose:
Creates a single consolidated view used by BI dashboards (Power BI / Tableau).
Combines:
  • Total TVL over time
  • L2 TVL & L2 share %
  • Each chain’s TVL and percent share
**********************************************************************************************/

USE Uniswap_Liquidity_Analytics;
GO


/* =============================================================================
6A. Create Unified Dashboard View
   - Brings together L2 Share Summary + Chain Share Summary
   - Converts TVL → Billions for BI visuals
============================================================================= */

CREATE OR ALTER VIEW dbo.uniswap_dashboard_summary AS
SELECT
    l.date,
    ROUND(l.total_usd / 1_000_000_000.0, 2) AS total_tvl_billion,
    ROUND(l.l2_usd / 1_000_000_000.0, 2) AS l2_tvl_billion,
    ROUND(l.l2_share_percent, 2) AS l2_shar_
