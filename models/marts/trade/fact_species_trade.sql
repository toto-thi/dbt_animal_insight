select
    year,
    taxon as scientific_name,
    class_name,
    order_name,
    family_name,
    genus_name,
    sum(coalesce(importer_reported_quantity, 0)) as total_import_quantity,
    sum(coalesce(exporter_reported_quantity, 0)) as total_export_quantity,
    count(*) as trade_records
from {{ ref('stg_cites_trade') }}
group by 1, 2, 3, 4, 5, 6
