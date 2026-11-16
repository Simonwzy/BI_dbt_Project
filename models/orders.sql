{{ config(materialized='view') }}

SELECT
    *,
    CASE
        WHEN status = '01' THEN 'En cours'
        WHEN status = '02' THEN 'Terminée'
        WHEN status = '03' THEN 'Annulée'
        ELSE NULL
    END AS StatusDescription
FROM {{ source('bronze', 'orders') }}