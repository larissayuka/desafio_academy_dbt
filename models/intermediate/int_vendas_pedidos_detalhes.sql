with
    stg_vendas_pedidos as (
        select *
        from {{ ref('stg_erp__vendas_pedidos') }}
    )

    , stg_vendas_detalhes as (
        select *
        from {{ ref('stg_erp__vendas_detalhes') }}
    )

    , joined_tabelas as (
        select 
        stg_vendas_pedidos.id_venda_pedido
        , stg_vendas_pedidos.data_pedido
        , stg_vendas_pedidos.status_pedido
        , stg_vendas_pedidos.id_cliente_pedido
        , stg_vendas_pedidos.id_territorio_pedido
        , stg_vendas_pedidos.id_enviar_para_endereco_pedido
        , stg_vendas_pedidos.id_cartao_credito_pedido
        , stg_vendas_pedidos.subtotal_pedido
        , stg_vendas_pedidos.taxamt_pedido
        , stg_vendas_pedidos.frete_pedido
        , stg_vendas_pedidos.valor_total_pedido

        , stg_vendas_detalhes.id_venda_pedido_detalhe
        , stg_vendas_detalhes.id_venda_pedido_detalhe_detalhe
        , stg_vendas_detalhes.quantidade_pedido_detalhe
        , stg_vendas_detalhes.id_produto_detalhe
        , stg_vendas_detalhes.preco_unitario_detalhe
        , stg_vendas_detalhes.preco_desconto_detalhe
        
        from stg_vendas_detalhes
        left join stg_vendas_pedidos on 
        stg_vendas_detalhes.id_venda_pedido_detalhe = stg_vendas_pedidos.id_venda_pedido
    )

    , criar_chave as (
        select 
            cast (id_venda_pedido as string) || '-' || cast (id_venda_pedido_detalhe_detalhe as string) as sk_venda
            , *
        from joined_tabelas
    )

select *
from criar_chave
order by sk_venda