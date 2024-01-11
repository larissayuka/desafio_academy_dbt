with
    fonte_pessoas as (
        select 
        cast (businessentityid as int) as id_entidade_comercial
        , cast (persontype as string) as tipo_pessoa
        , cast (namestyle as string) as estilo_nome
        , cast (title as  string) as titulo
        , cast (firstname as string)  || ' ' || cast (lastname as string) as nome_pessoa
        , cast (suffix as string) as sufixo
        , cast (emailpromotion as int) as promocao_email
        , cast (additionalcontactinfo as string) as info_adicional
        , cast (demographics as string) as demografia
        , cast (rowguid as string) rowguid
        , cast (modifieddate as string) data_modificada
        from {{source('erp','person')}}
    )

select *
from fonte_pessoas