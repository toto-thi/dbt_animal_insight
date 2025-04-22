select
    "Year" as year,
    "App." as appendix,
    "Taxon" as taxon,
    "Class" as class_name,
    "Order" as order_name,
    "Family" as family_name,
    "Genus" as genus_name,
    "Importer" as importer,
    "Exporter" as exporter,
    "Origin" as origin,
    "Importer reported quantity" as importer_reported_quantity,
    "Exporter reported quantity" as exporter_reported_quantity,
    "Term" as term,
    "Unit" as unit,
    "Purpose" as purpose,
    "Source" as source
from {{ source('animal_data', 'cites_trade') }}
