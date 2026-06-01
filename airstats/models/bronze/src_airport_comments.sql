{{ config(materialized='ephemeral') }}

with airport_comments as (
    select
        id as comment_id,
        airport_ident,
        date as comment_timestamp,
        member_nickname,
        subject as comment_subject,
        body as comment_body
    from {{ source('comments', 'airport_comments') }}
)

select * from airport_comments