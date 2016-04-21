/*
		Internal system tables with Tot_Tirag

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_Tirag', 'U') IS NULL 
    BEGIN
		CREATE TABLE [dbo].[Tot_Tirag] 
			(
			[id] [int] IDENTITY(1,1) NOT NULL, 
			[tirag] [int] NULL,
			[Var1Name] [nvarchar](200) NULL,
			[Var2Name] [nvarchar](200) NULL,
			[Var3Name] [nvarchar](200) NULL,
			[Var4Name] [nvarchar](200) NULL,
			[Var5Name] [nvarchar](200) NULL,
			[Var6Name] [nvarchar](200) NULL,
			[Var7Name] [nvarchar](200) NULL,
			[Var8Name] [nvarchar](200) NULL,
			[Var1Result] [nvarchar](10) NULL,
			[Var2Result] [nvarchar](10) NULL,
			[Var3Result] [nvarchar](10) NULL,
			[Var4Result] [nvarchar](10) NULL,
			[Var5Result] [nvarchar](10) NULL,
			[Var6Result] [nvarchar](10) NULL,
			[Var7Result] [nvarchar](10) NULL,
			[Var8Result] [nvarchar](10) NULL,
					CONSTRAINT [PK_Tirag_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY];
    END;
GO