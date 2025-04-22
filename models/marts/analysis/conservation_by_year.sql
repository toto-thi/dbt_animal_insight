with conservation as (
    select
        assessment_year as year,
        species_recovery_category,
        count(*) as species_count
    from {{ ref('fact_species_conservation') }}
    group by 1, 2
)

select * from conservation
