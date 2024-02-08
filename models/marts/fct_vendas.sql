with
    clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )

    , enderecos as (
        select *
        from {{ ref('dim_enderecos') }}
    )

    , motivos as (
        select *
        from {{ ref('dim_motivos') }}
    )

    , produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )

    , cartoes as (
        select *
        from {{ ref('dim_cartoes') }}
    )

    , int_vendas as (
        select *
        from {{ ref('int_vendas_pedidos_detalhes') }}
    )

    , joined_tabelas as (
        select *
        from int_vendas
        left join produtos on
        int_vendas.id_produto_detalhe = produtos.id_produto
        left join motivos on
        int_vendas.id_venda_pedido = motivos.id_venda_pedido_chave
        left join cartoes on
        int_vendas.id_cartao_credito_pedido = cartoes.id_cartao
        left join enderecos on
        int_vendas.id_endereco_envio_pedido = enderecos.id_endereco
        left join clientes on
        int_vendas.id_cliente_pedido = clientes.id_cliente
  
    )

    , transformacoes as (
        select 
        *
        , (quantidade_pedido_detalhe * preco_unitario_detalhe) / count(sk_venda) over (partition by sk_venda) as faturamento_bruto
        , ((quantidade_pedido_detalhe * preco_unitario_detalhe) * (1-preco_desconto_detalhe)) / count(sk_venda) over (partition by sk_venda) as faturamento_liquido
        , ((quantidade_pedido_detalhe * preco_unitario_detalhe) * (preco_desconto_detalhe)) / count(sk_venda) over (partition by sk_venda)  as desconto_produto
        from joined_tabelas
    )

    , select_final as (
        select 
        /*CHAVE*/
        sk_venda
        , id_venda_pedido
        , id_cliente_pedido
        , id_cartao_credito_pedido
        , id_endereco_envio_pedido        
        , id_venda_pedido_detalhe
        , id_detalhe_venda_pedido_detalhe
        , id_produto_detalhe
        , id_endereco
        , id_estado_endereco
        , id_estado
        , codigo_pais_estado
        , codigo_pais     
        , sk_motivo
        , id_venda_pedido_chave
        , id_venda_motivo_chave
        , id_venda_motivo
        , id_produto
        , id_cliente
        , id_pessoa_cliente
        , id_loja_cliente
        , id_entidade_comercial_loja
        , id_entidade_comercial_pessoa
        , id_cartao 
        , id_auxiliar      
        /*DATA*/
        , data_pedido
        /*METRICA*/
        , quantidade_pedido_detalhe
        , preco_unitario_detalhe
        , preco_desconto_detalhe
        , faturamento_bruto
        , faturamento_liquido
        , desconto_produto   
        /*CATEGORIA*/
        , status_pedido
        , endereco1_endereco
        , endereco2_endereco
        , cidade_endereco
        , nome_estado
        , nome_pais
        , nome_motivo
        , tipo_motivo
        , nome_produto
        , tipo_cartao
        , nome_pessoa 
        , nome_loja       
        from transformacoes
    )

    , criar_chave as (
        select 
        case
            when id_venda_motivo is null
            then 0
            else id_venda_motivo
        end as id_auxiliar
        , cast (sk_venda as string)  || '-' || cast (id_produto_detalhe as string) || '-' || cast (id_auxiliar as string) as sk_fato_venda
        , *
        from select_final
    )

select *
from criar_chave