/*
		Internal system tables with vw_TabloMatches

		Yakovlev P.V.   20.04.2016  - created this table
						12.05.2016  - modified to view
*/

USE TotDB
IF OBJECT_ID('dbo.vw_TabloMatches', 'V') IS NOT NULL EXECUTE('DROP VIEW dbo.vw_TabloMatches')
GO 
CREATE VIEW [dbo].[vw_TabloMatches]
	AS
		SELECT tirag, m.NumMatch, '0:1' AS Result, v01  AS Koef
		FROM [dbo].[Tot_Matches] m
		--WHERE tirag = 1891 AND m.NumMatch = 1
			UNION ALL 
		SELECT tirag, m.NumMatch, '0:2' AS Result, v02  AS Koef
		FROM [dbo].[Tot_Matches] m
		--WHERE tirag = 1891 AND m.NumMatch = 1
			UNION ALL 
		SELECT tirag, m.NumMatch, '1:2' AS Result, v12  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '0:3' AS Result, v03  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '1:3' AS Result, v13  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '2:3' AS Result, v23  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '0:0' AS Result, v00  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '1:1' AS Result, v11  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '2:2' AS Result, v22  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '3:3' AS Result, v33  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '1:0' AS Result, v10  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '2:0' AS Result, v20  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '2:1' AS Result, v21  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '3:0' AS Result, v30  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '3:1' AS Result, v31  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, '3:2' AS Result, v32  AS Koef
		FROM [dbo].[Tot_Matches] m
			UNION ALL 
		SELECT tirag, m.NumMatch, 'LD' AS Result, vLD  AS Koef
		FROM [dbo].[Tot_Matches] m
		GO