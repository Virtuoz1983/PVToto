/*

	Generate data for var* tables, will be used randomizing for paket genearation 

	Tereshenko V.A.  02.08.2016   - created this SP

*/

CREATE PROCEDURE [dbo].[GenerateVarsDataForTest] @tir INT, @Kol INT
AS
BEGIN

INSERT  INTO Tot_var1
        ( n ,
          tirag
        )
        SELECT  A.v1 ,
                @tir
        FROM    ( SELECT    '0:1' AS v1
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p01*@Kol/100
                  UNION ALL
                  SELECT    '0:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p02*@Kol/100
                  UNION ALL
                  SELECT    '1:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p12*@Kol/100
                  UNION ALL
                  SELECT    '0:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p03*@Kol/100
                  UNION ALL
                  SELECT    '1:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p13*@Kol/100
                  UNION ALL
                  SELECT    '2:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p23*@Kol/100
                  UNION ALL
                  SELECT    '0:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p00*@Kol/100
                  UNION ALL
                  SELECT    '1:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p11*@Kol/100
                  UNION ALL
                  SELECT    '2:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p22*@Kol/100
                  UNION ALL
                  SELECT    '3:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p33*@Kol/100
                  UNION ALL
                  SELECT    '1:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p10*@Kol/100
                  UNION ALL
                  SELECT    '2:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p20*@Kol/100
                  UNION ALL
                  SELECT    '2:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p21*@Kol/100
                  UNION ALL
                  SELECT    '3:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p30*@Kol/100
                  UNION ALL
                  SELECT    '3:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p31*@Kol/100
                  UNION ALL
                  SELECT    '3:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= p32*@Kol/100
                  UNION ALL
                  SELECT    'LD'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 1 AND number <= pLD*@Kol/100
                ) A
        ORDER BY NEWID();
INSERT  INTO Tot_var2
        ( n ,
          tirag
        )
        SELECT  A.v1 ,
                @tir
        FROM    ( SELECT    '0:1' AS v1
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p01*@Kol/100
                  UNION ALL
                  SELECT    '0:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p02*@Kol/100
                  UNION ALL
                  SELECT    '1:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p12*@Kol/100
                  UNION ALL
                  SELECT    '0:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p03*@Kol/100
                  UNION ALL
                  SELECT    '1:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p13*@Kol/100
                  UNION ALL
                  SELECT    '2:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p23*@Kol/100
                  UNION ALL
                  SELECT    '0:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p00*@Kol/100
                  UNION ALL
                  SELECT    '1:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p11*@Kol/100
                  UNION ALL
                  SELECT    '2:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p22*@Kol/100
                  UNION ALL
                  SELECT    '3:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p33*@Kol/100
                  UNION ALL
                  SELECT    '1:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p10*@Kol/100
                  UNION ALL
                  SELECT    '2:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p20*@Kol/100
                  UNION ALL
                  SELECT    '2:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p21*@Kol/100
                  UNION ALL
                  SELECT    '3:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p30*@Kol/100
                  UNION ALL
                  SELECT    '3:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p31*@Kol/100
                  UNION ALL
                  SELECT    '3:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= p32*@Kol/100
                  UNION ALL
                  SELECT    'LD'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 2 AND number <= pLD*@Kol/100
                ) A
        ORDER BY NEWID();
INSERT  INTO Tot_var3
        ( n ,
          tirag
        )
        SELECT  A.v1 ,
                @tir
        FROM    ( SELECT    '0:1' AS v1
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p01*@Kol/100
                  UNION ALL
                  SELECT    '0:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p02*@Kol/100
                  UNION ALL
                  SELECT    '1:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p12*@Kol/100
                  UNION ALL
                  SELECT    '0:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p03*@Kol/100
                  UNION ALL
                  SELECT    '1:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p13*@Kol/100
                  UNION ALL
                  SELECT    '2:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p23*@Kol/100
                  UNION ALL
                  SELECT    '0:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p00*@Kol/100
                  UNION ALL
                  SELECT    '1:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p11*@Kol/100
                  UNION ALL
                  SELECT    '2:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p22*@Kol/100
                  UNION ALL
                  SELECT    '3:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p33*@Kol/100
                  UNION ALL
                  SELECT    '1:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p10*@Kol/100
                  UNION ALL
                  SELECT    '2:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p20*@Kol/100
                  UNION ALL
                  SELECT    '2:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p21*@Kol/100
                  UNION ALL
                  SELECT    '3:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p30*@Kol/100
                  UNION ALL
                  SELECT    '3:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p31*@Kol/100
                  UNION ALL
                  SELECT    '3:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= p32*@Kol/100
                  UNION ALL
                  SELECT    'LD'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 3 AND number <= pLD*@Kol/100
                ) A
        ORDER BY NEWID();
