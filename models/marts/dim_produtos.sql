with
    stg_produtos as (
        select 
            id_produto
            , nome_produto
            , numero_produto
            , makeflag
            , finishedgoodsflag
            , cor
            , nivel_estoque
            , ponto_reabastecimento
            , custo_padrao
            , tabela_preco
            , tamanho
            , unidade_tamanho
            , unidade_peso
            , peso
            , data_fabricar
            , linha_fabricacao
            , classificacao
            , estilo
            , id_subcategoria
            , id_modelo_produto
            , data_inicio_venda
            , data_fim_venda
            , data_descontinuada
            , rowguid
            , data_modificada
        from {{ ref('stg_erp__produtos') }}
    )

    , stg_vendas_detalhes as (
        select 
            id_pedido_venda
            , id_detalhe_venda
            , numero_rastreamento
            , quantidade_pedido
            , id_produto
            , id_desconto_especial
            , preco_unitario
            , preco_desconto
            , rowguid
            , data_modificada
        from {{ ref('stg_erp__vendas_detalhes') }}
    )

    , joined_tabelas as (
        select 
            stg_produtos.id_produto
            , stg_produtos.nome_produto
            , stg_produtos.numero_produto
            , stg_produtos.makeflag
            , stg_produtos.finishedgoodsflag
            , stg_produtos.cor
            , stg_produtos.nivel_estoque
            , stg_produtos.ponto_reabastecimento
            , stg_produtos.custo_padrao
            , stg_produtos.tabela_preco
            , stg_produtos.tamanho
            , stg_produtos.unidade_tamanho
            , stg_produtos.unidade_peso
            , stg_produtos.peso
            , stg_produtos.data_fabricar
            , stg_produtos.linha_fabricacao
            , stg_produtos.classificacao
            , stg_produtos.estilo
            , stg_produtos.id_subcategoria
            , stg_produtos.id_modelo_produto
            , stg_produtos.data_inicio_venda
            , stg_produtos.data_fim_venda
            , stg_produtos.data_descontinuada
            , stg_produtos.rowguid
            , stg_produtos.data_modificada

            , stg_vendas_detalhes.id_pedido_venda
            , stg_vendas_detalhes.id_detalhe_venda
            , stg_vendas_detalhes.numero_rastreamento
            , stg_vendas_detalhes.quantidade_pedido
            , stg_vendas_detalhes.id_produto
            , stg_vendas_detalhes.id_desconto_especial
            , stg_vendas_detalhes.preco_unitario
            , stg_vendas_detalhes.preco_desconto
            , stg_vendas_detalhes.rowguid
            , stg_vendas_detalhes.data_modificada
        from stg_produtos
        left join stg_vendas_detalhes on
            stg_produtos.id_produto = stg_vendas_detalhes.id_produto
    )
select *
from joined_tabelas