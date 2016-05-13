/*
		Internal system procedure with Tot_InsertKuponsbyTirag

		Yakovlev P.V.     21.04.2016  - created this procedure
		Tereschenko V.A.  13.05.2016  - added new field, changed to use global temporary table
*/

USE [TotDB]
GO
IF OBJECT_ID('dbo.Tot_InsertKuponsbyTirag', 'P') IS NOT NULL
	DROP PROCEDURE dbo.Tot_InsertKuponsbyTirag
GO 
CREATE PROCEDURE dbo.Tot_InsertKuponsbyTirag(@KoefForTirag INT = 1, @schema_type NVARCHAR(50))
	AS 
		BEGIN
			INSERT INTO dbo.Tot_Kupons(tirag,var1,var2,var3,var4,var5,var6,var7,var8,schema_type)
			SELECT tv1.tirag*@KoefForTirag, tv1.n, tv2.n, tv3.n, tv4.n, tv5.n, tv6.n, tv7.n, tv8.n, @schema_type
			FROM ##Tot_var1 tv1
			 JOIN ##Tot_var2 tv2 ON tv1.id = tv2.id
			 JOIN ##Tot_var3 tv3 ON tv1.id = tv3.id
			 JOIN ##Tot_var4 tv4 ON tv1.id = tv4.id
			 JOIN ##Tot_var5 tv5 ON tv1.id = tv5.id
			 JOIN ##Tot_var6 tv6 ON tv1.id = tv6.id
			 JOIN ##Tot_var7 tv7 ON tv1.id = tv7.id
			 JOIN ##Tot_var8 tv8 ON tv1.id = tv8.id
		END
GO
