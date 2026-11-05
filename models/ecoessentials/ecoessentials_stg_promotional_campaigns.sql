select
    campaign_id,
    campaign_discount,
    upper(campaign_name) as campaign_name
from {{ source("ecoessentials_transactional_db", 
"promotional_campaign") }}
