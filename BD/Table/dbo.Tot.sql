/*
		Internal system tables with Tot

		Yakovlev P.V.   20.04.2016  - created this table
*/

USE [TotDB];
IF OBJECT_ID('dbo.Tot', 'U') IS NULL
    BEGIN
        CREATE TABLE [dbo].[Tot]
            (
              id	   INT IDENTITY(1, 1) NOT NULL ,
              kod	   VARCHAR(10)  NULL ,
              ish	   INT			NULL ,
              variants VARCHAR(200) NULL ,
              var1	   VARCHAR(10)  NULL ,
              var2	   VARCHAR(10)  NULL ,
              var3     VARCHAR(10)  NULL ,
              var4     VARCHAR(10)  NULL ,
              var5     VARCHAR(10)  NULL ,
              var6     VARCHAR(10)  NULL ,
              var7     VARCHAR(10)  NULL ,
              var8     VARCHAR(10)  NULL ,
              tirag    INT			NULL ,
              paket    INT			NULL ,
              CONSTRAINT [PK_TOT_ID] PRIMARY KEY CLUSTERED ( [id] ASC )
                WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
            )
        ON  [PRIMARY];
    END;
GO