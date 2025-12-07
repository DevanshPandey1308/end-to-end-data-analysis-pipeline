# 📌 End-to-End Data Analysis Pipeline (Python + SQL)

This project demonstrates a complete data analysis workflow, beginning with **data ingestion** via the Kaggle API, followed by **data cleaning and preprocessing** in Python, **analytical SQL queries** in MySQL, and **exploratory visualizations** using Matplotlib and Seaborn.  
It reflects industry-level practices for turning raw datasets into actionable insights using a structured pipeline.


## 🧱 Project Workflow:
Kaggle API → Python Preprocessing → MySQL Analysis → Python Visualizations → Insights


## 📂 Repository Structure:
├── data/
│   └── orders.csv
│
├── notebooks/
│   └── analysis.ipynb
│
├── sql/
│   └── analytical_queries.sql
│
├── visuals/
│   └── (4 visualizations exported as PNG)
│
└── README.md


## 📊 Dataset Overview:
Source: Kaggle
Rows: 9,994
Type: E-commerce transaction dataset
Key Columns: order ID, order date, customer details, product info, order amount, category, quantity


## ⚙️ Technologies Used:
•Python
-Pandas
-NumPy
-Matplotlib
-Seaborn
-Kaggle API

•SQL (MySQL)
-Joins
-Aggregations
-Common Table Expressions (CTEs)
-Filtering & grouping

Other Tools
-Jupyter Notebook
-MySQL Workbench

### 🧹 1. Data Preprocessing (Python)
Performed extensive preprocessing using Pandas and NumPy:
-Null handling
-Type conversions
-Feature extraction
-Duplicate removal
-Basic descriptive statistics

The cleaned dataset was exported for SQL-based analytical exploration.

### 🗄️ 2. SQL Analytical Queries
The sql/analytical_queries.sql file contains:
-Revenue and quantity analysis
-Monthly/weekly aggregations
-Category-level insights
-Customer behavior segmentation
-Top-selling products
-Profitability trends

SQL allowed deeper trend discovery and validation of Python EDA findings.


### 📈 3. Exploratory Visualizations (Python)
Generated Following visualizations using Matplotlib and Seaborn to validate SQL findings and identify deeper insights:
-Top 10 Highest Revenue Products
-Top 10 states by Sales
-Quarterly Sales Trend
-Profit Margin Category
-Sales by Ship Mode
-Month-Over-Month Sales Analysis
-Region-Wise Sales

Visualizations help validate SQL patterns and communicate insights effectively.



### 🔍 Key Insights
-High-performing product categories contribute disproportionally to revenue
-Seasonal trends influence monthly sales
-Certain order types show consistent behavior across time
-Customer purchase patterns show repeat-purchase tendencies


### ▶️ How to Run This Project
1. Clone the repository
git clone https://github.com/yourusername/end-to-end-data-analysis-pipeline.git
2. Install dependencies
pip install -r requirements.txt
3. Run the notebook
Open analysis.ipynb in Jupyter Notebook.
4. Execute SQL queries
Import orders.csv into MySQL and run queries in analytical_queries.sql.


### 🧭 Future Improvements
-Add more advanced SQL modeling
-Implement automated ETL script for end-to-end refresh
-Add dashboard (Power BI / Tableau)
-Expand dataset to increase analytical depth


### 📝 Conclusion
This project demonstrates:
-Real-world data preprocessing
-SQL + Python integrated analysis
-Exploratory visualization skills
-Ability to build structured analytical pipelines
-End-to-end workflow understanding
