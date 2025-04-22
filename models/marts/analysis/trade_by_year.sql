with trade as (
    select
        year,
        sum(total_import_quantity) as total_imports,
        sum(total_export_quantity) as total_exports,
        sum(total_export_quantity - total_import_quantity) as net_exports,
        count(distinct scientific_name) as traded_species_count
    from {{ ref('fact_species_trade') }}
    group by 1
)

select * from trade
