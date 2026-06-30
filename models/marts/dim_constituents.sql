-- Mart: one row per constituent.
with contacts as (
    select * from {{ ref('stg_contacts') }}
),

donations as (
    select
        contact_id,
        count(*)      as donation_count,
        sum(amount)   as lifetime_amount
    from {{ ref('stg_donations') }}
    group by 1
)

select
    c.contact_id,
    d.donation_count,
    d.lifetime_amount
from contacts as c
left join donations as d
    on c.contact_id = d.contact_id
