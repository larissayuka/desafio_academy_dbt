with
    stg_enderecos as (
        select *
        from {{ ref('stg_erp__enderecos') }}
    )

    , stg_estados as (
        select *
        from {{ ref('stg_erp__estados') }}
    )

    , stg_paises as (
        select *
        from {{ ref('stg_erp__paises') }}
    )

    , stg_territorios as (
        select *
        from {{ ref('stg_erp__vendas_territorios') }}
    )

    , joined_tabelas as (
        select 
        stg_enderecos.id_endereco
        , stg_enderecos.endereco1_endereco
        , stg_enderecos.cidade_endereco
        , stg_enderecos.id_estado_endereco

        , stg_estados.id_estado
        , stg_estados.codigo_estado
        , stg_estados.codigo_pais_estado
        , stg_estados.nome_estado
        , stg_estados.id_territorio_estado

        , stg_paises.codigo_pais
        , stg_paises.nome_pais

        , stg_territorios.id_territorio
        , stg_territorios.nome_territorio
        , stg_territorios.codigo_pais_territorio

        from stg_enderecos
        left join stg_estados on
            stg_enderecos.id_estado_endereco = stg_estados.id_estado 
        left join stg_paises on
            stg_estados.codigo_pais_estado = stg_paises.codigo_pais
        left join stg_territorios on
            stg_estados.id_territorio_estado = stg_territorios.id_territorio
    )

select * 
from joined_tabelas