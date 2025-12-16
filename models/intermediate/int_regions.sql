
{{ config(transient=false) }}

with region as (
select
region_id,
name,
comment,
{{ conc('name', 'comment') }} as name_comment,
current_timestamp() as updated_at
from {{ ref('stg_regions') }}
)

select * from region