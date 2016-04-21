/*
		Internal system tables with Tot_Kupons1X2

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_Kupons1X2', 'U') IS NULL
    BEGIN
	   CREATE TABLE [dbo].[Tot_Kupons1X2]
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
			[var9] [nvarchar](10) NULL,
			[var10] [nvarchar](10) NULL,
			[var11] [nvarchar](10) NULL,
			[var12] [nvarchar](10) NULL,
			[var13] [nvarchar](10) NULL,
			[var14] [nvarchar](10) NULL,
			[var15] [nvarchar](10) NULL,
					CONSTRAINT [PK_Kupons1X2_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) 
			ON [PRIMARY];
    END;
GO