with

    validacao1 as (
        select sum(quantidade_pedido_detalhe*preco_unitario_detalhe) as soma_valor_bruto1
        from {{ ref('int_vendas_pedidos_detalhes') }}
        where data_pedido between "2011-01-01" and "2011-12-31"
    )
 
select *
from validacao1
where soma_valor_bruto1 != 12646112.1607