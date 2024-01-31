with
    fonte_entidades_comerciais as (
        select 
        cast (businessentityid as int) as id_entidade_comercial
        from {{source('erp','businessentity')}}
    )

select *
from fonte_entidades_comerciais