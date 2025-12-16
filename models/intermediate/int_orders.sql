{{ config(materialized='incremental', unique_key='order_id') }}

with source as (

    select * from {{ ref('stg_orders') }}

{% if is_incremental() %}
    where order_date > (select max(order_date) from {{ this }})
{% endif %}

),

changed as (

    select order_id, customer_id, clerk_name, total_price, status_code, priority_code, ship_priority, order_date from source

)

select * from changed