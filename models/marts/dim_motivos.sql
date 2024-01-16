with
    stg_vendas_motivos as (
        select 
        id_venda_motivo
        , nome_motivo
        , tipo_motivo
        , data_modificada_motivo
        from {{ ref('stg_erp__vendas_motivos') }}
    )
    
    , stg_vendas_pedids_motivos as(
        select 
        id_venda_pedido_chave
        , id_venda_motivo_chave
        , data_modificada_chave
        from {{ ref('stg_erp__vendas_pedidos_motivos') }}
    )

    , joined_tabelas as (
        select *
        from stg_vendas_motivos
        left join stg_vendas_pedids_motivos on
        stg_vendas_motivos.id_venda_motivo = stg_vendas_pedids_motivos.id_venda_motivo_chave
    )

select *
from joined_tabelas