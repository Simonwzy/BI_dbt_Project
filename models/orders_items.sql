{{ config(materialized='view') }}

SELECT
    *,
    quantity * unitprice AS TotalPrice
FROM {{ source('bronze', 'orderitems') }}