with
    fonte_vendas_pedidos_motivos as (
        select 
        cast (salesorderid as int) as id_pedido_venda
        , cast (salesreasonid as int) as id_motivo_venda
        , cast (modifieddate as string) as data_modificada
        from {{source('erp','salesorderheadersalesreason')}}
    )

select *
from fonte_vendas_pedidos_motivos