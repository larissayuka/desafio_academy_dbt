with
    stg_pessoas as (
        select 
        id_entidade_comercial_pessoa
        , tipo_pessoa
        , estilo_nome_pessoa
        , titulo_pessoa
        , nome_pessoa
        , sufixo_pessoa
        , promocao_email_pessoa
        , info_adicional_pessoa
        , demografia_pessoa
        , rowguid_pessoa
        , data_modificada_pessoa
        from {{ ref('stg_erp__pessoas') }}
    )

select *
from stg_pessoas