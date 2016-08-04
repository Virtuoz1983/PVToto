/*

	Generate test result wich we can use for analyze or in visualisations 

	Tereshenko V.A.  02.08.2016   - created this SP
	Tereshenko V.A.  03.08.2016   - changed type for @BetSuma input parameter
	Tereshenko V.A.  04.08.2016   - added truncate for Tot_KuponsTest table

*/

CREATE PROCEDURE [dbo].[GenerateFullTestResults] @tirag INT, @CountRepeats INT, @BetSuma NUMERIC(9,2)
AS 
BEGIN
-- generate pakets per percentage


EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 50, @CountOfRepeats = @CountRepeats
EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 100, @CountOfRepeats = @CountRepeats
EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 200, @CountOfRepeats = @CountRepeats
EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 300, @CountOfRepeats = @CountRepeats
EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 400, @CountOfRepeats = @CountRepeats
EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 500, @CountOfRepeats = @CountRepeats
EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 1000, @CountOfRepeats = @CountRepeats
EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 2000, @CountOfRepeats = @CountRepeats
EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 4000, @CountOfRepeats = @CountRepeats
EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 7000, @CountOfRepeats = @CountRepeats
EXEC [dbo].[GeneratePaketsForTest] @tirag = @tirag, @KolPerPaket = 10000, @CountOfRepeats = @CountRepeats

-- store test results into table
EXEC dbo.GenerateResultsTest @TiragNum = @tirag, @BetAmount = @BetSuma 

TRUNCATE TABLE [dbo].[Tot_KuponsTest] 

END 

GO


