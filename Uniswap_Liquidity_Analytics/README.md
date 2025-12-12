# Uniswap Liquidity Analytics  
### End-to-End Data Engineering & Web3 Analytics Project  
**(SQL • Python • Power BI • On-Chain Data Modeling • L1 → L2 Migration Analysis)**

This project builds a complete analytics pipeline that extracts, models, and visualizes Uniswap’s liquidity trends across multiple blockchains (Ethereum L1 + emerging L2 ecosystems).  
Data is sourced directly from **DeFiLlama’s public API**, processed into analytical tables, and used to generate a full BI dashboard.

---

##  Project Overview  
The goal of this project is to understand:

- How Uniswap’s Total Value Locked (TVL) has evolved from **2018–2025**
- How liquidity distribution has shifted from **Ethereum (L1) → L2s** like Arbitrum, Base, Polygon, and Optimism
- How market share, dominance, and growth patterns differ across chains
- How to build an **end-to-end reproducible pipeline** with SQL, Python, and BI tooling

This project demonstrates:

- Data engineering fundamentals  
- On-chain analytics  
- ETL design  
- Feature engineering  
- Visualization and insight generation  

---

## 📁 Repository Structure


Uniswap_Liquidity_Analytics/
│
├── sql/
│ ├── 01_data_exploration.sql
│ ├── 02_summary_tables.sql
│ ├── 03_l2_share_summary.sql
│ ├── 04_chain_share_summary.sql
│ └── 05_unified_dashboard_view.sql
│
├── python/
│ └── 01_uniswap_analytics.ipynb # Full end-to-end analysis notebook
│
├── dashboard/
│ └── Uniswap_Liquidity_Dashboard.pbix # Power BI dashboard
│
└── README.md


---

## 🔧 Technologies Used

### **Data Engineering**
- Python (Pandas, NumPy, Requests, Matplotlib, Plotly)
- ETL pipeline to pull TVL data from DeFiLlama API
- Data cleaning, datetime normalization, chain categorization

### **Data Modeling (SQL)**
- Chain-level summary tables  
- L2 migration tables  
- Normalized analytical views for BI tools  

### **Analytics & BI**
- Power BI dashboard  
- KPI cards, trendlines, chain comparison visuals  
- L1 vs L2 split, dominance, and multi-chain usage patterns  

---

##  Key Insights (Summary)

### **1. Global Liquidity Trend**
- Uniswap TVL grew exponentially during **2020–2021**, peaking above **$10B** during the DeFi boom.  
- Despite the 2022 downturn, liquidity **stabilized** and remains in the **$4–6B** range through 2024–2025.

### **2. Chain-Level Distribution**
- **Ethereum** remains the liquidity anchor, holding **70–75%** of Uniswap's total TVL.  
- **Arbitrum** leads among L2s (~8% of TVL).  
- **Base** (10%) and **Polygon** (3%) show accelerating adoption.  
- Smaller chains (e.g., **Unichain**) show niche growth but meaningful ecosystem expansion.

### **3. Liquidity Migration (L1 → L2)**
- Migration accelerated in **mid-2022**, aligning with L2 scaling, lower gas fees, and Uniswap’s multi-chain deployments.  
- Base and Arbitrum show the fastest upward liquidity trajectories.  
- Ethereum’s dominance fell from **≈100% (2020) → ≈70% (2025)** — without losing absolute liquidity (new liquidity is flowing into L2s).

### **4. Ecosystem Interpretation**
Uniswap has transitioned into a **multi-chain liquidity hub**, not a single-chain protocol.  
Key drivers:
- Lower transaction cost on L2s  
- Faster confirmations  
- Cross-chain composability  
- Sustainable incentives  

---

##  Power BI Dashboard Preview  
The dashboard provides:

- TVL trends (2018–2025)  
- Chain-level comparison  
- L2 growth & dominance  
- Liquidity migration visualization  
- KPI cards for peak, troughs, and YoY shifts  

*(Insert screenshot in your repo if you want — optional but recommended.)*

---

##  Python Notebook Capabilities  
The Jupyter notebook includes:

- Full TVL ingestion & retry-safe API extraction  
- Cleaning, normalization, type conversion  
- Chain-level aggregation  
- L1/L2 classification  
- Dominance calculations  
- Forecast models (Linear Regression + Prophet)  
- Correlation analysis (ETH dominance vs L2 share)  
- Statistical significance testing (two-sample t-test)




