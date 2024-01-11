with
    fonte_data_vendas as (
        select 
        cast (salesorderid as int) as id_venda
        , cast (revisionnumber as int) as numero_revisao
        , cast (orderdate as string) as data
        , cast (duedate as string) as data_vencimento
        , cast (shipdate as string) as data_envio
        , cast (status as int) as status
        , cast (onlineorderflag as string) as onlineorderflag
        , cast (purchaseordernumber as string) as numero_pedido_compra
        , cast (accountnumber as string) as numero_conta
        , cast (customerid as int) as id_cliente
        , cast (salespersonid as int) as id_vendedor
        , cast (territoryid as int) as id_territorio
        , cast (billtoaddressid as int) as id_fatura_endereco
        , cast (shiptoaddressid as int) as id_enviar_para_endereco
        , cast (shipmethodid as int) as  id_modo_envio
        , cast (creditcardid as int) as id_cartao_credito
        , cast (creditcardapprovalcode as string) as codigo_aprovacao_cartao_cerdito
        , cast (currencyrateid as int) as id_taxa
        , cast (subtotal as numeric) as subtotal
        , cast (taxamt as numeric) as taxamt
        , cast (freight as numeric) as frete
        , cast (totaldue as numeric) as valor_total
        , cast (comment as int) as cometario
        , cast (rowguid as string) as rowguid
        , cast (modifieddate as string) as data_modificada
        from {{source('erp','salesorderheader')}}
    )

select *
from fonte_data_vendas