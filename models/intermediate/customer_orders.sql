select customer.name, items.* 
from {{ ref('order_items')}} items
left outer join {{ ref('stg_customers') }} customer
on items.customer_id = customer.customer_id