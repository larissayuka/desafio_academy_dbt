with
    fonte_enderecos as (
        select 
        cast (addressid as int) as id_endereco
        , cast (addressline1 as string) as endereco1
        , cast (addressline2 as string) as endereco2
        , cast (city as string) as cidade
        , cast (stateprovinceid as int) as id_estado
        , cast (postalcode as string) as codigo_postal
        , cast (spatiallocation as string) as localizacao_espacial
        , cast (rowguid as string) as rowguid
        , cast (modifieddate as string) as data_modificada
        from {{source('erp','address')}}
    )

select *
from fonte_enderecos