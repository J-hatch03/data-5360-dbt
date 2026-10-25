{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    p.product_key,
    cu.cust_key,
    e.employee_key,
    st.store_key,
    d.date_key,
    o.total_amount as dollars_sold,
    ol.quantity,
    ol.unit_price
FROM {{ source('oliver_landing', 'orders') }} o 
INNER JOIN {{ source('oliver_landing', 'orderline') }} ol ON o.order_id = ol.order_id
INNER JOIN {{ ref('oliver_dim_product') }} p ON ol.product_id = p.product_id 
INNER JOIN {{ ref('oliver_dim_customer') }} cu ON o.customer_id = cu.customer_id 
INNER JOIN {{ ref('oliver_dim_employee') }} e ON o.employee_id = e.employee_id 
INNER JOIN {{ ref('oliver_dim_store') }} st ON o.store_id = st.store_id
INNER JOIN {{ ref('oliver_dim_date') }} d ON d.date_day = o.order_date