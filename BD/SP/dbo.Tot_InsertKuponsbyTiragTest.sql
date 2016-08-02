/*

	Fill pakets from car* tables

	Tereshenko V.A.  02.08.2016   - created this SP

*/



CREATE PROCEDURE [dbo].[Tot_InsertKuponsbyTiragTest](@KoefForTirag INT = 1, @NumbIter INT)
	AS 
		BEGIN
			INSERT INTO dbo.Tot_KuponsTest(tirag,[try],var1,var2,var3,var4,var5,var6,var7,var8,schema_type)
			SELECT tv1.tirag*@KoefForTirag, @NumbIter, tv1.n, tv2.n, tv3.n, tv4.n, tv5.n, tv6.n, tv7.n, tv8.n, 'test'  
			FROM [dbo].[Tot_var1] tv1
			 JOIN [dbo].[Tot_var2] tv2 ON tv1.id = tv2.id
			 JOIN [dbo].[Tot_var3] tv3 ON tv1.id = tv3.id
			 JOIN [dbo].[Tot_var4] tv4 ON tv1.id = tv4.id
			 JOIN [dbo].[Tot_var5] tv5 ON tv1.id = tv5.id
			 JOIN [dbo].[Tot_var6] tv6 ON tv1.id = tv6.id
			 JOIN [dbo].[Tot_var7] tv7 ON tv1.id = tv7.id
			 JOIN [dbo].[Tot_var8] tv8 ON tv1.id = tv8.id
		END

GO


