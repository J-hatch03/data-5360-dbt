select distinct
    email_id as email_key,
    email_id,
    email_name
from {{ ref("ecoessentials_stg_marketing_emails") }}
order by email_name