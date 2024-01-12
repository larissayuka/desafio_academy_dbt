with
    fonte_produtos as (
        select 
        cast (productid as int) as id_produto
        , cast (name as string) as nome_produto
        , cast (productnumber as string) as numero_produto
        , cast (makeflag as string) as makeflag
        , cast (finishedgoodsflag as string) as finishedgoodsflag
        , cast (color as string) as cor
        , cast (safetystocklevel as int) as nivel_estoque
        , cast (reorderpoint as int) as ponto_reabastecimento
        , cast (standardcost as numeric) as custo_padrao
        , cast (listprice as numeric) as tabela_preco
        , cast (size as string) as tamanho
        , cast (sizeunitmeasurecode as string) as unidade_tamanho
        , cast (weightunitmeasurecode as string) as unidade_peso
        , cast (weight as numeric) as peso
        , cast (daystomanufacture as int) as data_fabricar
        , cast (productline as string) as linha_fabricacao
        , cast (class as string) as classificacao
        , cast (style as string) as estilo
        , cast (productsubcategoryid as int) as id_subcategoria
        , cast (productmodelid as int) as id_modelo_produto
        , cast (sellstartdate as string) as data_inicio_venda
        , cast (sellenddate as string) as data_fim_venda
        , cast (discontinueddate as int) as data_descontinuada
        , cast (rowguid as string) as rowguid
        , cast (modifieddate as string) data_modificada
        from {{source('erp','product')}}
    )
    
select *
from fonte_produtos