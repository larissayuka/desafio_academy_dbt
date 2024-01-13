with
    fonte_pessoas as (
        select 
        cast (businessentityid as int) as id_entidade_comercial_pessoa
        , cast (persontype as string) as tipo_pessoa
        , cast (namestyle as string) as estilo_nome_pessoa
        , cast (title as  string) as titulo_pessoa
        , cast (firstname as string)  || ' ' || cast (lastname as string) as nome_pessoa
        , cast (suffix as string) as sufixo_pessoa
        , cast (emailpromotion as int) as promocao_email_pessoa
        , cast (additionalcontactinfo as string) as info_adicional_pessoa
        , cast (demographics as string) as demografia_pessoa
        , cast (rowguid as string) rowguid_pessoa
        , cast (modifieddate as string) data_modificada_pessoa
        from {{source('erp','person')}}
    )

select *
from fonte_pessoas