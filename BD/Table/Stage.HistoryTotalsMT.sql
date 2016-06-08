/*
		Stage table for loading history about previously tirages

		Tereschenko V.A.   07.06.2016  - created this table		

*/


IF OBJECT_ID('Stage.HistoryTotalsMT', 'U') IS NULL
    BEGIN

        CREATE TABLE Stage.HistoryTotalsMT
            (
              id		 INT IDENTITY(1, 1) NOT NULL ,
              tirag		 SMALLINT		NULL ,
              [data]	 DATETIME		NULL ,
              jackPot	 NUMERIC(12, 5) NULL ,
              [pool]	 NUMERIC(12, 5) NULL ,
              complex	 NUMERIC(12, 5) NULL ,
              maxWin	 NUMERIC(12, 5) NULL ,
              quanOption INT NULL ,
              quanUniq	 INT NULL ,
              winJack	 NUMERIC(12, 5) NULL ,
              quan8		 INT NULL ,
              gues8		 NUMERIC(12, 5) NULL ,
              rat8		 NUMERIC(12, 5) NULL ,
              quan7		 INT NULL ,
              sum7		 NUMERIC(12, 5) NULL ,
              res7		 NUMERIC(12, 5) NULL ,
              quan6		 INT NULL ,
              sum6		 NUMERIC(12, 5) NULL ,
              res6		 NUMERIC(12, 5) NULL ,
              quan5		 INT NULL ,
              sum5		 NUMERIC(12, 5) NULL ,
              res5		 NUMERIC(12, 5) NULL ,
              quan4		 INT NULL ,
              sum4		 NUMERIC(12, 5) NULL ,
              res4		 NUMERIC(12, 5) NULL ,
              quan3		 INT NULL ,
              sum3		 NUMERIC(12, 5) NULL ,
              res3		 NUMERIC(12, 5) NULL ,
              quan2		 INT NULL ,
              sum2		 NUMERIC(12, 5) NULL ,
              res2		 NUMERIC(12, 5) NULL ,
              numb		 INT NULL ,
              sect		 NVARCHAR(25) NULL ,
              match		 NVARCHAR(150) NULL ,
              account    NVARCHAR(10) NULL ,
              exodus     NVARCHAR(10) NULL ,
              prob10	 NUMERIC(9, 2) NULL ,
              pool10	 NUMERIC(9, 2) NULL ,
              prob20	 NUMERIC(9, 2) NULL ,
              pool20	 NUMERIC(9, 2) NULL ,
              prob21	 NUMERIC(9, 2) NULL ,
              pool21	 NUMERIC(9, 2) NULL ,
              prob30	 NUMERIC(9, 2) NULL ,
              pool30	 NUMERIC(9, 2) NULL ,
              prob31	 NUMERIC(9, 2) NULL ,
              pool31	 NUMERIC(9, 2) NULL ,
              prob32	 NUMERIC(9, 2) NULL ,
              pool32	 NUMERIC(9, 2) NULL ,
              prob00	 NUMERIC(9, 2) NULL ,
              pool00	 NUMERIC(9, 2) NULL ,
              prob11	 NUMERIC(9, 2) NULL ,
              pool11	 NUMERIC(9, 2) NULL ,
              prob22	 NUMERIC(9, 2) NULL ,
              pool22	 NUMERIC(9, 2) NULL ,
              prob33	 NUMERIC(9, 2) NULL ,
              pool33	 NUMERIC(9, 2) NULL ,
              prob01	 NUMERIC(9, 2) NULL ,
              pool01	 NUMERIC(9, 2) NULL ,
              prob02	 NUMERIC(9, 2) NULL ,
              pool02	 NUMERIC(9, 2) NULL ,
              prob12	 NUMERIC(9, 2) NULL ,
              pool12	 NUMERIC(9, 2) NULL ,
              prob03	 NUMERIC(9, 2) NULL ,
              pool03	 NUMERIC(9, 2) NULL ,
              prob13	 NUMERIC(9, 2) NULL ,
              pool13	 NUMERIC(9, 2) NULL ,
              prob23	 NUMERIC(9, 2) NULL ,
              pool23	 NUMERIC(9, 2) NULL ,
              probld	 NUMERIC(9, 2) NULL ,
              poolld	 NUMERIC(9, 2) NULL ,
              CONSTRAINT PK_HistoryTotalsMT_ID PRIMARY KEY CLUSTERED (id ASC ) ON [PRIMARY] ,
              CONSTRAINT UC_HistoryTotalsMT_T_M UNIQUE NONCLUSTERED  (tirag ASC, numb ASC ) ON [PRIMARY]
            )
        ON  [PRIMARY];
    END;
