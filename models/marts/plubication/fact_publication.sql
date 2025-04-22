select
    extract(year from publication_date) as year,
    count(*) as publication_count,
    count(distinct title) as unique_publications,
    count(distinct publisher) as publisher_count
from {{ ref('stg_gbif_sightings') }}
where publication_date is not null
group by 1
