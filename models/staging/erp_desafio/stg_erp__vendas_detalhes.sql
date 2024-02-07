with
    fonte_vendas_detalhes as (
        select 
        cast (salesorderid as int) as id_venda_pedido_detalhe
        , cast (salesorderdetailid as int) as id_detalhe_venda_pedido_detalhe
        , carriertrackingnumber as numero_rastreamento_detalhe
        , cast (orderqty as int) as quantidade_pedido_detalhe
        , cast (productid as int) as id_produto_detalhe
        , cast (specialofferid as int) as id_desconto_especial_detalhe
        , cast (unitprice as numeric) as preco_unitario_detalhe
        , cast (unitpricediscount as numeric) as preco_desconto_detalhe
        from {{source('erp','salesorderdetail')}}
    )

select *
from fonte_vendas_detalhes