/*

	Generate pakets for testing purpose, based on provided percentages 

	Tereshenko V.A.  02.08.2016   - created this SP

*/
CREATE PROCEDURE [dbo].[GeneratePaketsForTest] @Tirag INT, @KolPerPaket INT, @CountOfRepeats INT
AS 
BEGIN

DECLARE @j INT = 0, @DopIterator INT = 0;

SELECT @j = ISNULL(MAX(try),0)
 FROM dbo.Tot_KuponsTest
WHERE tirag = @Tirag

DECLARE @i INT;
SET @i = @CountOfRepeats;

WHILE (@i > 0) 
BEGIN 
EXEC Tot_RecreateAllVarTables;

EXEC [dbo].[GenerateVarsDataForTest] @Tirag, @KolPerPaket

SET @DopIterator = @i + @j
EXEC [dbo].[Tot_InsertKuponsbyTiragTest] 1, @DopIterator

SET @i = @i - 1;
END 

END 

GO


