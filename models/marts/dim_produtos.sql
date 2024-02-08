with
    stg_produtos as (
        select 
        id_produto
        , nome_produto
        from {{ ref('stg_erp__produtos') }}
    )

select *
from stg_produtos