{{ config(materialized='table', schema='gold') }}

SELECT
    o.customerid,
    o.employeeid,
    o.storeid,
    o.status,
    COUNT(DISTINCT o.orderid) AS OrderCount,
    SUM(oi.TotalPrice) AS TotalAmount
FROM {{ ref('orders') }} AS o
JOIN {{ ref('orders_items') }} AS oi
    ON o.orderid = oi.orderid
GROUP BY
    o.customerid,
    o.employeeid,
    o.storeid,
    o.status