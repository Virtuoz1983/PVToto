/*
		Internal system tables with Tot_Variants

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_Variants', 'U') IS NULL
    BEGIN
		CREATE TABLE [dbo].[;]
			(
			[id] [int] IDENTITY(1,1) NOT NULL,
			[kol] [int] NULL,
			[tirag] [int] NULL,
			[varN] [smallint] NULL,
			[s00] [nvarchar](5) NULL,
			[s01] [nvarchar](5) NULL,
			[s02] [nvarchar](5) NULL,
			[s03] [nvarchar](5) NULL,
			[s10] [nvarchar](5) NULL,
			[s11] [nvarchar](5) NULL,
			[s12] [nvarchar](5) NULL,
			[s13] [nvarchar](5) NULL,
			[s20] [nvarchar](5) NULL,
			[s21] [nvarchar](5) NULL,
			[s22] [nvarchar](5) NULL,
			[s23] [nvarchar](5) NULL,
			[s30] [nvarchar](5) NULL,
			[s31] [nvarchar](5) NULL,
			[s32] [nvarchar](5) NULL,
			[s33] [nvarchar](5) NULL,
			[sLD] [nvarchar](5) NULL,
					CONSTRAINT [PK_Variants_ID] PRIMARY KEY CLUSTERED
					([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			)
			ON [PRIMARY];
	END;
GO