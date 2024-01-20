with
    stg_cartoes as (
        select 
        id_cartao
        , tipo_cartao
        from {{ ref('stg_erp__cartoes') }}
    )
    
    , stg_cartao_pessoa as (
        select *
        from {{ ref('stg_erp__cartao_pessoa') }}
    )

    , stg_pessoas as (
        select *
        from {{ ref('stg_erp__pessoas') }}
    )

    , joined_tabelas as (
        select 
        id_entidade_comercial_cartao
        , id_cartao_pessoa
        , nome_pessoa
        , id_cartao
        , tipo_cartao
        from stg_cartao_pessoa
        left join stg_pessoas on
        stg_cartao_pessoa.id_entidade_comercial_cartao = stg_pessoas.id_entidade_comercial_pessoa 
        left join stg_cartoes on
        stg_cartao_pessoa.id_cartao_pessoa = stg_cartoes.id_cartao
    )

select *
from joined_tabelas