/*

	Generate pakets for testing purpose, based on provided percentages 

	Tereshenko V.A.  02.08.2016   - created this SP
	Tereshenko V.A.  11.01.2017   - Added new parameter @TestDescription 
	Tereshenko V.A.  13.01.2017   - Added new parameter @@TestNum 

*/
CREATE PROCEDURE [dbo].[GeneratePaketsForTest] @Tirag INT, @KolPerPaket INT, @CountOfRepeats INT, @TestDescription NVARCHAR(50), @TestNum INT
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

EXEC [dbo].[GenerateVarsDataForTest] @Tirag, @KolPerPaket, @TestNum

SET @DopIterator = @i + @j
EXEC [dbo].[Tot_InsertKuponsbyTiragTest] 1, @DopIterator, @TestDescription

SET @i = @i - 1;
END 

END 

GO


