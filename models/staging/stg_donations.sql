-- Staging: one row per donation, lightly standardized.
with source as (
    select * from {{ source('crm', 'donations') }}
),

renamed as (
    select
        donation_id,
        contact_id,
        amount,
        donated_at,
        channel
    from source
)

select * from renamed
