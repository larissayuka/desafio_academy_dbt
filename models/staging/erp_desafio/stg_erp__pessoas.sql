with
    fonte_pessoas as (
        select 
        cast (businessentityid as int) as id_entidade_comercial_pessoa
        , persontype as tipo_pessoa
        , namestyle as estilo_nome_pessoa
        , title as titulo_pessoa
        , firstname || ' ' || lastname as nome_pessoa
        , suffix as sufixo_pessoa
        , cast (emailpromotion as int) as promocao_email_pessoa
        , additionalcontactinfo as info_adicional_pessoa
        , demographics as demografia_pessoa
        from {{source('erp','person')}}
    )

select *
from fonte_pessoas