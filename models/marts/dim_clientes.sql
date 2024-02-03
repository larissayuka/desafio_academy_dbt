with
    stg_cliente as (
        select 
        id_cliente
        , id_pessoa_cliente
        , id_loja_cliente
        from {{ ref('stg_erp__clientes') }}
    )

    , stg_pessoa as (
        select 
        id_entidade_comercial_pessoa
        , nome_pessoa
        from {{ ref('stg_erp__pessoas') }}
    )

    , stg_loja as (
        select 
        id_entidade_comercial_loja
        , nome_loja
        from {{ ref('stg_erp__lojas') }}
    )

    , joined_tabelas as (
        select 

        stg_cliente.id_cliente
        , stg_cliente.id_pessoa_cliente
        , stg_cliente.id_loja_cliente

        , stg_pessoa.id_entidade_comercial_pessoa
        , stg_pessoa.nome_pessoa

        , stg_loja.id_entidade_comercial_loja
        , stg_loja.nome_loja

        from stg_cliente
        left join stg_pessoa on
        stg_cliente.id_pessoa_cliente = stg_pessoa.id_entidade_comercial_pessoa
        left join stg_loja on
        stg_cliente.id_loja_cliente = stg_loja.id_entidade_comercial_loja
    )

select *
from joined_tabelas