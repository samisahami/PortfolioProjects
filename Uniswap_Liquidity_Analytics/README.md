# Uniswap Liquidity Analytics

### End-to-End Data Engineering & BI Project

This project builds a full analytics pipeline around Uniswap’s liquidity data across multiple blockchains (Layer 1 and Layer 2).

It includes:

- SQL data modeling and analytical views
- Python ETL and data ingestion
- Power BI dashboard with KPIs, trendlines, and liquidity distribution
- Business insights on L2 adoption and chain-level performance

This project demonstrates data engineering, analytics engineering, BI visualization, and end-to-end storytelling.

---

## Project Architecture

Uniswap_Liquidity_Analytics/
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_summary_tables.sql
│   ├── 03_l2_share_summary.sql
│   ├── 04_chain_share_summary.sql
│   └── 05_unified_dashboard_view.sql
├── python/
│   └── 01_uniswap_etl.py
├── dashboard/
│   └── Uniswap_Liquidity_Dashboard.pbix
├── Web3 Unified Analytics.ipynb
└── README.md

---

## Dashboard Overview (Power BI)

The Power BI dashboard provides:

### KPI Cards
- Total Liquidity (TVL)
- L2 Share (%)
- Latest chain-level values
- Most recent liquidity movement (up or down)

### Visuals
- L2 Adoption Over Time – line chart
- Top Chains by TVL – bar chart
- L1 vs L2 Liquidity Split – donut chart
- Chain Share Over Time – area chart
- Year-over-Year Liquidity Trends – multi-line chart

These visuals provide both macro and chain-level liquidity insights.

---

## SQL Components

### 1. Data Quality and Exploration
- Row counts
- Date validation
- Unique chains and layers
- TVL distribution checks

### 2. Summary Tables
- Global liquidity totals
- Layer 1 vs Layer 2 aggregation
- Top chains

### 3. Analytical Views
- Daily percentage share by chain
- Rolling 7-day averages
- Running totals
- Chain rankings using window functions

All SQL scripts are modular, documented, and optimized for BI consumption.

---

## Python ETL

The Python component handles:

- API ingestion or CSV loading
- Data cleaning
- Type casting and date normalization
- Export to SQL Server
- Logging and QA checks

Files:
- `01_uniswap_etl.py`
- (Optional) `Web3 Unified Analytics.ipynb`

---

## Skills Demonstrated

- SQL (window functions, modeling, summary tables)
- Python (ETL, data cleaning, ingestion)
- Power BI (DAX, KPIs, visual storytelling)
- Data engineering (pipeline structure, modularization)
- Analytics engineering (semantic modeling, views)

---

## Future Enhancements

- Add on-chain API ingestion
- Add rolling 30/90-day TVL volatility
- Create Power BI bookmarks and interactions
- Deploy SQL views to Azure SQL for cloud analytics

---

## Author

Sam Sahami  
SQL • Power BI • Data Engineering • Web3 Analytics
