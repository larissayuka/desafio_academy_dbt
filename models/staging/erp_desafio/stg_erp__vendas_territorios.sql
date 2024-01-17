with
    fonte_venda_territorio as (
        select 
        cast (territoryid as int) as id_territorio
        , cast (name as string) as nome_territorio
        , cast (countryregioncode as string) as codigo_pais_territorio
        , cast (salesytd as numeric) as venda_acumulada_territorio
        , cast (saleslastyear as numeric) as venda_ano_passado_territorio
        , cast (costytd as int) as custo_acumulado_territorio
        , cast (costlastyear as int) as custo_ano_passado_territorio
        from {{source('erp','salesterritory')}}
    )

select *
from fonte_venda_territorio