/*
		Internal system tables with numbers

		Tereshenko V.A.   12.04.2016  - created this table

*/

IF OBJECT_ID('dbo.Numbers', 'U') IS NULL
    BEGIN

        CREATE TABLE dbo.Numbers
            (
              number INT NOT NULL ,   -- pregeneraated numbers

              CONSTRAINT PK_Numbers PRIMARY KEY CLUSTERED ( number ASC )
                WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
            )
        ON  [PRIMARY];

    END;
GO
