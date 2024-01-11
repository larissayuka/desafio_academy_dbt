with
    fonte_clientes as (
        select 
        cast (customerid as int) as id_cliente
        , cast (personid as int) as id_pessoa
        , cast (storeid as int) as id_loja
        , cast (territoryid as  int) as id_territorio
        , cast (rowguid as string) as rowguid
        , cast (modifieddate as string) as data_modificada
        from {{source('erp','customer')}}
    )

select *
from fonte_clientes