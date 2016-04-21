/*
		Internal system tables with Tot_HistoryPayKoef

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_HistoryPayKoef', 'U') IS NULL
    BEGIN
		CREATE TABLE [dbo].[Tot_HistoryPayKoef]
			(
			[id] [int] IDENTITY(1,1) NOT NULL,
			[tirag] [int] NULL,
			[koef_7] [numeric](9, 4) NULL,
			[koef_6] [numeric](9, 4) NULL,
			[koef_5] [numeric](9, 4) NULL,
			[koef_4] [numeric](9, 4) NULL,
			[koef_3] [numeric](9, 4) NULL,
			[koef_2] [numeric](9, 4) NULL,
				CONSTRAINT [PK_HistoryPayKoef_ID] PRIMARY KEY CLUSTERED ([id] ASC) 
				WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
				IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY];
    END;
GO