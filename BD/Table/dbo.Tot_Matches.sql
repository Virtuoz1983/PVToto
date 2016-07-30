/*
		Internal system tables with ranges for percentage.		

		Tereshenko V.A.    29.07.2016  - created this table 

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_Matches', 'U') IS NULL
    BEGIN
	 CREATE TABLE [dbo].[Tot_Matches]
			(
				    [id] [INT] IDENTITY(1,1) NOT NULL,
					[tirag] [INT] NULL,
					[NumMatch] [INT] NULL,
					[VarName] [NVARCHAR](200) NULL,
					[VarResult] [NVARCHAR](10) NULL,
					[v01] [NUMERIC](9, 2) NULL,
					[v02] [NUMERIC](9, 2) NULL,
					[v12] [NUMERIC](9, 2) NULL,
					[v03] [NUMERIC](9, 2) NULL,
					[v13] [NUMERIC](9, 2) NULL,
					[v23] [NUMERIC](9, 2) NULL,
					[v00] [NUMERIC](9, 2) NULL,
					[v11] [NUMERIC](9, 2) NULL,
					[v22] [NUMERIC](9, 2) NULL,
					[v33] [NUMERIC](9, 2) NULL,
					[v10] [NUMERIC](9, 2) NULL,
					[v20] [NUMERIC](9, 2) NULL,
					[v21] [NUMERIC](9, 2) NULL,
					[v30] [NUMERIC](9, 2) NULL,
					[v31] [NUMERIC](9, 2) NULL,
					[v32] [NUMERIC](9, 2) NULL,
					[vLD] [NUMERIC](9, 2) NULL,
					CONSTRAINT [PK_Matches_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			)
			ON [PRIMARY];
    END;
GO