/*
		Internal system tables with Tot_RealResults

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_RealResults', 'U') IS NULL
    BEGIN
       CREATE TABLE [dbo].[Tot_RealResults]
			(
			[id] [int] IDENTITY(1,1) NOT NULL,
			[OrderBy] [smallint] NULL,
			[ChampName] [nvarchar](500) NULL,
			[Match] [nvarchar](300) NULL,
			[Schet] [nvarchar](10) NULL,
			[Ish] [nvarchar](10) NOT NULL,
			[Tirag] [int] NOT NULL,
					CONSTRAINT [PK_RealResults_ID] PRIMARY KEY CLUSTERED ([id] ASC) 
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY];
    END;
GO