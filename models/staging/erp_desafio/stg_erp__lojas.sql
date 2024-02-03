with
    fonte_lojas as (
        select 
        cast (businessentityid as int) as id_entidade_comercial_loja
        , name as nome_loja
        , cast (salespersonid as int) as id_vendedor_loja
        from {{source('erp','store')}}
    )

select *
from fonte_lojas