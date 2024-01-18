with
    stg_vendas_pedidos as (
        select *
        from {{ ref('stg_erp__vendas_pedidos') }}
    )

    , stg_vendas_detalhes as (
        select *
        from {{ ref('stg_erp__vendas_detalhes') }}
    )

    , joined_tabelas as (
        select *
        from stg_vendas_pedidos
        left join stg_vendas_detalhes on 
            stg_vendas_pedidos.id_venda_pedido = stg_vendas_detalhes.id_venda_pedido_detalhe
    )

    , criar_chave as (
        select 
            cast (id_venda_pedido as string) || '-' || cast (id_venda_pedido_detalhe_detalhe as string) as sk_venda
            , *
        from joined_tabelas
    )

select * 
from criar_chave
order by id_venda_pedido