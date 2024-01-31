with
    fonte_entidade_comercial_contato as (
        select 
        cast (businessentityid as int) as id_entidade_comercial_contatos
        , cast (personid as int) as id_pessoa_contato
        , cast (contacttypeid as int) as id_tipo_contato
        from {{source('erp','businessentitycontact')}}
    )

select *
from fonte_entidade_comercial_contato