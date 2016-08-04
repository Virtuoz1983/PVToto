/*
  View for using from Power BI 

  Tereshenko V.A.  04.08.2016  - created this view

*/

CREATE VIEW dbo.vw_Tot_TestResults AS 
SELECT tr.id, CAST(tr.tirag AS VARCHAR(6)) AS tirag, CAST(tr.try AS VARCHAR(5)) AS [try],
	   tr.sCount8, tr.sCount7, tr.sCount6, tr.sCount5, tr.sCount4, tr.sCount3, tr.sCount2, 
	   tr.KuponCounts,
	   tr.Profit8, tr.Profit7, tr.Profit6, tr.Profit5, tr.Profit4, tr.Profit3, tr.Profit2
FROM [dbo].[Tot_TestResults] tr