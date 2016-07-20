/*
		Internal system tables with Tot_RealDataSets

		Yakovlev P.V.   20.04.2016  - created this table
		Tereshenko V.A. 20.07.2016  - renamed this table
*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_PlayerDataSets', 'U') IS NULL 
    BEGIN
	    CREATE TABLE [dbo].[Tot_PlayerDataSets] 
			(
			[id] [int] IDENTITY(1,1) NOT NULL, 
			[tirag] [int] NULL,
			[tirag_kol] [int] NULL,
			[NumMatch] [int] NULL,
			[koef] [numeric](9, 2) NULL,
			[kol] [int] NULL,
			[perc] [numeric](9, 2) NULL,
			[result] [nvarchar](10) NULL,
			[orderby] [int] NULL,
			[crd] [datetime] NULL,
				CONSTRAINT [PK_RealDataSets_ID] PRIMARY KEY CLUSTERED ([id] ASC)
				WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
				IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			)
			ON [PRIMARY];
    END;
GO