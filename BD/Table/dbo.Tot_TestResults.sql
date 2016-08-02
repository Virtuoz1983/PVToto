/*
		Internal system tables with ranges for percentage.		

		Tereshenko V.A.    02.08.2016  - created this table 

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_TestResults', 'U') IS NULL
    BEGIN
	 CREATE TABLE [dbo].Tot_TestResults
			(
				    [id] [INT] IDENTITY(1,1) NOT NULL,
					[tirag] [INT] NULL,
					[try] [INT] NULL,
					sCount8 [INT] NULL,
					sCount7 [INT] NULL,
					sCount6 [INT] NULL,
					sCount5 [INT] NULL,
					sCount4 [INT] NULL,
					sCount3 [INT] NULL,
					sCount2 [INT] NULL,
					KuponCounts [INT] NULL,
					Profit8 NUMERIC(9,2),
					Profit7 NUMERIC(9,2),
					Profit6 NUMERIC(9,2),
					Profit5 NUMERIC(9,2),
					Profit4 NUMERIC(9,2),
					Profit3 NUMERIC(9,2),
					Profit2 NUMERIC(9,2),
					FullProfit NUMERIC(9,2),					
					CONSTRAINT [PK_TestResults_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			)
			ON [PRIMARY];
    END;
GO