/*
		Internal system tables with vw_Generate_RealDataSets

		Yakovlev P.V.   20.04.2016  - created this table
		                12.05.2016  - modified to view
*/

USE TotDB;
IF OBJECT_ID('dbo.vw_Generate_RealDataSets', 'V') IS NOT NULL EXECUTE('DROP VIEW dbo.vw_Generate_RealDataSets');
GO   

CREATE VIEW dbo.vw_Generate_RealDataSets
AS
    SELECT  tm.tirag ,
            tm.NumMatch ,
            tm.Koef ,
            rd.Kol ,
            REPLACE(tm.Result, ':', '-') AS Result ,
            ROW_NUMBER() OVER ( PARTITION BY tm.tirag, tm.NumMatch ORDER BY tm.Koef ) AS orderby ,
            SUM(Kol) OVER ( PARTITION BY tm.tirag, tm.NumMatch ) AS tirag_kol
    FROM    vw_TabloMatches tm
            LEFT JOIN ( SELECT  tirag ,
                                1 AS NumMatch ,
                                var1 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                var1
                        UNION ALL
                        SELECT  tirag ,
                                2 AS NumMatch ,
                                var2 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                var2
                        UNION ALL
                        SELECT  tirag ,
                                3 AS NumMatch ,
                                var3 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                var3
                        UNION ALL
                        SELECT  tirag ,
                                4 AS NumMatch ,
                                var4 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                var4
                        UNION ALL
                        SELECT  tirag ,
                                5 AS NumMatch ,
                                var5 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                var5
                        UNION ALL
                        SELECT  tirag ,
                                6 AS NumMatch ,
                                var6 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                var6
                        UNION ALL
                        SELECT  tirag ,
                                7 AS NumMatch ,
                                var7 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                var7
                        UNION ALL
                        SELECT  tirag ,
                                8 AS NumMatch ,
                                var8 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                var8
                      ) rd ON tm.tirag = rd.tirag
                              AND tm.NumMatch = rd.NumMatch
                              AND tm.Result = rd.Result
    WHERE   /*tm.tirag = 1868 AND tm.NumMatch = 1 AND*/
            rd.Kol IS NOT NULL;