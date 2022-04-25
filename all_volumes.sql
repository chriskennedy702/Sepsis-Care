--table for average median time in ED
With 
wait as(
  SELECT [Facility ID]
        ,[Facility Name]
        ,[City]
        ,[State]
        ,[Score] as 'Average median time'	
		,[Sample]
  FROM [Timely and Effective].[dbo].['Timely_and_Effective_Care-Hospi$']
  Where Score not like '%Not Available%' and [Measure name] like '%before leaving%' 
			  and [Measure Name] not like '%psych%'and [Facility ID] not like '%NULL%'), 

--table for appropriate care for severe sepsis
app as(
  SELECT [Facility ID]
        ,[Facility Name]
        ,[City]
        ,[State]
        ,[Score] as 'Appropriate Care for Severe Sepsis Score'	
		,[Sample]
  FROM [Timely and Effective].[dbo].['Timely_and_Effective_Care-Hospi$']  
  Where Score not like '%Not Available%' and [Measure name] like '%care for severe sepsis%' 
			  and [Facility ID] not like '%NULL%'
	   ),

--table for severe sepsis 3 hour bundle
three as(
  SELECT [Facility ID]
        ,[Facility Name]
        ,[City]
        ,[State]
        ,[Score] as 'Severe Sepsis 3 Hour Bundle Score'	  
		,[Sample]
  FROM [Timely and Effective].[dbo].['Timely_and_Effective_Care-Hospi$']  
  Where Score not like '%Not Available%' and [Measure name] like '%severe sepsis 3%' 
			  and [Facility ID] not like '%NULL%'
		),

--table for severe sepsis 6 hour bundle
six as(
  SELECT [Facility ID]
        ,[Facility Name]
        ,[City]
        ,[State]
        ,[Score] as 'Severe Sepsis 6 Hour Bundle Score'	
		,[Sample]
  FROM [Timely and Effective].[dbo].['Timely_and_Effective_Care-Hospi$']  
  Where Score not like '%Not Available%' and [Measure name] like '%severe sepsis 6%' 
			  and [Facility ID] not like '%NULL%'
	   )

	SELECT wait.[Facility ID]
		,wait.[Facility Name]
		,wait.[City]
		,wait.[State]
		,wait.[Average median time]
		,app.[Appropriate Care for Severe Sepsis Score]
		,three.[Severe Sepsis 3 Hour Bundle Score]
		,six.[Severe Sepsis 6 Hour Bundle Score]
		,wait.[Sample]
	FROM wait 
	JOIN app ON wait.[Facility ID] = app.[Facility ID]
	JOIN three ON app.[Facility ID] = three.[Facility ID]
	JOIN six ON three.[Facility ID] = six.[Facility ID]
