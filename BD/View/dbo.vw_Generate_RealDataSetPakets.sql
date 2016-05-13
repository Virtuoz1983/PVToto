/*
		Internal system tables with vw_Generate_RealDataSetPakets

		Yakovlev P.V.   20.04.2016  - created this table
						12.05.2016  - modified to view
						13.05.2016  - changed name (remove brakets), refactored code
*/

USE TotDB;
IF OBJECT_ID('dbo.vw_Generate_RealDataSetPakets', 'V') IS NOT NULL
    EXECUTE('DROP VIEW dbo.vw_Generate_RealDataSetPakets');
GO    

CREATE VIEW dbo.vw_Generate_RealDataSetPakets
AS
    SELECT  tm.tirag ,
            paket ,
            tm.NumMatch ,
            tm.Koef ,
            rd.Kol ,
            tm.Result ,
            ROW_NUMBER() OVER ( PARTITION BY tm.tirag, paket, tm.NumMatch ORDER BY tm.Koef ) AS orderby ,
            SUM(Kol) OVER ( PARTITION BY tm.tirag, paket, tm.NumMatch ) AS paket_kol
    FROM    vw_TabloMatches tm
            LEFT JOIN ( SELECT  tirag ,
                                paket ,
                                1 AS NumMatch ,
                                var1 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                paket ,
                                var1
                        UNION ALL
                        SELECT  tirag ,
                                paket ,
                                2 AS NumMatch ,
                                var2 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                paket ,
                                var2
                        UNION ALL
                        SELECT  tirag ,
                                paket ,
                                3 AS NumMatch ,
                                var3 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                paket ,
                                var3
                        UNION ALL
                        SELECT  tirag ,
                                paket ,
                                4 AS NumMatch ,
                                var4 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                paket ,
                                var4
                        UNION ALL
                        SELECT  tirag ,
                                paket ,
                                5 AS NumMatch ,
                                var5 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                paket ,
                                var5
                        UNION ALL
                        SELECT  tirag ,
                                paket ,
                                6 AS NumMatch ,
                                var6 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                paket ,
                                var6
                        UNION ALL
                        SELECT  tirag ,
                                paket ,
                                7 AS NumMatch ,
                                var7 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                paket ,
                                var7
                        UNION ALL
                        SELECT  tirag ,
                                paket ,
                                8 AS NumMatch ,
                                var8 AS Result ,
                                COUNT(1) AS Kol
                        FROM    [dbo].[Tot_RealData]
                        GROUP BY tirag ,
                                paket ,
                                var8
                      ) rd ON tm.tirag = rd.tirag
                              AND tm.NumMatch = rd.NumMatch
                              AND tm.Result = rd.Result
    WHERE   /*tm.tirag = 1868 AND tm.NumMatch = 1 AND paket = 100 AND*/
            rd.Kol IS NOT NULL;