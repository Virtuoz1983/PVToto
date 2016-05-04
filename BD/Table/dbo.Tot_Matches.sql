/*
		Internal system tables with Tot_Matches

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_Matches', 'U') IS NULL
    BEGIN
	 CREATE TABLE [dbo].[Tot_Matches]
			(
			[id] [int] IDENTITY(1,1) NOT NULL, -- внесли
			[tirag] [int] NULL,
			[NumMatch] [int] NULL,
			[VarName] [nvarchar](200) NULL,
			[VarResult] [nvarchar](10) NULL,
			v01 [numeric](9, 2) NULL,
			v02 [numeric](9, 2) NULL,
			v12 [numeric](9, 2) NULL,
			v03 [numeric](9, 2) NULL,
			v13 [numeric](9, 2) NULL,
			v23 [numeric](9, 2) NULL,
			v00 [numeric](9, 2) NULL,
			v11 [numeric](9, 2) NULL,
			v22 [numeric](9, 2) NULL,
			v33 [numeric](9, 2) NULL,
			v10 [numeric](9, 2) NULL,
			v20 [numeric](9, 2) NULL,
			v21 [numeric](9, 2) NULL,
			v30 [numeric](9, 2) NULL,
			v31 [numeric](9, 2) NULL,
			v32 [numeric](9, 2) NULL,
			vLD [numeric](9, 2) NULL,
					CONSTRAINT [PK_Matches_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			)
			ON [PRIMARY];
    END;
GO