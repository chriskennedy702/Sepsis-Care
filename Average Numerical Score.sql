  SELECT --[Facility ID]
      --,[Facility Name]
      --,[City]
      --,[State]
      --,[Condition]
		[Measure Name]
      ,avg(cast([Score] as decimal(6,2))) as 'Average Score'
      --,[Sample]
  FROM [Timely and Effective].[dbo].['Timely_and_Effective_Care-Hospi$']
  where score not like '%[^0-9999999]%'
  Group By [Measure Name]
  order by [Average Score]

