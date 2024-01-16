with
    stg_vendas_pedidos as (
        select 
        id_venda_pedido
        , numero_revisao_pedido
        , data_pedido
        , data_vencimento_pedido
        , data_envio_pedido
        , status_pedido
        , onlineorderflag_pedido
        , numero_compra_pedido
        , numero_conta_pedido
        , id_cliente_pedido
        , id_vendedor_pedido
        , id_territorio_pedido
        , id_fatura_endereco_pedido
        , id_enviar_para_endereco_pedido
        , id_modo_envio_pedido
        , id_cartao_credito_pedido
        , codigo_aprovacao_cartao_cerdito_pedido
        , id_taxa_pedido
        , subtotal_pedido
        , taxamt_pedido
        , frete_pedido
        , valor_total_pedido
        , cometario_pedido
        , rowguid_pedido
        , data_modificada_pedido
        from {{ ref('stg_erp__vendas_pedidos') }}
    )

    , stg_vendas_detalhes as (
        select 
        id_venda_pedido_detalhe
        , id_venda_pedido_detalhe_detalhe
        , numero_rastreamento_detalhe
        , quantidade_pedido_detalhe
        , id_produto_detalhe
        , id_desconto_especial_detalhe
        , preco_unitario_detalhe
        , preco_desconto_detalhe
        , rowguid_detalhe
        , data_modificada_detalhe
        from {{ ref('stg_erp__vendas_detalhes') }}
    )

    , joined_tabelas as (
        select 
        stg_vendas_pedidos.id_venda_pedido
        , stg_vendas_pedidos.numero_revisao_pedido
        , stg_vendas_pedidos.data_pedido
        , stg_vendas_pedidos.data_vencimento_pedido
        , stg_vendas_pedidos.data_envio_pedido
        , stg_vendas_pedidos.status_pedido
        , stg_vendas_pedidos.onlineorderflag_pedido
        , stg_vendas_pedidos.numero_compra_pedido
        , stg_vendas_pedidos.numero_conta_pedido
        , stg_vendas_pedidos.id_cliente_pedido
        , stg_vendas_pedidos.id_vendedor_pedido
        , stg_vendas_pedidos.id_territorio_pedido
        , stg_vendas_pedidos.id_fatura_endereco_pedido
        , stg_vendas_pedidos.id_enviar_para_endereco_pedido
        , stg_vendas_pedidos.id_modo_envio_pedido
        , stg_vendas_pedidos.id_cartao_credito_pedido
        , stg_vendas_pedidos.codigo_aprovacao_cartao_cerdito_pedido
        , stg_vendas_pedidos.id_taxa_pedido
        , stg_vendas_pedidos.subtotal_pedido
        , stg_vendas_pedidos.taxamt_pedido
        , stg_vendas_pedidos.frete_pedido
        , stg_vendas_pedidos.valor_total_pedido
        , stg_vendas_pedidos.cometario_pedido
        , stg_vendas_pedidos.rowguid_pedido
        , stg_vendas_pedidos.data_modificada_pedido

        , stg_vendas_detalhes.id_venda_pedido_detalhe
        , stg_vendas_detalhes.id_venda_pedido_detalhe_detalhe
        , stg_vendas_detalhes.numero_rastreamento_detalhe
        , stg_vendas_detalhes.quantidade_pedido_detalhe
        , stg_vendas_detalhes.id_produto_detalhe
        , stg_vendas_detalhes.id_desconto_especial_detalhe
        , stg_vendas_detalhes.preco_unitario_detalhe
        , stg_vendas_detalhes.preco_desconto_detalhe
        , stg_vendas_detalhes.rowguid_detalhe
        , stg_vendas_detalhes.data_modificada_detalhe 
        from stg_vendas_pedidos
        left join stg_vendas_detalhes on 
            stg_vendas_pedidos.id_venda_pedido = stg_vendas_detalhes.id_venda_pedido_detalhe
    )

    , criar_chave as (
        select 
            cast (id_venda_pedido as string) || '-' || cast (id_venda_pedido_detalhe_detalhe as string) as sk_venda
            , *
        from joined_tabelas
    )

select * 
from criar_chave