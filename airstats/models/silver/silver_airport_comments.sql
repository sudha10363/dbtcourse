{{ config(
    materialized='incremental',
    unique_key='comment_id',
    on_schema_change='fail'
) }}

with airport_comments as (
    select
        comment_id,
        airport_ident,
        comment_timestamp,
        coalesce(member_nickname, '__UNKNOWN__') as member_nickname,
        comment_subject,
        comment_body,
        current_timestamp() as loaded_at
    from {{ ref('src_airport_comments') }}
    where comment_body is not null and comment_body != ''
    
    {% if execute and this.exists %}
        and comment_id > (select max(comment_id) from {{ this }})
    {% endif %}
)

select * from airport_comments