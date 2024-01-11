with
    fonte_paises as (
        select 
        cast (countryregioncode as string) as codigo_pais
        , cast (name as string) as nome_pais
        , cast (modifieddate as string) as data_modificada
        from {{source('erp','countryregion')}}
    )

select *
from fonte_paises