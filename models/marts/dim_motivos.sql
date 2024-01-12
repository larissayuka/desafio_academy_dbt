with
    stg_vendas_pedidos_motivos as (
        select 
            id_pedido_venda
            , id_motivo_venda
            , data_modificada
        from {{ ref('stg_erp__vendas_pedidos_motivos') }}
    )

    , stg_vendas_motivos as (
        select 
            id_motivo_venda
            , nome_motivo
            , motivo_tipo
            , data_modificada
        from {{ ref('stg_erp__vendas_motivos') }}
    )

    , joined_tabelas as (
        select *
        from stg_vendas_pedidos_motivos
        left join stg_vendas_motivos on
        stg_vendas_pedidos_motivos.id_motivo_venda = stg_vendas_motivos.id_motivo_venda
    )

select *
from joined_tabelas