/*
		Internal system tables with ranges for percentage.		

		Tereshenko V.A.    29.07.2016  - created this table 

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_RangesForPerc', 'U') IS NULL
    BEGIN
	 CREATE TABLE [dbo].[Tot_RangesForPerc]
			(
			[id] [INT] IDENTITY(1,1) NOT NULL,
			[TestNum] [INT] NULL,
			[TestDescription] [NVARCHAR](200) NULL,
			[UseForResult] [NVARCHAR](10) NULL,
			[RangeFrom] [NUMERIC](9, 2) NULL,
			[RangeTo] [NUMERIC](9, 2) NULL,
			[PercValue] [INT] NULL,			
					CONSTRAINT [PK_RangesForPerc_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			)
			ON [PRIMARY];
    END;
GO