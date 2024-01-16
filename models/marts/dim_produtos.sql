with
    stg_produtos as (
        select 
        id_produto
        , nome_produto
        , numero_produto
        , makeflag_produto
        , finishedgoodsflag_produto
        , cor_produto
        , nivel_estoque_produto
        , ponto_reabastecimento_produto
        , custo_padrao_produto
        , tabela_preco_produto
        , tamanho_produto
        , unidade_tamanho_produto
        , unidade_peso_produto
        , peso_produto
        , data_fabricar_produto
        , linha_fabricacao_produto
        , classificacao_produto
        , estilo_produto
        , id_subcategoria_produto
        , id_modelo_produto
        , data_inicio_venda_produto
        , data_fim_venda_produto
        , data_descontinuada_produto
        , rowguid_produto
        , data_modificada_produto
        from {{ ref('stg_erp__produtos') }}
    )

select *
from stg_produtos