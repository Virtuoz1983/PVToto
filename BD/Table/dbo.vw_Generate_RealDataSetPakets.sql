/*
		Internal system tables with vw_Generate_RealDataSetPakets

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.vw_Generate_RealDataSetPakets', 'U') IS NULL
    BEGIN
		CREATE TABLE [dbo].[vw_Generate_RealDataSetPakets]
			(
			[id] [int] IDENTITY(1,1) NOT NULL, -- внесли
			[tirag] [int] NULL,
			[paket] [int] NULL,
			[NumMatch] [int] NULL,
			[Koef] [numeric](9, 2) NULL,
			[Kol] [int] NULL,
			[Result] [varchar](3) NOT NULL,
			[orderby] [bigint] NULL,
			[paket_kol] [int] NULL,
					CONSTRAINT [PK_vw_Generate_RealDataSetPakets_ID] PRIMARY KEY CLUSTERED
					([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) ON [PRIMARY]
    END;
GO