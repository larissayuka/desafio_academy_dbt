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
        , stg_enderecos.endereco2_endereco
        , stg_enderecos.cidade_endereco
        , stg_enderecos.id_estado_endereco

        , stg_estados.id_estado
        , stg_estados.codigo_estado
        , stg_estados.codigo_pais_estado
        , stg_estados.nome_estado
        , stg_estados.id_territorio_estado

        , stg_paises.codigo_pais
        , stg_paises.nome_pais

        from stg_estados
        left join stg_enderecos on
        stg_estados.id_estado = stg_enderecos.id_estado_endereco
        left join stg_paises on
        stg_estados.codigo_pais_estado = stg_paises.codigo_pais
    )

select * 
from joined_tabelas