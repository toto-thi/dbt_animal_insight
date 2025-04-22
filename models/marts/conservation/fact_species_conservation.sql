select
    scientific_name,
    common_name,
    class_name,
    order_name,
    family_name,
    genus_name,
    species_name,
    assessment_year,
    species_recovery_score_best,
    species_recovery_category,
    conservation_legacy_category,
    conservation_dependence_category,
    conservation_gain_category,
    recovery_potential_category
from {{ ref('stg_iucn_species') }}
