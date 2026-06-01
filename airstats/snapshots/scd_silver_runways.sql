{% snapshot scd_silver_runways %}

{{
    config(
      target_database='airstats',
      target_schema='dev',
      unique_key='runway_id',
      strategy='check',
      check_cols='all'
    )
}}

SELECT * FROM {{ ref('silver_runways') }}

{% endsnapshot %}