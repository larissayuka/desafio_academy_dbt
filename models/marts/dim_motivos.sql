with
    stg_vendas_motivos as (
        select *
        from {{ ref('stg_erp__vendas_motivos') }}
    )
    
    , stg_vendas_pedidos_motivos as(
        select *
        from {{ ref('stg_erp__vendas_pedidos_motivos') }}
    )

    , joined_tabelas as (
        select *
        from stg_vendas_pedidos_motivos
        left join stg_vendas_motivos on
        stg_vendas_pedidos_motivos.id_venda_motivo_chave = stg_vendas_motivos.id_venda_motivo
    )

select *
from joined_tabelas