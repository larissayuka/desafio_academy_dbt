with
    stg_cliente as (
        select 
        id_cliente
        , id_territorio_cliente
        from {{ ref('stg_erp__clientes') }}
    )

    , stg_venda_historico as (
        select 
        id_entidade_comercial_historico
        , id_territorio_historico
        from {{ ref('stg_erp_vendas_historicos') }}
    )

    , stg_pessoas as (
        select *
        from {{ ref('stg_erp__pessoas') }}
    )

    , joined_tabelas as (
        select 
        id_cliente
        , id_territorio_cliente

        , id_entidade_comercial_historico
        , id_territorio_historico

        , id_entidade_comercial_pessoa
        , tipo_pessoa
        , nome_pessoa

        from stg_cliente
        left join stg_venda_historico on
        stg_cliente.id_territorio_cliente = stg_venda_historico.id_territorio_historico
        left join stg_pessoas on
        stg_venda_historico.id_entidade_comercial_historico= stg_pessoas.id_entidade_comercial_pessoa
    )

select *
from joined_tabelas