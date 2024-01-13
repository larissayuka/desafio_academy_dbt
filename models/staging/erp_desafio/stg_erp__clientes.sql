with
    fonte_clientes as (
        select 
        cast (customerid as int) as id_cliente
        , cast (personid as int) as id_pessoa_cliente
        , cast (storeid as int) as id_loja_cliente
        , cast (territoryid as  int) as id_territorio_cliente
        , cast (rowguid as string) as rowguid_cliente
        , cast (modifieddate as string) as data_modificada_cliente
        from {{source('erp','customer')}}
    )

select *
from fonte_clientes