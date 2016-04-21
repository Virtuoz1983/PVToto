/*
		Internal system tables with Tot_Results

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_Results', 'U') IS NULL
    BEGIN
	    CREATE TABLE [dbo].[Tot_Results]
			(
			[id] [int] IDENTITY(1,1) NOT NULL, 
			[Name] [nvarchar](10) NULL,
			[SortBy] [int] NULL,
					CONSTRAINT [PK_Results_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			)
			ON [PRIMARY];
    END;
GO