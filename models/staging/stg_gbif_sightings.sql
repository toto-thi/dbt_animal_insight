select
    title,
    creators,
    publication_date,
    publisher_country,
    distributor_country,
    publisher,
    distributor,
    doi,
    url
from {{ source('animal_data', 'gbif_sightings') }}
where publication_date is not null