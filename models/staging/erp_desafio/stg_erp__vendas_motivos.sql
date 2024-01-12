with
    fonte_vendas_motivos as (
        select 
        cast (salesreasonid as int) as id_motivo_venda
        , cast (name as string) as nome_motivo
        , cast (reasontype as string) as motivo_tipo
        , cast (modifieddate as string) as data_modificada
        from {{source('erp','salesreason')}}
    )

select *
from fonte_vendas_motivos