with
    fonte_entidade_comercial_enderecos as (
        select 
        cast (businessentityid as int) as id_entidade_comercial_endereco
        , cast (addressid as int) as id_endereco_entidade_comercial
        from {{source('erp','businessentityaddress')}}
    )

select *
from fonte_entidade_comercial_enderecos