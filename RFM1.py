import pandas as pd
import numpy as np 
db=pd.read_csv("messy_online_retail_dataset.csv",encoding="latin1")


C_fill_values=[3743,8346,9372,2632,9274,5436,7346,3846,1093,4573]
data=[12/4/2025,24/9/2023,19/12/2021,30/12/2022,22/9/2020,10/3/2018]
go=[46/68/68]
O_Price=[70,30,80,40]
Payment_Meth = ["Cash", "Credit Card"]
T_Quantity=[3,5,7]
Country=["Pakistan","China","Russia"]
Rating=[1,2,3,4,5]
db.rename(columns={"1omerRating": "Customer_Rating"}, inplace=True)
def fill_missing_values(df,columns,values,shuffle=True):
    missing_idx=db[db[columns].isnull()].index.tolist()
    if shuffle:
        np.random.shuffle(missing_idx)
    len_missing=len(missing_idx)
    len_values=len(values)
    for i,val in enumerate(values):
        start=i*len_missing//len_values
        end=(i+1)*len_missing//len_values
        db.loc[missing_idx[start:end],columns]=val
fill_missing_values(db,"CustomerID",C_fill_values)
fill_missing_values(db,"OrderDate",data)
fill_missing_values(db,"OrderPrice",O_Price)
fill_missing_values(db,"PaymentMethod",Payment_Meth)
fill_missing_values(db,"Quantity",T_Quantity)
fill_missing_values(db,"Country",Country)
fill_missing_values(db,"Customer_Rating",Rating)
db["Discount"].fillna(db["Discount"].mean(),inplace=True)
db["OrderDate"] = pd.to_datetime(db["OrderDate"],dayfirst=True,errors="coerce")
db.to_csv("Clean_Data_FRM.csv",encoding="latin1",index=False)