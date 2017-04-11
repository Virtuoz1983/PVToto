/*
		Internal system procedure with Tot_SelectPaketByTiragForBetting

		Yakovlev P.V.    21.04.2016  - created this procedure
		Tereschenko V.A. 23.01.2017  - added new input parameter @Type 
										- 1 - Marathonbet (by default)
										- 2 - 1xBet

*/

USE [TotDB]
GO
IF OBJECT_ID('dbo.Tot_SelectPaketByTiragForBetting', 'P') IS NOT NULL
	DROP PROCEDURE [dbo].[Tot_SelectPaketByTiragForBetting]
GO 
CREATE PROCEDURE [dbo].[Tot_SelectPaketByTiragForBetting](@Tirag INT = 0, @AmountPerKupon VARCHAR(10) = '0.23')
AS
	BEGIN
		SELECT @AmountPerKupon + '|1-('+var1+');2-('+var2+');3-('+var3+');4-('+var4+');5-('+var5+');6-('+var6+');7-('+var7+');8-('+var8+')#'
		FROM
		(
		SELECT  CASE WHEN var1 = 'LD' THEN N'四' ELSE var1 END AS var1,
		  CASE WHEN var2 = 'LD' THEN N'四' ELSE var2 END AS var2,
		  CASE WHEN var3 = 'LD' THEN N'四' ELSE var3 END AS var3,
		  CASE WHEN var4 = 'LD' THEN N'四' ELSE var4 END AS var4,
		  CASE WHEN var5 = 'LD' THEN N'四' ELSE var5 END AS var5,
		  CASE WHEN var6 = 'LD' THEN N'四' ELSE var6 END AS var6,
		  CASE WHEN var7 = 'LD' THEN N'四' ELSE var7 END AS var7,
		  CASE WHEN var8 = 'LD' THEN N'四' ELSE var8 END AS var8
		 FROM [dbo].[Tot_Kupons]
		 WHERE tirag = @Tirag
		 ) A
	END
GO
