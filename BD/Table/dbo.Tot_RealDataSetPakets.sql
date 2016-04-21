/*
		Internal system tables with Tot_RealDataSetPakets

		Yakovlev P.V.   20.04.2016  - created this table

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_RealDataSetPakets', 'U') IS NULL
    BEGIN
	    CREATE TABLE [dbo].[Tot_RealDataSetPakets]
			(
			[id] [int] IDENTITY(1,1) NOT NULL,
			[tirag] [int] NULL,
			[paket] [int] NULL,
			[paket_kol] [int] NULL,
			[NumMatch] [int] NULL,
			[koef] [numeric](9, 2) NULL,
			[kol] [int] NULL,
			[perc] [numeric](9, 2) NULL,
			[result] [nvarchar](10) NULL,
			[orderby] [int] NULL,
			[baza] [bit] NULL,
			[crd] [datetime] NULL,
				CONSTRAINT [PK_RealDataSetPakets_ID] PRIMARY KEY CLUSTERED ([id] ASC)
				WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, 
				IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			) 
			ON [PRIMARY];
    END;
GO