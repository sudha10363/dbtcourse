{% snapshot scd_silver_airports %}

{{
    config(
      target_database='airstats',
      target_schema='dev',
      unique_key='airport_ident',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('silver_airports') }}

{% endsnapshot %}