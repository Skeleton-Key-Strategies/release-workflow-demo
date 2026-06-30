-- Staging: one row per contact.
with source as (
    select * from {{ source('crm', 'contacts') }}
),

renamed as (
    select
        contact_id,
        created_at
    from source
)

select * from renamed

-- updated_at added downstream
