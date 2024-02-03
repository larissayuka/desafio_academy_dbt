with
    fonte_vendas_motivos as (
        select 
        cast (salesreasonid as int) as id_venda_motivo
        , name as nome_motivo
        , reasontype as tipo_motivo
        from {{source('erp','salesreason')}}
    )

select *
from fonte_vendas_motivos