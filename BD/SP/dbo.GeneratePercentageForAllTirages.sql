/*

	Use generation procedure for all neccasary tirages. 

	Tereshenko V.A.  02.08.2016   - created this SP
	Tereshenko V.A.  13.01.2017   - added new parameter @NumTest

*/


CREATE PROCEDURE [dbo].[GeneratePercentageForAllTirages] (@TiragFrom INT = 1405, @TiragTo INT = 2062, @NumTest INT)
AS 
BEGIN 

DECLARE @NTirag int

declare CursorSelPerc cursor for 
select n.number
 FROM dbo.Numbers n
WHERE n.number >= @TiragFrom AND n.number <= @TiragTo

open CursorSelPerc 

fetch next from CursorSelPerc into @NTirag

WHILE @@FETCH_STATUS = 0 
begin 

-- generate percentage for test 
EXEC dbo.Tot_CreatePaketsByPerc @NTirag, @NumTest

fetch next from CursorSelPerc into @NTirag
end 

close CursorSelPerc 
deallocate CursorSelPerc 

END 
GO


