with
    fonte_estados as (
        select 
        cast (stateprovinceid as int) as id_estado
        ,cast (stateprovincecode as string) as codigo_estado
        ,cast (countryregioncode as string) as codigo_pais_estado
        ,cast (isonlystateprovinceflag as string) as isonlystateprovinceflag_estado
        ,cast (name as string) as nome_estado
        ,cast (territoryid as int) as id_territorio_estado
        ,cast (rowguid as string) as rowguid_estado
        ,cast (modifieddate as string) as data_modificada_estado
        from {{source('erp','stateprovince')}}
    )

select *
from fonte_estados