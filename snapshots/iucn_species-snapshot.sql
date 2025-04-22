{% snapshot iucn_species_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='scientific_name',
      strategy='timestamp',
      updated_at='assessment_year',
    )
}}

select * from {{ ref('stg_iucn_species') }}

{% endsnapshot %}
