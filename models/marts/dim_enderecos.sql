with
    stg_enderecos as (
        select 
        id_endereco
        , endereco1
        , endereco2
        , cidade
        , id_estado
        , codigo_postal
        , localizacao_espacial
        , rowguid
        , data_modificada
        from {{ ref('stg_erp__enderecos') }}
    )

    , stg_estados as (
        select 
        id_estado
        , codigo_estado
        , codigo_pais
        , isonlystateprovinceflag
        , nome_estado
        , id_territorio
        , rowguid
        , data_modificada
        from {{ ref('stg_erp__estados') }}
    )

    , stg_paises as (
        select 
        codigo_pais
        , nome_pais
        , data_modificada
        from {{ ref('stg_erp__paises') }}
    )

    , joined_tabelas as (
        select *
        from stg_estados
        left join stg_enderecos on
        stg_estados.id_estado = stg_enderecos.id_estado
        left join stg_paises on
        stg_estados.codigo_pais = stg_paises.codigo_pais
    )

select * 
from joined_tabelas