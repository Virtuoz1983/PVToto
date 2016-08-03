/*

	Generate resultes, based on generated pakets

	Tereshenko V.A.  02.08.2016   - created this SP
	Tereshenko V.A.  03.08.2016   - added CAST operatoin to the final SELECT operator

*/

CREATE PROCEDURE [dbo].[GenerateResultsTest] (@TiragNum INT, @BetAmount NUMERIC(9,2) = 0.2)
AS
BEGIN

WITH CTE_KolBet AS 
(
SELECT kt.tirag,
	   kt.try,
	   COUNT(1) AS CountBet,  
	   CASE WHEN var1 = h1.exodus THEN 1 ELSE 0 END + CASE WHEN var2 = h2.exodus THEN 1 ELSE 0 END +
	   CASE WHEN var3 = h3.exodus THEN 1 ELSE 0 END + CASE WHEN var4 = h4.exodus THEN 1 ELSE 0 END +
	   CASE WHEN var5 = h5.exodus THEN 1 ELSE 0 END + CASE WHEN var6 = h6.exodus THEN 1 ELSE 0 END +
	   CASE WHEN var7 = h7.exodus THEN 1 ELSE 0 END + CASE WHEN var8 = h8.exodus THEN 1 ELSE 0 END AS Kateg
FROM [dbo].[Tot_KuponsTest] kt
	LEFT JOIN [dbo].[HistoryTotalsMT] h1 ON kt.tirag = h1.tirag AND h1.numb = 1
	LEFT JOIN [dbo].[HistoryTotalsMT] h2 ON kt.tirag = h2.tirag AND h2.numb = 2
	LEFT JOIN [dbo].[HistoryTotalsMT] h3 ON kt.tirag = h3.tirag AND h3.numb = 3
	LEFT JOIN [dbo].[HistoryTotalsMT] h4 ON kt.tirag = h4.tirag AND h4.numb = 4
	LEFT JOIN [dbo].[HistoryTotalsMT] h5 ON kt.tirag = h5.tirag AND h5.numb = 5
	LEFT JOIN [dbo].[HistoryTotalsMT] h6 ON kt.tirag = h6.tirag AND h6.numb = 6
	LEFT JOIN [dbo].[HistoryTotalsMT] h7 ON kt.tirag = h7.tirag AND h7.numb = 7
	LEFT JOIN [dbo].[HistoryTotalsMT] h8 ON kt.tirag = h8.tirag AND h8.numb = 8
WHERE kt.tirag = @TiragNum --AND kt.try = 1
GROUP BY kt.tirag,
	   kt.try,
	   CASE WHEN var1 = h1.exodus THEN 1 ELSE 0 END + CASE WHEN var2 = h2.exodus THEN 1 ELSE 0 END +
	   CASE WHEN var3 = h3.exodus THEN 1 ELSE 0 END + CASE WHEN var4 = h4.exodus THEN 1 ELSE 0 END +
	   CASE WHEN var5 = h5.exodus THEN 1 ELSE 0 END + CASE WHEN var6 = h6.exodus THEN 1 ELSE 0 END +
	   CASE WHEN var7 = h7.exodus THEN 1 ELSE 0 END + CASE WHEN var8 = h8.exodus THEN 1 ELSE 0 END
--ORDER BY tirag, try, Kateg desc
), 
CTE_PreGrouped AS
(SELECT kb.tirag, 
	   kb.try	   
	   , CASE WHEN Kateg = 8 THEN kb.CountBet ELSE 0 END AS Count8	   
	   , CASE WHEN Kateg = 7 THEN kb.CountBet ELSE 0 END AS Count7
	   , CASE WHEN Kateg = 6 THEN kb.CountBet ELSE 0 END AS Count6	   
	   , CASE WHEN Kateg = 5 THEN kb.CountBet ELSE 0 END AS Count5	   
	   , CASE WHEN Kateg = 4 THEN kb.CountBet ELSE 0 END AS Count4	   
	   , CASE WHEN Kateg = 3 THEN kb.CountBet ELSE 0 END AS Count3	   
	   , CASE WHEN Kateg = 2 THEN kb.CountBet ELSE 0 END AS Count2	   
FROM CTE_KolBet kb
	JOIN  [dbo].[HistoryTotalsMT] h ON h.tirag = kb.tirag AND h.numb = 1
), CTE_Grouped AS 
(
SELECT pg.tirag, pg.try, SUM(Count8) AS sCount8, SUM(Count7) AS SCount7, SUM(Count6) AS SCount6, SUM(Count5) AS SCount5, SUM(Count4) AS SCount4, SUM(Count3) AS SCount3, SUM(Count2) AS SCount2
FROM CTE_PreGrouped pg
GROUP BY pg.tirag, pg.try
)
INSERT INTO [dbo].[Tot_TestResults]
           ([tirag],[try],[sCount8],[sCount7],[sCount6],[sCount5],[sCount4],[sCount3],[sCount2],[KuponCounts]
           ,[Profit8],[Profit7],[Profit6],[Profit5],[Profit4],[Profit3],[Profit2],[FullProfit])
SELECT gr.*, aa.KuponsCount, CAST(gr.sCount8*ff.koef8*@BetAmount AS NUMERIC(9,2)) AS Profit8, CAST(gr.sCount7*ff.koef7*@BetAmount AS NUMERIC(9,2)) AS Profit7,
							 CAST(gr.sCount6*ff.koef6*@BetAmount AS NUMERIC(9,2)) AS Profit6, CAST(gr.sCount5*ff.koef5*@BetAmount AS NUMERIC(9,2)) AS Profit5,
							 CAST(gr.sCount4*ff.koef4*@BetAmount AS NUMERIC(9,2)) AS Profit4, CAST(gr.sCount3*ff.koef3*@BetAmount AS NUMERIC(9,2)) AS Profit3,
							 CAST(gr.sCount2*ff.koef2*@BetAmount AS NUMERIC(9,2)) AS Profit2,
							 CAST(gr.sCount8*ff.koef8*@BetAmount + gr.sCount7*ff.koef7*@BetAmount +
							 gr.sCount6*ff.koef6*@BetAmount + gr.sCount5*ff.koef5*@BetAmount +
							 gr.sCount4*ff.koef4*@BetAmount + gr.sCount3*ff.koef3*@BetAmount +
							 gr.sCount2*ff.koef2*@BetAmount - aa.KuponsCount*@BetAmount AS NUMERIC(9,2)) AS FullProfit
FROM CTE_Grouped gr
     JOIN (
		 SELECT tirag, try, COUNT(1) AS KuponsCount
		 FROM [dbo].[Tot_KuponsTest]		 
		 GROUP BY tirag, try
	      ) aa ON gr.tirag = aa.tirag AND gr.try = aa.try
    CROSS APPLY GetCalculatedKoefPerTirag(gr.tirag, aa.KuponsCount, gr.SCount8,gr.SCount7,gr.SCount6,gr.SCount5,gr.SCount4,gr.SCount3,gr.SCount2) ff
ORDER BY 1,2

END 




