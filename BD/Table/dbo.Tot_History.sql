/*
		Internal system tables with History

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_History', 'U') IS NULL
    BEGIN
	     CREATE TABLE [dbo].[Tot_History]
			(
			[id] [int] IDENTITY(1,1) NOT NULL,
			[kupon] [varchar](10) NULL,
			[betAmount] [numeric](5, 2) NULL,
			[countWin] [smallint] NULL,
			[Value] [varchar](250) NULL,
			[tirag] [int] NULL,
			[paketCount] [int] NULL,
					CONSTRAINT [PK_Tot_History_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			)
			 ON [PRIMARY];
    END;
GO