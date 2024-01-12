with
    stg_vendas_pedidos as (
        select
            id_pedido_venda
            , numero_revisao
            , data_pedido
            , data_vencimento
            , data_envio
            , status
            , onlineorderflag
            , numero_pedido_compra
            , numero_conta
            , id_cliente
            , id_vendedor
            , id_territorio
            , id_fatura_endereco
            , id_enviar_para_endereco
            , id_modo_envio
            , id_cartao_credito
            , codigo_aprovacao_cartao_cerdito
            , id_taxa
            , subtotal
            , taxamt
            , frete
            , valor_total
            , cometario
            , rowguid
            , data_modificada
        from {{ ref('stg_erp__vendas_pedidos') }}
    )
    
select *
from stg_vendas_pedidos