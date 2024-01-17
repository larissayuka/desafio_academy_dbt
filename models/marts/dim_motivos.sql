with
    stg_vendas_motivos as (
        select 
        id_venda_motivo
        , nome_motivo
        , tipo_motivo
        from {{ ref('stg_erp__vendas_motivos') }}
    )
    
    , stg_vendas_pedids_motivos as(
        select 
        id_venda_pedido_chave
        , id_venda_motivo_chave
        from {{ ref('stg_erp__vendas_pedidos_motivos') }}
    )

    , joined_tabelas as (
        select 
        stg_vendas_motivos.id_venda_motivo
        , stg_vendas_motivos.nome_motivo
        , stg_vendas_motivos.tipo_motivo
        , stg_vendas_pedids_motivos.id_venda_pedido_chave
        from stg_vendas_motivos
        left join stg_vendas_pedids_motivos on
        stg_vendas_motivos.id_venda_motivo = stg_vendas_pedids_motivos.id_venda_motivo_chave
    )

select *
from joined_tabelas