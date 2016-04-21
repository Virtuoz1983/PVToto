/*
		Internal system tables with Tot_Sets

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_Sets', 'U') IS NULL
    BEGIN
	    CREATE TABLE [dbo].[Tot_Sets]
			(
			[id] [int] IDENTITY(1,1) NOT NULL,
			[tirag] [int] NULL,
			[NumMatch] [smallint] NULL,
			[v01] [int] NULL,
			[v02] [int] NULL,
			[v12] [int] NULL,
			[v03] [int] NULL,
			[v13] [int] NULL,
			[v23] [int] NULL,
			[v00] [int] NULL,
			[v11] [int] NULL,
			[v22] [int] NULL,
			[v33] [int] NULL,
			[v10] [int] NULL,
			[v20] [int] NULL,
			[v21] [int] NULL,
			[v30] [int] NULL,
			[v31] [int] NULL,
			[v32] [int] NULL,
			[vLD] [int] NULL,
					CONSTRAINT [PK_Sets_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			)
			ON [PRIMARY];
    END;
GO