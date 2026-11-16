{{ config(materialized='table', schema='gold') }}

WITH actual_sales AS (
    SELECT
        storeid,
        SUM(TotalAmount) AS ActualRevenue
    FROM {{ ref('fact_orders') }}
    GROUP BY storeid
)

SELECT
    s.StoreID,
    COALESCE(a.ActualRevenue, 0) AS ActualRevenue,
    s.SalesTarget,
    COALESCE(a.ActualRevenue, 0) - s.SalesTarget AS RevenueDifference
FROM {{ ref('salestarget') }} AS s
LEFT JOIN actual_sales AS a
    ON s.StoreID = a.storeid