INSERT  INTO Tot_var4
        ( n ,
          tirag
        )
        SELECT  A.v1 ,
                @tir
        FROM    ( SELECT    '0:1' AS v1
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p01*@Kol/100
                  UNION ALL
                  SELECT    '0:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p02*@Kol/100
                  UNION ALL
                  SELECT    '1:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p12*@Kol/100
                  UNION ALL
                  SELECT    '0:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p03*@Kol/100
                  UNION ALL
                  SELECT    '1:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p13*@Kol/100
                  UNION ALL
                  SELECT    '2:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p23*@Kol/100
                  UNION ALL
                  SELECT    '0:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p00*@Kol/100
                  UNION ALL
                  SELECT    '1:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p11*@Kol/100
                  UNION ALL
                  SELECT    '2:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p22*@Kol/100
                  UNION ALL
                  SELECT    '3:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p33*@Kol/100
                  UNION ALL
                  SELECT    '1:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p10*@Kol/100
                  UNION ALL
                  SELECT    '2:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p20*@Kol/100
                  UNION ALL
                  SELECT    '2:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p21*@Kol/100
                  UNION ALL
                  SELECT    '3:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p30*@Kol/100
                  UNION ALL
                  SELECT    '3:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p31*@Kol/100
                  UNION ALL
                  SELECT    '3:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= p32*@Kol/100
                  UNION ALL
                  SELECT    'LD'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 4 AND number <= pLD*@Kol/100
                ) A
        ORDER BY NEWID();
INSERT  INTO Tot_var5
        ( n ,
          tirag
        )
        SELECT  A.v1 ,
                @tir
        FROM    ( SELECT    '0:1' AS v1
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p01*@Kol/100
                  UNION ALL
                  SELECT    '0:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p02*@Kol/100
                  UNION ALL
                  SELECT    '1:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p12*@Kol/100
                  UNION ALL
                  SELECT    '0:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p03*@Kol/100
                  UNION ALL
                  SELECT    '1:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p13*@Kol/100
                  UNION ALL
                  SELECT    '2:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p23*@Kol/100
                  UNION ALL
                  SELECT    '0:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p00*@Kol/100
                  UNION ALL
                  SELECT    '1:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p11*@Kol/100
                  UNION ALL
                  SELECT    '2:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p22*@Kol/100
                  UNION ALL
                  SELECT    '3:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p33*@Kol/100
                  UNION ALL
                  SELECT    '1:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p10*@Kol/100
                  UNION ALL
                  SELECT    '2:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p20*@Kol/100
                  UNION ALL
                  SELECT    '2:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p21*@Kol/100
                  UNION ALL
                  SELECT    '3:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p30*@Kol/100
                  UNION ALL
                  SELECT    '3:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p31*@Kol/100
                  UNION ALL
                  SELECT    '3:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= p32*@Kol/100
                  UNION ALL
                  SELECT    'LD'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 5 AND number <= pLD*@Kol/100
                ) A
        ORDER BY NEWID();
