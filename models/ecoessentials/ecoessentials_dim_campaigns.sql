select distinct
    coalesce(me.campaign_id, c.campaign_id) as campaign_key,
    coalesce(me.campaign_id, c.campaign_id) as campaign_id,
    coalesce(me.campaign_name, c.campaign_name) as campaign_name,
    c.campaign_discount
from {{ ref("ecoessentials_stg_marketing_emails") }} as me
    full outer join {{ ref("ecoessentials_stg_promotional_campaigns") }} as c
        on me.campaign_id = c.campaign_id