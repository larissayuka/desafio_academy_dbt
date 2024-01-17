with
    stg_cliente as (
        select 
        id_cliente
        , id_territorio_cliente
        from {{ ref('stg_erp__clientes') }}
    )

select *
from stg_cliente