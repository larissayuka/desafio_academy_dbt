with
    stg_cartoes as (
        select 
        id_cartao
        , tipo_cartao
        from {{ ref('stg_erp__cartoes') }}
    )

select *
from stg_cartoes