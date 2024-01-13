with
    fonte_enderecos as (
        select 
        cast (addressid as int) as id_endereco
        , cast (addressline1 as string) as endereco1_endereco
        , cast (addressline2 as string) as endereco2_endereco
        , cast (city as string) as cidade_endereco
        , cast (stateprovinceid as int) as id_estado_endereco
        , cast (postalcode as string) as codigo_postal_endereco
        , cast (spatiallocation as string) as localizacao_espacial_endereco
        , cast (rowguid as string) as rowguid_endereco
        , cast (modifieddate as string) as data_modificada_endereco
        from {{source('erp','address')}}
    )

select *
from fonte_enderecos