/*
		Internal system tables with generated percentage for test.		

		Tereshenko V.A.    30.07.2016  - created this table 

*/

USE [TotDB]
IF OBJECT_ID('dbo.Tot_GeneratedPercForTest', 'U') IS NULL
    BEGIN
	 CREATE TABLE [dbo].[Tot_GeneratedPercForTest]
			(
			[id] [INT] IDENTITY(1,1) NOT NULL,
			[TestNum] [INT] NULL,
			[TestDescription] [NVARCHAR](200) NULL,
			[Tirag] [INT] NULL,
			[NumMatch] [INT] NULL, 
			[p01] [INT] NULL,
			[p02] [INT] NULL,
			[p12] [INT] NULL,
			[p03] [INT] NULL,
			[p13] [INT] NULL,
			[p23] [INT] NULL,
			[p00] [INT] NULL,
			[p11] [INT] NULL,
			[p22] [INT] NULL,
			[p33] [INT] NULL,
			[p10] [INT] NULL,
			[p20] [INT] NULL,
			[p21] [INT] NULL,
			[p30] [INT] NULL,
			[p31] [INT] NULL,
			[p32] [INT] NULL,
			[pLD] [INT] NULL,
					CONSTRAINT [PK_GeneratedPercForTest_ID] PRIMARY KEY CLUSTERED ([id] ASC)
					WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
					IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			)
			ON [PRIMARY];
    END;
GO