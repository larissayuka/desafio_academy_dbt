with
    fonte_produtos as (
        select 
        cast (productid as int) as id_produto
        , name as nome_produto
        , productnumber as numero_produto
        , makeflag as makeflag_produto
        , finishedgoodsflag as finishedgoodsflag_produto
        , color as cor_produto
        , cast (safetystocklevel as int) as nivel_estoque_produto
        , cast (reorderpoint as int) as ponto_reabastecimento_produto
        , cast (standardcost as numeric) as custo_padrao_produto
        , cast (listprice as numeric) as tabela_preco_produto
        , size as tamanho_produto
        , sizeunitmeasurecode as unidade_tamanho_produto
        , weightunitmeasurecode as unidade_peso_produto
        , cast (weight as numeric) as peso_produto
        , cast (daystomanufacture as int) as data_fabricar_produto
        , productline as linha_fabricacao_produto
        , class as classificacao_produto
        , style as estilo_produto
        , cast (productsubcategoryid as int) as id_subcategoria_produto
        , cast (productmodelid as int) as id_modelo_produto
        , sellstartdate as data_inicio_venda_produto
        , sellenddate as data_fim_venda_produto
        , cast (discontinueddate as int) as data_descontinuada_produto
        from {{source('erp','product')}}
    )
    
select *
from fonte_produtos