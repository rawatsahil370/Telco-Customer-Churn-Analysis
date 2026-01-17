select * from Customers




--Q1 :-Retrieve the total number of customers from the dataset.

select count(customer_id) As Total_Customers
from customers

--Q2 :- Retrieve the total number of customers who have churned.

select count(*) AS Churn_customer
from customers
where churn = 'Yes'

	 --Retrieve the total number of customers who have not churned.

select count(*) AS Churn_customer
from customers
where churn = 'No'


--Q3 :- Retrieve the count of customers grouped by gender.

select * from customers

select gender, count(*) as total_number_of_gender 
from customers
group by gender

--Q4 :- Retrieve the count of customers for each payment method.

select payment_method,count(*) as Total_number_of_payment_method
from customers
group by payment_method

select * from customers

--Q5 :- Retrieve the number of customers who have internet service.

select internet_service, count(*)
from customers
where internet_service <> 'No'
group by internet_service


select * from customers

--Q6 :- Retrieve the list of customers whose monthly charges are greater than 80.

select customer_id , monthly_charges from customers
where monthly_charges > 80

--Q7 :- Retrieve customers with tenure less than 12 months.

select customer_id , tenure 
from customers
where tenure < 12

select * from customers

--Q8 :- Retrieve the churn count for each contract type.

select contract,count(churn)
from customers as Total_numner_of_Churn
where churn = 'Yes'
group by contract

--Q9 :- Retrieve the average monthly charges for churned and non-churned customers.

select churn,Avg(monthly_charges) as Average_number_of_Churn_and_not_chrun
from customers
group by churn

select * from customers

--Q10 :- Retrieve the total number of senior citizens who have churned.

select count("senior_citizen") as Total_number_of_senior_citizen_chrun
from customers
where churn = 'Yes'

--Q11 :-Retrieve the top 10 customers with the highest monthly charges.

select customer_id , monthly_charges As Highest_monthly_charges
from customers
order by monthly_charges  desc
limit 10

select * from customers

--Q12 :- Retrieve the churn count for customers with and without dependents.

select "Dependents",count(*) as chrn_customer_without_dependents
from customers
where churn = 'Yes'
group by "Dependents"

select * from customers

--Q13 :- Retrieve the churn rate (percentage of churned customers).
     -- (Churned Customers / Total Customers) × 100


SELECT 
    ROUND(
        (SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0) 
        / COUNT(*),
        2
    ) AS churn_rate_percentage,
    
    ROUND(
        (SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) * 100.0) 
        / COUNT(*),
        2
    ) AS non_churn_rate_percentage
FROM Customers

--Q14 :-Retrieve the average tenure of churned and non-churned customers.
select * from customers

select churn,
Round(avg(tenure),2) 
from customers
group by churn


--Q15 :- Retrieve churn count by customer tenure category (Low, Medium, High).

SELECT 
    CASE 
        WHEN tenure < 12 THEN 'Low Tenure'
        WHEN tenure BETWEEN 12 AND 36 THEN 'Medium Tenure'
        ELSE 'High Tenure'
    END AS tenure_category,
    COUNT(*) AS churned_customers
FROM Customers
WHERE Churn = 'Yes'
GROUP BY 
    CASE 
        WHEN tenure < 12 THEN 'Low Tenure'
        WHEN tenure BETWEEN 12 AND 36 THEN 'Medium Tenure'
        ELSE 'High Tenure'
    END;




