with
    fonte_estados as (
        select 
        cast (stateprovinceid as int) as id_estado
        , stateprovincecode as codigo_estado
        , countryregioncode as codigo_pais_estado
        , name as nome_estado
        , cast (territoryid as int) as id_territorio_estado
        from {{source('erp','stateprovince')}}
    )

select *
from fonte_estados