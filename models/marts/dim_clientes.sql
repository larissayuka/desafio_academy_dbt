with
    stg_pessoas as (
        select 
        id_entidade_comercial
        , tipo_pessoa
        , estilo_nome
        , titulo
        , nome_pessoa
        , sufixo
        , promocao_email
        , info_adicional
        , demografia
        , rowguid
        , data_modificada
        from {{ ref('stg_erp__pessoas') }}
    )

select *
from stg_pessoas
