with
    fonte_vendas_detalhes as (
        select 
        cast (salesorderid as int) as id_pedido_venda
        , cast (salesorderdetailid as int) as id_detalhe_venda
        , cast (carriertrackingnumber as string) as numero_rastreamento
        , cast (orderqty as int) as quantidade_pedido
        , cast (productid as int) as id_produto
        , cast (specialofferid as int) as id_desconto_especial
        , cast (unitprice as numeric) as preco_unitario
        , cast (unitpricediscount as numeric) as preco_desconto
        , cast (rowguid as string) as rowguid
        , cast (modifieddate as string) as data_modificada
        from {{source('erp','salesorderdetail')}}
    )

select *
from fonte_vendas_detalhes