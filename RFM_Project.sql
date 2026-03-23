DROP TABLE IF EXISTS Customer;

Create TABLE IF NOT EXISTS Customer(
	CustomerID  INT NOT NULL,
	OrderID  INT NOT NULL,
	OrderDate DATE,
	Quantity INT,
	OrderPrice NUMERIC(10,2),
	Country VARCHAR(50),
	ProductCategory VARCHAR(50),
	ProductName VARCHAR(50),
	Discount INT,
	PaymentMethod VARCHAR(50),
	Customer_Rating INT 

);

ALTER TABLE CUSTOMER
ADD COLUMN Frequency INT,
ADD COLUMN Monetary NUMERIC(10,2),
ADD COLUMN Recency INT;

UPDATE Customer C
SET
	Frequency=r.Frequency,
	Monetary=r.Monetary,
	Recency=r.Recency
FROM(
	SELECT 
		CustomerID,
		SUM(Quantity) AS Frequency,
		SUM(OrderPrice) AS Monetary,
		(CURRENT_DATE - MAX(OrderDate)::date) AS Recency
	FROM Customer
	GROUP BY CustomerID
	ORDER BY Frequency DESC
) r
WHERE c.CustomerID = r.CustomerID;


ALTER TABLE Customer
ADD COLUMN FRM_Score INT;

WITH RFM_Calc AS (
    SELECT 
        CustomerID,
        NTILE(5) OVER(ORDER BY Frequency DESC) AS f_frm,
        NTILE(5) OVER(ORDER BY Monetary DESC) AS m_frm,
        NTILE(5) OVER(ORDER BY Recency ASC) AS r_frm
    FROM Customer
),
RFM_Score_Calc AS (
    SELECT
        CustomerID,
        ROUND((0.4*r_frm + 0.3*f_frm + 0.3*m_frm)) AS FRM_Score
    FROM RFM_Calc
)
UPDATE Customer c
SET FRM_Score = r.FRM_Score
FROM RFM_Score_Calc r 
WHERE c.CustomerID = r.CustomerID;

ALTER TABLE Customer
ADD COLUMN Segment VARCHAR(30);
UPDATE Customer
SET Segment = CASE
    WHEN FRM_Score = 5 THEN 'VIP'
    WHEN FRM_Score = 4 THEN 'Loyal'
    WHEN FRM_Score = 3 THEN 'Potential'
    WHEN FRM_Score = 2 THEN 'Needs Attention'
    ELSE 'Lost'
END;

CREATE OR REPLACE VIEW Customer_RFM AS
SELECT
    CustomerID,
	OrderID,
	OrderDate,
	Quantity,
	OrderPrice,
	Country,
	ProductCategory,
	ProductName,
	Discount,
	PaymentMethod,
	Customer_Rating,
    Frequency,
    Monetary,
    Recency,
    FRM_Score,
	Segment
FROM Customer;

SELECT * FROM Customer_RFM;