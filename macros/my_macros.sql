{% macro conc(col1, col2) %}
    {{col1}} || ' ' || {{col2}}
{% endmacro %}

{% macro plus (c1, c2) %}
    {{ c1 }} + {{ c2 }}
{% endmacro %}

{% macro copychk() %}

{% set copy_query %}
begin transaction;
insert into ANALYTICS.DBT_MURALI.INT_REGIONS
values (6, 'Antarctica', 'The southernmost continent', 'Antarctica The southernmost continent', current_timestamp());
commit;
{% endset %}

{% do run_query(copy_query) %}

{% endmacro %}

{% macro money() %}

::number(8,2)

{% endmacro %}