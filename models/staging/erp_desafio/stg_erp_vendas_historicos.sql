with
    fonte_vendas_historicos as (
        select 
        cast (businessentityid as int) as id_entidade_comercial_historico
        , cast (territoryid as int) as id_territorio_historico
        from {{source('erp','salesterritoryhistory')}}
    )

select *
from fonte_vendas_historicos