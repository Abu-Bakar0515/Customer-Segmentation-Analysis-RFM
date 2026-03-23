🧠 Customer Segmentation Analysis (RFM Based)
📌 Project Overview

This project focuses on Customer Segmentation using RFM Analysis (Recency, Frequency, Monetary).
The goal is to classify customers into meaningful segments such as VIP, Loyal, At Risk, and Lost customers to help businesses make data-driven decisions.

🎯 Objectives
Analyze customer purchasing behavior
Segment customers based on RFM metrics
Rank customers from 1 to 5
Identify high-value and low-value customers
Provide actionable business insights

🧾 Dataset
Type: E-commerce / Transactional Data
Rows: 2000 (after cleaning)
Key Columns:
Customer_ID
Invoice_Date
Amount
Transaction_ID

🛠️ Tools & Technologies
Python (Pandas, NumPy)
SQL (for querying and aggregation)
PowerBi (for visualization)
Data Cleaning Techniques
🧹 Data Cleaning Process
Removed duplicate records
Handled missing values
Converted date column to proper datetime format
Cleaned inconsistent text values (extra spaces, quotes, casing)
Converted mixed datatype columns into numeric
Validated and handled negative values in Amount column

📊 RFM Analysis
🔹 Recency (R)
Days since last purchase
🔹 Frequency (F)
Number of transactions per customer
🔹 Monetary (M)
Total amount spent
🧮 Scoring Method

Each customer is scored from 1 to 5:

5 → Best customers (recent, frequent, high spending)
1 → Least valuable customers

Customers are ranked using quantiles and assigned RFM scores.

🏷️ Customer Segments
Segment	Description
VIP	High value, frequent buyers
Loyal	Regular customers
Potential	Moderate engagement
At Risk	Not purchased recently
Lost	Inactive customers

📈 Key Insights
Identified top revenue-generating customers (VIP segment)
Detected customers at risk of churn
Found patterns in purchasing behavior
Helped in targeting customers for marketing campaigns

📊 Visualizations
Customer distribution by segment
Monthly customer trends
Revenue contribution by segment
RFM score distribution

⚠️ Business facing a problem that the sales are dropping from January. 
I make some problem solving decision by visualizing them some of my recommendations are given 
- Focus marketing campaigns during January to maximize seasonal sales
- Offer discounts on digital payments to reduce COD dependency
- Retarget loyal customers with personalized offers
- Increase stock and promotions for high-performing categories like Toys

🚀 Business Impact
Helps businesses focus on high-value customers
Improves customer retention strategies
Enables targeted marketing
Supports data-driven decision making

📂 Project Structure
├── data/
├── notebooks/
├── sql/
├── visuals/
├── README.md
├── Insights,pdf
🤝 Author

Abubakar Saddique
Aspiring Data Analyst | Python | SQL | Data Cleaning | Data Visualization

⭐ If you like this project

Give it a ⭐ on GitHub and share your feedback! 
