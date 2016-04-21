/*
		Internal system tables with Tot_Kupons

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_Kupons', 'U') IS NULL 
    BEGIN

       CREATE TABLE [dbo].[Tot_Kupons] 
			(
			[id] [int] IDENTITY(1,1) NOT NULL, 
			[tirag] [int] NULL,
			[var1] [nvarchar](10) NULL,
			[var2] [nvarchar](10) NULL,
			[var3] [nvarchar](10) NULL,
			[var4] [nvarchar](10) NULL,
			[var5] [nvarchar](10) NULL,
			[var6] [nvarchar](10) NULL,
			[var7] [nvarchar](10) NULL,
			[var8] [nvarchar](10) NULL,
			[schema_type] [nvarchar](50) NULL,
					CONSTRAINT [PK_Kupons_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
					ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY]
    END;
GO