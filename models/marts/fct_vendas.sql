with
    clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )

    , enderecos as (
        select *
        from {{ ref('dim_enderecos') }}
    )

    , produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )

    , int_vendas as (
        select *
        from {{ ref('int_vendas') }}
    )

    , joined_tabelas as (
        select *
        from int_vendas
        left join produtos on
        int_vendas.id_produto_detalhe = produtos.id_produto
        left join enderecos on
        int_vendas.id_territorio_pedido = enderecos.id_territorio
        left join clientes on
        int_vendas.id_cliente_pedido = clientes.id_cliente
    )

    , transformacoes as (
        select 
        *
        , quantidade_pedido_detalhe * preco_unitario_detalhe as faturamento_bruto
        , quantidade_pedido_detalhe * preco_unitario_detalhe - (quantidade_pedido_detalhe * preco_unitario_detalhe * (1-preco_desconto_detalhe)) as desconto_produto
        from joined_tabelas
    )

    , select_final as (
        select *
       /*CHAVE
        sk_venda
        , id_venda_pedido_detalhe
        , id_cliente_pedido
        , id_territorio_pedido
        , id_enviar_para_endereco_pedido
        , id_cartao_credito_pedido
        , id_venda_pedido_detalhe_detalhe
        , id_produto_detalhe
        , id_produto
        , id_venda_motivo
        , id_venda_pedido_chave
        , id_endereco
        , id_estado
        , id_territorio
        , id_cliente
        , id_territorio_cliente
        DATA
        , data_pedido
        METRICA
        , subtotal_pedido
        , taxamt_pedido
        , frete_pedido
        , valor_total_pedido
        , quantidade_pedido_detalhe
        , preco_unitario_detalhe
        , preco_desconto_detalhe
        , faturamento_bruto
        , desconto_produto
        CATEGORIA
        , status_pedido
        , nome_produto
        , nivel_estoque_produto
        , ponto_reabastecimento_produto
        , nome_motivo
        , tipo_motivo
        , endereco1_endereco
        , cidade_endereco
        , codigo_postal_endereco
        , codigo_estado
        , nome_estado
        , codigo_pais
        , nome_pais
        , nome_territorio*/
        from transformacoes
    )
    
select *
from select_final