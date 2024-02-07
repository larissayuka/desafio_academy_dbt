with
    fonte_paises as (
        select 
        countryregioncode as codigo_pais
        , name as nome_pais
        from {{source('erp','countryregion')}}
    )

select *
from fonte_paises