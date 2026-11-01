{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    certification_completion_id,
    employee_id,
    first_name,
    last_name,
    email,
    PARSE_JSON(certification_json):certification_name::VARCHAR AS certification_name,
    PARSE_JSON(certification_json):certification_cost::NUMBER(10,2) AS certification_cost,
    PARSE_JSON(certification_json):certification_awarded_date::DATE AS certification_awarded_date
FROM {{ source('oliver_landing', 'employee_certifications') }}