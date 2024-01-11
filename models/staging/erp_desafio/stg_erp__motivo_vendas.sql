with
    fonte_motivo_vendas as (
        select 
        cast (salesreasonid as int) as id_motivo_venda
        , cast (name as string) as nome
        , cast (reasontype as string) as motivo_tipo
        , cast (modifieddate as string) as data_modificada
        from {{source('erp','salesreason')}}
    )

select *
from fonte_motivo_vendas