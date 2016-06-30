/*
		Reference for links for getting data from "Table of matches" with real odds for every tirag

		Example of "Table of matches":
		http://www.marathontotoservice.com/sttot/pbstyle/SttotTime16.aspx?id=-3593&GMT=+3

		Tereschenko V.A.   30.06.2016  - created this table

*/

IF OBJECT_ID('dbo.Tot_TableMatchesLink', 'U') IS NULL
    BEGIN

        CREATE TABLE dbo.Tot_TableMatchesLink
            (
              id		 INT IDENTITY(1, 1) NOT NULL ,
              tirag		 NVARCHAR(5)    NULL ,
			  Link		 NVARCHAR(250)  NULL ,
			  IsLoaded   BIT			NOT NULL DEFAULT(0),
              CONSTRAINT PK_Tot_TableMatchesLink_ID PRIMARY KEY CLUSTERED (id ASC ) ON [PRIMARY]             
            )
        ON  [PRIMARY];
    END;
