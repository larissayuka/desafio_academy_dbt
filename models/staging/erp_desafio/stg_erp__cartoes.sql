with
    fonte_cartoes as (
        select 
        cast (creditcardid as int) as id_cartao
        , cardtype as tipo_cartao
        from {{source('erp','creditcard')}}
    )

select *
from fonte_cartoes