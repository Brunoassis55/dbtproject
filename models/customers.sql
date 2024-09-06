select *
 from (
              select
                      row_number()over(partition by company_name, contact_name order by company_name desc) as flag
                      ,*
              from {{source ('sources', 'customers')}} as ct 
           ) as sub
where flag = 1
    