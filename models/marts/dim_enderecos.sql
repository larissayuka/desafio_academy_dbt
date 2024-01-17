with
    stg_territorios as (
        select 
        id_territorio
        , nome_territorio
        , codigo_pais_territorio
        from {{ ref('stg_erp__vendas_territorios') }}
    )

    , stg_enderecos as (
        select 
        id_endereco
        , endereco1_endereco
        , endereco2_endereco
        , cidade_endereco
        , id_estado_endereco
        , codigo_postal_endereco
        from {{ ref('stg_erp__enderecos') }}
    )

    , stg_estados as (
        select 
        id_estado
        , codigo_estado
        , codigo_pais_estado
        , nome_estado
        , id_territorio_estado
        from {{ ref('stg_erp__estados') }}
    )

    , stg_paises as (
        select 
        codigo_pais
        , nome_pais
        from {{ ref('stg_erp__paises') }}
    )

    , joined_tabelas as (
        select 
        stg_enderecos.id_endereco
        , stg_enderecos.endereco1_endereco
        , stg_enderecos.cidade_endereco
        , stg_enderecos.codigo_postal_endereco

        , stg_estados.id_estado
        , stg_estados.codigo_estado
        , stg_estados.nome_estado

        , stg_paises.codigo_pais
        , stg_paises.nome_pais

        , stg_territorios.id_territorio
        , stg_territorios.nome_territorio

        from stg_estados
        left join stg_enderecos on
            stg_estados.id_estado = stg_enderecos.id_estado_endereco
        left join stg_paises on
            stg_estados.codigo_pais_estado = stg_paises.codigo_pais
        left join stg_territorios on
            stg_estados.id_territorio_estado = stg_territorios.id_territorio
    )

select * 
from joined_tabelas