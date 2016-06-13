/*
		Internal system tables with vw_Tot_UniqVariants

		Yakovlev P.V.    20.04.2016  - created this table
		Tereschenko V.A. 21.04.2016  - modified to view

*/
use TotDB

IF OBJECT_ID('dbo.vw_Tot_UniqVariants', 'V') IS NOT NULL
    EXECUTE('DROP VIEW dbo.vw_Tot_UniqVariants');
GO    

CREATE VIEW dbo.vw_Tot_UniqVariants
AS
    SELECT DISTINCT
            CASE WHEN s00 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s00 ,
            CASE WHEN s01 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s01 ,
            CASE WHEN s02 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s02 ,
            CASE WHEN s03 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s03 ,
            CASE WHEN s10 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s10 ,
            CASE WHEN s11 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s11 ,
            CASE WHEN s12 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s12 ,
            CASE WHEN s13 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s13 ,
            CASE WHEN s20 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s20 ,
            CASE WHEN s21 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s21 ,
            CASE WHEN s22 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s22 ,
            CASE WHEN s23 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s23 ,
            CASE WHEN s30 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s30 ,
            CASE WHEN s31 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s31 ,
            CASE WHEN s32 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s32 ,
            CASE WHEN s33 <> 0 THEN 'X'
                 ELSE 'o'
            END AS s33 ,
            CASE WHEN sLD <> 0 THEN 'X'
                 ELSE 'o'
            END AS sLD
    FROM    dbo.Tot_Variants;
    