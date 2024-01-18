with
    stg_salesorder as (
        select *
        from {{ ref('stg_erp__vendas_pedidos') }}
    )

    , stg_salesordersalereason as (
        select *
        from {{ ref('stg_erp__vendas_pedidos_motivos') }}
    )

    , stg_salesreason as (
        select *
        from {{ ref('stg_erp__vendas_motivos') }}
    )

    , stg_salesorderdetail as (
        select *
        from {{ ref('stg_erp__vendas_detalhes') }}
    )

    , joined_tabelas as (
        select *
        from stg_salesordersalereason
        left join  stg_salesreason on
        stg_salesordersalereason.id_venda_motivo_chave = stg_salesreason.id_venda_motivo
        left join stg_salesorder on
        stg_salesordersalereason.id_venda_pedido_chave = stg_salesorder.id_venda_pedido 
        left join stg_salesorderdetail on
        stg_salesordersalereason.id_venda_pedido_chave = stg_salesorderdetail.id_venda_pedido_detalhe
    )

select *
from joined_tabelas