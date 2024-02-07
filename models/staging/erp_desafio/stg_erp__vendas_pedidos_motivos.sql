with
    fonte_vendas_pedidos_motivos as (
        select 
        cast (salesorderid as int) as id_venda_pedido_chave
        , cast (salesreasonid as int) as id_venda_motivo_chave
        from {{source('erp','salesorderheadersalesreason')}}
    )

select *
from fonte_vendas_pedidos_motivos