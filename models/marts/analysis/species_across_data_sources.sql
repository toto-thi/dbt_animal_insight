with conservation_species as (
    select distinct
        scientific_name,
        'conservation' as data_source
    from {{ ref('fact_species_conservation') }}
),

trade_species as (
    select distinct
        scientific_name,
        'trade' as data_source
    from {{ ref('fact_species_trade') }}
),

all_species as (
    select * from conservation_species
    union all
    select * from trade_species
),

species_source_count as (
    select
        scientific_name,
        count(distinct data_source) as source_count,
        string_agg(data_source, ', ') as sources
    from all_species
    group by 1
)

select * from species_source_count
where source_count > 1
order by scientific_name
