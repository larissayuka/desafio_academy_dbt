with
    fonte_vendas_detalhes as (
        select 
        cast (salesorderid as int) as id_venda_pedido_detalhe
        , cast (salesorderdetailid as int) as id_venda_pedido_detalhe_detalhe
        , cast (carriertrackingnumber as string) as numero_rastreamento_detalhe
        , cast (orderqty as int) as quantidade_pedido_detalhe
        , cast (productid as int) as id_produto_detalhe
        , cast (specialofferid as int) as id_desconto_especial_detalhe
        , cast (unitprice as numeric) as preco_unitario_detalhe
        , cast (unitpricediscount as numeric) as preco_desconto_detalhe
        , cast (rowguid as string) as rowguid_detalhe
        , cast (modifieddate as string) as data_modificada_detalhe
        from {{source('erp','salesorderdetail')}}
    )

select *
from fonte_vendas_detalhes