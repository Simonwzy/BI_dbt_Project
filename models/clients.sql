-- SELECT * FROM bronze.customers LIMIT 5
{{ config(materialized='view') }}

-- SELECT
--     customerid,
--     UPPER(firstname) AS firstname,
--     lastname,
--     CONCAT(firstname, ' ', lastname) AS fullname,
--     email,
--     phone,
--     address,
--     city,
--     state,
--     zipcode,
--     updated_at
-- FROM bronze.customers

SELECT
    customerid,
    UPPER(firstname) AS firstname,
    lastname,
    CONCAT(firstname, ' ', lastname) AS fullname,
    email,
    phone,
    address,
    city,
    state,
    zipcode,
    updated_at
FROM {{ source('bronze', 'customers') }}