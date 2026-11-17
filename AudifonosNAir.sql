USE DataWarehousePriject;
GO


SELECT 
    dc.customer_key,
    dc.customer_name,
    fs.total_sales,
    fs.quantity
FROM gold.fact_sales AS fs
LEFT JOIN gold.dim_customers AS dc
ON fs.customer_key = dc.customer_key
WHERE dc.country = 'Germany';