with
    fonte_vendas_pessoas as (
        select 
        cast (businessentityid as int) as id_entidade_comercial_pessoas_vendas
        from {{source('erp','salesperson')}}
    )

select *
from fonte_vendas_pessoas