{{ config(materialized='incremental',unique_key='region_id') }}

// Refer to the intermediate table for source data

with region as (
select
region_id,
name,
comment,
updated_at as inserted_at
from {{ ref('int_regions') }}
{% if is_incremental() %}
where updated_at > (select max(inserted_at) from {{ this }})
{% endif %}
)

select * from region