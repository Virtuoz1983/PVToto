/*
		Internal system tables with Tot_var15

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_var15', 'U') IS NULL
    BEGIN
		CREATE TABLE [dbo].[Tot_var15]
			(
			[id] [int] IDENTITY(1,1) NOT NULL,
			[n] [nvarchar](10) NULL,
			[tirag] [int] NULL,
					CONSTRAINT [PK_var15_ID] PRIMARY KEY CLUSTERED
					([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) 
			ON [PRIMARY];
    END;
GO