/*

	Generate test result wich we can use for analyze or in visualisations 

	Tereshenko V.A.  02.08.2016   - created this SP

*/


CREATE PROCEDURE [dbo].[GenerateFullTestResults] @tirag INT, @CountRepeats INT, @BetSuma INT 
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

END 

GO