INSERT  INTO Tot_var6
        ( n ,
          tirag
        )
        SELECT  A.v1 ,
                @tir
        FROM    ( SELECT    '0:1' AS v1
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p01*@Kol/100
                  UNION ALL
                  SELECT    '0:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p02*@Kol/100
                  UNION ALL
                  SELECT    '1:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p12*@Kol/100
                  UNION ALL
                  SELECT    '0:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p03*@Kol/100
                  UNION ALL
                  SELECT    '1:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p13*@Kol/100
                  UNION ALL
                  SELECT    '2:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p23*@Kol/100
                  UNION ALL
                  SELECT    '0:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p00*@Kol/100
                  UNION ALL
                  SELECT    '1:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p11*@Kol/100
                  UNION ALL
                  SELECT    '2:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p22*@Kol/100
                  UNION ALL
                  SELECT    '3:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p33*@Kol/100
                  UNION ALL
                  SELECT    '1:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p10*@Kol/100
                  UNION ALL
                  SELECT    '2:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p20*@Kol/100
                  UNION ALL
                  SELECT    '2:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p21*@Kol/100
                  UNION ALL
                  SELECT    '3:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p30*@Kol/100
                  UNION ALL
                  SELECT    '3:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p31*@Kol/100
                  UNION ALL
                  SELECT    '3:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= p32*@Kol/100
                  UNION ALL
                  SELECT    'LD'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 6 AND number <= pLD*@Kol/100
                ) A
        ORDER BY NEWID();
INSERT  INTO Tot_var7
        ( n ,
          tirag
        )
        SELECT  A.v1 ,
                @tir
        FROM    ( SELECT    '0:1' AS v1
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p01*@Kol/100
                  UNION ALL
                  SELECT    '0:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p02*@Kol/100
                  UNION ALL
                  SELECT    '1:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p12*@Kol/100
                  UNION ALL
                  SELECT    '0:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p03*@Kol/100
                  UNION ALL
                  SELECT    '1:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p13*@Kol/100
                  UNION ALL
                  SELECT    '2:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p23*@Kol/100
                  UNION ALL
                  SELECT    '0:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p00*@Kol/100
                  UNION ALL
                  SELECT    '1:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p11*@Kol/100
                  UNION ALL
                  SELECT    '2:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p22*@Kol/100
                  UNION ALL
                  SELECT    '3:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p33*@Kol/100
                  UNION ALL
                  SELECT    '1:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p10*@Kol/100
                  UNION ALL
                  SELECT    '2:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p20*@Kol/100
                  UNION ALL
                  SELECT    '2:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p21*@Kol/100
                  UNION ALL
                  SELECT    '3:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p30*@Kol/100
                  UNION ALL
                  SELECT    '3:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p31*@Kol/100
                  UNION ALL
                  SELECT    '3:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= p32*@Kol/100
                  UNION ALL
                  SELECT    'LD'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 7 AND number <= pLD*@Kol/100
                ) A
        ORDER BY NEWID();
INSERT  INTO Tot_var8
        ( n ,
          tirag
        )
        SELECT  A.v1 ,
                @tir
        FROM    ( SELECT    '0:1' AS v1
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p01*@Kol/100
                  UNION ALL
                  SELECT    '0:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p02*@Kol/100
                  UNION ALL
                  SELECT    '1:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p12*@Kol/100
                  UNION ALL
                  SELECT    '0:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p03*@Kol/100
                  UNION ALL
                  SELECT    '1:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p13*@Kol/100
                  UNION ALL
                  SELECT    '2:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p23*@Kol/100
                  UNION ALL
                  SELECT    '0:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p00*@Kol/100
                  UNION ALL
                  SELECT    '1:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p11*@Kol/100
                  UNION ALL
                  SELECT    '2:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p22*@Kol/100
                  UNION ALL
                  SELECT    '3:3'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p33*@Kol/100
                  UNION ALL
                  SELECT    '1:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p10*@Kol/100
                  UNION ALL
                  SELECT    '2:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p20*@Kol/100
                  UNION ALL
                  SELECT    '2:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p21*@Kol/100
                  UNION ALL
                  SELECT    '3:0'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p30*@Kol/100
                  UNION ALL
                  SELECT    '3:1'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p31*@Kol/100
                  UNION ALL
                  SELECT    '3:2'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= p32*@Kol/100
                  UNION ALL
                  SELECT    'LD'
                  FROM      dbo.Numbers, [dbo].[Tot_GeneratedPercForTest]
                  WHERE     tirag = @tir AND NumMatch = 8 AND number <= pLD*@Kol/100
                ) A
        ORDER BY NEWID();
END

