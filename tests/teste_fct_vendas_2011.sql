with

    vendas_2011 as (
        select sum(faturamento_bruto) as soma_valor_bruto2
        from {{ ref('fct_vendas') }}
        where data_pedido between "2011-01-01" and "2011-12-31"
    )

select *
from vendas_2011
where soma_valor_bruto2 != 12646112.1607