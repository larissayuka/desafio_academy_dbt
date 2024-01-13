with
    fonte_produtos as (
        select 
        cast (productid as int) as id_produto
        , cast (name as string) as nome_produto
        , cast (productnumber as string) as numero_produto
        , cast (makeflag as string) as makeflag_produto
        , cast (finishedgoodsflag as string) as finishedgoodsflag_produto
        , cast (color as string) as cor_produto
        , cast (safetystocklevel as int) as nivel_estoque_produto
        , cast (reorderpoint as int) as ponto_reabastecimento_produto
        , cast (standardcost as numeric) as custo_padrao_produto
        , cast (listprice as numeric) as tabela_preco_produto
        , cast (size as string) as tamanho_produto
        , cast (sizeunitmeasurecode as string) as unidade_tamanho_produto
        , cast (weightunitmeasurecode as string) as unidade_peso_produto
        , cast (weight as numeric) as peso_produto
        , cast (daystomanufacture as int) as data_fabricar_produto
        , cast (productline as string) as linha_fabricacao_produto
        , cast (class as string) as classificacao_produto
        , cast (style as string) as estilo_produto
        , cast (productsubcategoryid as int) as id_subcategoria_produto
        , cast (productmodelid as int) as id_modelo_produto
        , cast (sellstartdate as string) as data_inicio_venda_produto
        , cast (sellenddate as string) as data_fim_venda_produto
        , cast (discontinueddate as int) as data_descontinuada_produto
        , cast (rowguid as string) as rowguid_produto
        , cast (modifieddate as string) data_modificada_produto
        from {{source('erp','product')}}
    )
    
select *
from fonte_produtos