/*
		Internal system tables with Tot

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot', 'U') IS NULL
    BEGIN
	       		CREATE TABLE [dbo].[Tot]
					(
						[id] [int] IDENTITY(1,1) NOT NULL,
						[kod] [varchar](10) NULL,
						[ish] [int] NULL,
						[variants] [varchar](200) NULL,
						[var1] [varchar](10) NULL,
						[var2] [varchar](10) NULL,
						[var3] [varchar](10) NULL,
						[var4] [varchar](10) NULL,
						[var5] [varchar](10) NULL,
						[var6] [varchar](10) NULL,
						[var7] [varchar](10) NULL,
						[var8] [varchar](10) NULL,
						[tirag] [int] NULL,
						[paket] [int] NULL,
				
						CONSTRAINT [PK_TOT_ID] PRIMARY KEY CLUSTERED ( [id] ASC )
							WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
							IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
					)
						ON [PRIMARY];
	END;
GO