with
    fonte_cartao_pessoa as (
        select 
        cast (businessentityid as int) as id_entidade_comercial_cartao
        , cast (creditcardid as int) as id_cartao_pessoa
        from {{source('erp','personcreditcard')}}
    )

select *
from fonte_cartao_pessoa