/*

	Use generation procedure for all neccasary tirages. 

	Tereshenko V.A.  02.08.2016   - created this SP

*/


CREATE PROCEDURE [dbo].[GeneratePercentageForAllTirages] (@TiragFrom INT = 1405, @TiragTo INT = 2062, @NumberOfTest INT = 0)
AS 
BEGIN 

DECLARE @NTirag INT

DECLARE CursorSelPerc CURSOR FOR 
SELECT n.number
 FROM dbo.Numbers n
WHERE n.number >= @TiragFrom AND n.number <= @TiragTo

OPEN CursorSelPerc 

FETCH NEXT FROM CursorSelPerc INTO @NTirag

WHILE @@FETCH_STATUS = 0 
BEGIN 

-- generate percentage for test 
EXEC dbo.Tot_CreatePaketsByPerc @NTirag, @NumberOfTest

FETCH NEXT FROM CursorSelPerc INTO @NTirag
END 

CLOSE CursorSelPerc 
DEALLOCATE CursorSelPerc 

END 
GO


