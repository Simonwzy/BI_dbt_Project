{{ config(materialized='table', schema='gold') }}

SELECT
    c.customerid,
    c.fullname,
    SUM(fo.OrderCount) AS TotalOrders,
    SUM(fo.TotalAmount) AS TotalRevenue
FROM {{ ref('fact_orders')}} AS fo
JOIN {{ ref('clients')}} AS c
    ON fo.customerid = c.customerid
GROUP BY
    c.customerid,
    c.fullname