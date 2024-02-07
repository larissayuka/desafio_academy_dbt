with
    fonte_enderecos as (
        select 
        cast (addressid as int) as id_endereco
        , addressline1 as endereco1_endereco
        , addressline2 as endereco2_endereco
        , city as cidade_endereco
        , cast (stateprovinceid as int) as id_estado_endereco
        , postalcode as codigo_postal_endereco
        , spatiallocation as localizacao_espacial_endereco
        from {{source('erp','address')}}
    )

select *
from fonte_enderecos