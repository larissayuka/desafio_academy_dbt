with
    stg_vendas_pedidos as (
        select *
        from {{ ref('stg_erp__vendas_pedidos') }}
    )

    , stg_vendas_pedidos_motivos as (
        select *
        from {{ ref('stg_erp__vendas_pedidos_motivos') }}
    )

    , stg_vendas_motivos as (
        select *
        from {{ ref('stg_erp__vendas_motivos') }}
    )

    , stg_vendas_detalhes as (
        select *
        from {{ ref('stg_erp__vendas_detalhes') }}
    )

    , joined_tabelas as (
        select *
        from stg_vendas_pedidos_motivos
        left join  stg_vendas_motivos on
        stg_vendas_pedidos_motivos.id_venda_motivo_chave = stg_vendas_motivos.id_venda_motivo
        left join stg_vendas_pedidos on
        stg_vendas_pedidos_motivos.id_venda_pedido_chave = stg_vendas_pedidos.id_venda_pedido 
        left join stg_vendas_detalhes on
        stg_vendas_pedidos_motivos.id_venda_pedido_chave = stg_vendas_detalhes.id_venda_pedido_detalhe
    )

    , criar_chave as (
        select 
            cast (id_venda_pedido as string) || '-' ||cast (id_venda_pedido_detalhe_detalhe as string) || '-' || cast (id_venda_motivo as string) as sk_venda
            , *
        from joined_tabelas
    )

select * 
from criar_chave
order by sk_venda