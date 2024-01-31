with
    fonte_contatos as (
        select 
        cast (businessentityid as int) as id_entidade_comercial_contato
        , cast (personid as int) as id_pessoa_contato
        , cast (contacttypeid as int) as id_contato
        from {{source('erp','businessentitycontact')}}
    )

select *
from fonte_contatos