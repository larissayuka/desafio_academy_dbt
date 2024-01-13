with
    fonte_vendas_motivos as (
        select 
        cast (salesreasonid as int) as id_venda_motivo
        , cast (name as string) as nome_motivo
        , cast (reasontype as string) as tipo_motivo
        , cast (modifieddate as string) as data_modificada_motivo
        from {{source('erp','salesreason')}}
    )

select *
from fonte_vendas_motivos