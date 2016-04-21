/*
		Internal system tables with vw_Tot_UniqVariants

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.vw_Tot_UniqVariants', 'U') IS NULL
    BEGIN
		CREATE TABLE [dbo].[vw_Tot_UniqVariants]
			(
			[id] [int] IDENTITY(1,1) NOT NULL,
			[s00] [varchar](1) NOT NULL,
			[s01] [varchar](1) NOT NULL,
			[s02] [varchar](1) NOT NULL,
			[s03] [varchar](1) NOT NULL,
			[s10] [varchar](1) NOT NULL,
			[s11] [varchar](1) NOT NULL,
			[s12] [varchar](1) NOT NULL,
			[s13] [varchar](1) NOT NULL,
			[s20] [varchar](1) NOT NULL,
			[s21] [varchar](1) NOT NULL,
			[s22] [varchar](1) NOT NULL,
			[s23] [varchar](1) NOT NULL,
			[s30] [varchar](1) NOT NULL,
			[s31] [varchar](1) NOT NULL,
			[s32] [varchar](1) NOT NULL,
			[s33] [varchar](1) NOT NULL,
			[sLD] [varchar](1) NOT NULL,
					CONSTRAINT [PK_vw_Tot_UniqVariants_ID] PRIMARY KEY CLUSTERED
					([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) 
			ON [PRIMARY];
    END;
GO