with
    fonte_vendas_pedidos as (
        select 
        cast (salesorderid as int) as id_venda_pedido
        , cast (revisionnumber as int) as numero_revisao_pedido
        , cast (orderdate as string) as data_pedido
        , cast (duedate as string) as data_vencimento_pedido
        , cast (shipdate as string) as data_envio_pedido
        , cast (status as int) as status_pedido
        , cast (onlineorderflag as string) as onlineorderflag_pedido
        , cast (purchaseordernumber as string) as numero_compra_pedido
        , cast (accountnumber as string) as numero_conta_pedido
        , cast (customerid as int) as id_cliente_pedido
        , cast (salespersonid as int) as id_vendedor_pedido
        , cast (territoryid as int) as id_territorio_pedido
        , cast (billtoaddressid as int) as id_fatura_endereco_pedido
        , cast (shiptoaddressid as int) as id_enviar_para_endereco_pedido
        , cast (shipmethodid as int) as  id_modo_envio_pedido
        , cast (creditcardid as int) as id_cartao_credito_pedido
        , cast (creditcardapprovalcode as string) as codigo_aprovacao_cartao_cerdito_pedido
        , cast (currencyrateid as int) as id_taxa_pedido
        , cast (subtotal as numeric) as subtotal_pedido
        , cast (taxamt as numeric) as taxamt_pedido
        , cast (freight as numeric) as frete_pedido
        , cast (totaldue as numeric) as valor_total_pedido
        , cast (comment as int) as cometario_pedido
        , cast (rowguid as string) as rowguid_pedido
        , cast (modifieddate as string) as data_modificada_pedido
        from {{source('erp','salesorderheader')}}
    )

select *
from fonte_vendas_pedidos