{{ config(materialized='table') }}

with airports as (
    select * from {{ ref('src_airports') }}
)

select * from airports