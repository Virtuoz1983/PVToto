/*

	Main proceudre for handling logic for percentage generation

	Tereshenko V.A.  02.08.2016   - created this SP
	Tereshenko V.A.  13.01.2017   - Added new parameter @testNum

*/


CREATE PROCEDURE [dbo].[Tot_CreatePaketsByPerc] @tirag int, @testNum int
AS
BEGIN

if OBJECT_ID('tempdb..#temp_Perc') IS NOT NULL DROP TABLE #temp_Perc

SELECT m.tirag
	   ,m.NumMatch
	   ,r11.PercValue AS Perc_11, v11 
	   ,r00.PercValue AS Perc_00, v00 
	   ,r10.PercValue AS Perc_10, v10 
	   ,r01.PercValue AS Perc_01, v01 
	   ,r21.PercValue AS Perc_21, v21 
	   ,r12.PercValue AS Perc_12, v12 
	   ,r20.PercValue AS Perc_20, v20 
	   ,r02.PercValue AS Perc_02, v02 
	   ,r22.PercValue AS Perc_22, v22 
	   ,rLD.PercValue AS Perc_LD, vld 
	   ,r31.PercValue AS Perc_31, v31 
	   ,r30.PercValue AS Perc_30, v30 
	   ,r13.PercValue AS Perc_13, v13 
	   ,r03.PercValue AS Perc_03, v03 
	   ,r23.PercValue AS Perc_23, v23 
	   ,r32.PercValue AS Perc_32, v32 
	   ,r33.PercValue AS Perc_33, v33 
	   ,r11.PercValue + r00.PercValue + r10.PercValue + r01.PercValue + r21.PercValue + r12.PercValue + r22.PercValue + rLD.PercValue + r20.PercValue + r02.PercValue +
	    r31.PercValue + r30.PercValue + r13.PercValue + r03.PercValue + r23.PercValue + r32.PercValue + r33.PercValue AS AllPerc
		INTO #temp_Perc
FROM [dbo].[Tot_Matches] m 
 JOIN [dbo].[Tot_RangesForPerc] r11 ON (m.v11 > r11.RangeFrom AND m.v11 <= r11.RangeTo) AND r11.testNum = @testNum AND r11.UseForResult = '1:1'
 JOIN [dbo].[Tot_RangesForPerc] r00 ON (m.v00 > r00.RangeFrom AND m.v00 <= r00.RangeTo) AND r00.testNum = @testNum AND r00.UseForResult = '0:0' 
 JOIN [dbo].[Tot_RangesForPerc] r10 ON (m.v10 > r10.RangeFrom AND m.v10 <= r10.RangeTo) AND r10.testNum = @testNum AND r10.UseForResult = '1:0'
 JOIN [dbo].[Tot_RangesForPerc] r01 ON (m.v01 > r01.RangeFrom AND m.v01 <= r01.RangeTo) AND r01.testNum = @testNum AND r01.UseForResult = '0:1'
 JOIN [dbo].[Tot_RangesForPerc] r21 ON (m.v21 > r21.RangeFrom AND m.v21 <= r21.RangeTo) AND r21.testNum = @testNum AND r21.UseForResult = '2:1'
 JOIN [dbo].[Tot_RangesForPerc] r12 ON (m.v12 > r12.RangeFrom AND m.v12 <= r12.RangeTo) AND r12.testNum = @testNum AND r12.UseForResult = '1:2'
 JOIN [dbo].[Tot_RangesForPerc] r20 ON (m.v20 > r20.RangeFrom AND m.v20 <= r20.RangeTo) AND r20.testNum = @testNum AND r20.UseForResult = '2:0'
 JOIN [dbo].[Tot_RangesForPerc] r02 ON (m.v02 > r02.RangeFrom AND m.v02 <= r02.RangeTo) AND r02.testNum = @testNum AND r02.UseForResult = '0:2'
 JOIN [dbo].[Tot_RangesForPerc] r22 ON (m.v22 > r22.RangeFrom AND m.v22 <= r22.RangeTo) AND r22.testNum = @testNum AND r22.UseForResult = '2:2'
 JOIN [dbo].[Tot_RangesForPerc] r31 ON (m.v31 > r31.RangeFrom AND m.v31 <= r31.RangeTo) AND r31.testNum = @testNum AND r31.UseForResult = '3:1'
 JOIN [dbo].[Tot_RangesForPerc] r30 ON (m.v30 > r30.RangeFrom AND m.v30 <= r30.RangeTo) AND r30.testNum = @testNum AND r30.UseForResult = '3:0'
 JOIN [dbo].[Tot_RangesForPerc] r13 ON (m.v13 > r13.RangeFrom AND m.v13 <= r13.RangeTo) AND r13.testNum = @testNum AND r13.UseForResult = '1:3'
 JOIN [dbo].[Tot_RangesForPerc] r03 ON (m.v03 > r03.RangeFrom AND m.v03 <= r03.RangeTo) AND r03.testNum = @testNum AND r03.UseForResult = '0:3'
 JOIN [dbo].[Tot_RangesForPerc] r23 ON (m.v23 > r23.RangeFrom AND m.v23 <= r23.RangeTo) AND r23.testNum = @testNum AND r23.UseForResult = '2:3'
 JOIN [dbo].[Tot_RangesForPerc] r32 ON (m.v32 > r32.RangeFrom AND m.v32 <= r32.RangeTo) AND r32.testNum = @testNum AND r32.UseForResult = '3:2'
 JOIN [dbo].[Tot_RangesForPerc] r33 ON (m.v33 > r33.RangeFrom AND m.v33 <= r33.RangeTo) AND r33.testNum = @testNum AND r33.UseForResult = '3:3'
 JOIN [dbo].[Tot_RangesForPerc] rLD ON (m.vLD > rld.RangeFrom AND m.vLD <= rld.RangeTo) AND rld.testNum = @testNum AND rld.UseForResult = 'LD' 
WHERE tirag = @tirag

--SELECT * FROM #temp_Perc
--ORDER BY 1,2
-- if AllPerc > 100 

DECLARE @tempAllPerc int

declare @var_AllP int;

declare CursorUpdPerc cursor for 
select AllPerc
 FROM #temp_Perc
WHERE AllPerc > 100 FOR update 

open CursorUpdPerc 

fetch next from CursorUpdPerc into @var_AllP

WHILE @@FETCH_STATUS = 0 
begin 

SET @tempAllPerc = @var_AllP

-- ////////////////
UPDATE #temp_Perc 
set Perc_12 = Perc_12 - 1,
	AllPerc = AllPerc - 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc -1  

-- ////////////////
IF @tempAllPerc > 100 
UPDATE #temp_Perc 
set Perc_21 = Perc_21 - 1,
	AllPerc = AllPerc - 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc -1  


-- ////////////////
IF @tempAllPerc > 100 
UPDATE #temp_Perc 
set Perc_02 = Perc_02 - 1,
	AllPerc = AllPerc - 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc -1  

-- ////////////////
IF @tempAllPerc > 100 
UPDATE #temp_Perc 
set Perc_20 = Perc_20 - 1,
	AllPerc = AllPerc - 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc -1  

-- ////////////////
IF @tempAllPerc > 100 
UPDATE #temp_Perc 
set Perc_11 = Perc_11 - 1,
	AllPerc = AllPerc - 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc -1  

-- ////////////////
IF @tempAllPerc > 100 
UPDATE #temp_Perc 
set Perc_22 = Perc_22 - 1,
	AllPerc = AllPerc - 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc -1  

-- ////////////////
IF @tempAllPerc > 100 
UPDATE #temp_Perc 
set Perc_00 = Perc_00 - 1,
	AllPerc = AllPerc - 1
where current of CursorUpdPerc 

fetch next from CursorUpdPerc into @var_AllP
end 

close CursorUpdPerc 
deallocate CursorUpdPerc 


--SELECT * 
--from #temp_Perc 
--ORDER BY 1,2

-- if AllPerc < 100 >= 95

declare CursorUpdPerc cursor for 
select AllPerc
 FROM #temp_Perc
WHERE AllPerc < 100 AND AllPerc >=95 FOR update 

open CursorUpdPerc 

fetch next from CursorUpdPerc into @var_AllP

WHILE @@FETCH_STATUS = 0 
begin 

SET @tempAllPerc = @var_AllP

-- ////////////////
UPDATE #temp_Perc 
set Perc_21 = Perc_21 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_12 = Perc_12 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  


-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_20 = Perc_20 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_02 = Perc_02 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_22 = Perc_22 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 


fetch next from CursorUpdPerc into @var_AllP
end 

close CursorUpdPerc 
deallocate CursorUpdPerc 


--SELECT * 
--from #temp_Perc 
--ORDER BY 1,2


-- if AllPerc < 95 >= 90

declare CursorUpdPerc cursor for 
select AllPerc
 FROM #temp_Perc
WHERE AllPerc < 95 AND AllPerc >= 90 FOR update 

open CursorUpdPerc 

fetch next from CursorUpdPerc into @var_AllP

WHILE @@FETCH_STATUS = 0 
begin 

SET @tempAllPerc = @var_AllP

-- ////////////////
UPDATE #temp_Perc 
set Perc_11 = Perc_11 + 2,
	AllPerc = AllPerc + 2
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 2 

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_10 = Perc_10 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  


-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_01 = Perc_01 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_21 = Perc_21 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_12 = Perc_12 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_20 = Perc_20 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_02 = Perc_02 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_22 = Perc_22 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_00 = Perc_00 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

fetch next from CursorUpdPerc into @var_AllP
end 

close CursorUpdPerc 
deallocate CursorUpdPerc 


--SELECT * 
--from #temp_Perc 
--ORDER BY 1,2

-- if AllPerc < 80 >= 70

declare CursorUpdPerc cursor for 
select AllPerc
 FROM #temp_Perc
WHERE AllPerc < 80 AND AllPerc >= 70 FOR update 

open CursorUpdPerc 

fetch next from CursorUpdPerc into @var_AllP

WHILE @@FETCH_STATUS = 0 
begin 

SET @tempAllPerc = @var_AllP

-- ////////////////
UPDATE #temp_Perc 
set Perc_11 = Perc_11 + 2,
	AllPerc = AllPerc + 2
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 2 

-- ////////////////

IF @tempAllPerc < 100 - 1 
begin
UPDATE #temp_Perc 
set Perc_20 = Perc_20 + 2,
	AllPerc = AllPerc + 2
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 2
end
-- ////////////////
IF @tempAllPerc < 100 - 1
begin
UPDATE #temp_Perc 
set Perc_02 = Perc_02 + 2,
	AllPerc = AllPerc + 2
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 2
end
-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_31 = Perc_31 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_13 = Perc_13 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 - 1
begin
UPDATE #temp_Perc 
set Perc_22 = Perc_22 + 2,
	AllPerc = AllPerc + 2
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 2
end

fetch next from CursorUpdPerc into @var_AllP
end 

close CursorUpdPerc 
deallocate CursorUpdPerc 

-- if AllPerc < 90 >= 80

declare CursorUpdPerc cursor for 
select AllPerc
 FROM #temp_Perc
WHERE AllPerc < 90 AND AllPerc >= 80 FOR update 

open CursorUpdPerc 

fetch next from CursorUpdPerc into @var_AllP

WHILE @@FETCH_STATUS = 0 
begin 

SET @tempAllPerc = @var_AllP

-- ////////////////
UPDATE #temp_Perc 
set Perc_11 = Perc_11 + 2,
	AllPerc = AllPerc + 2
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 2 

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_10 = Perc_10 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  


-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_01 = Perc_01 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1

-- ////////////////
IF @tempAllPerc < 100 - 1 
begin
UPDATE #temp_Perc 
set Perc_21 = Perc_21 + 2,
	AllPerc = AllPerc + 2
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 2
end
-- ////////////////
IF @tempAllPerc < 100 - 1
begin
UPDATE #temp_Perc 
set Perc_12 = Perc_12 + 2,
	AllPerc = AllPerc + 2
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 2
end
-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_31 = Perc_31 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_13 = Perc_13 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 - 1
begin
UPDATE #temp_Perc 
set Perc_22 = Perc_22 + 2,
	AllPerc = AllPerc + 2
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 2
end

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_00 = Perc_00 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  

-- ////////////////
IF @tempAllPerc < 100 
begin
UPDATE #temp_Perc 
set Perc_20 = Perc_20 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  
end

-- ////////////////
IF @tempAllPerc < 100 
begin
UPDATE #temp_Perc 
set Perc_02 = Perc_02 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  
end

-- ////////////////
IF @tempAllPerc < 100 
begin
UPDATE #temp_Perc 
set Perc_30 = Perc_30 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  
END

-- ////////////////
IF @tempAllPerc < 100 
begin
UPDATE #temp_Perc 
set Perc_03 = Perc_03 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  
END

-- ////////////////
IF @tempAllPerc < 100 
begin
UPDATE #temp_Perc 
set Perc_32 = Perc_32 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  
END

-- ////////////////
IF @tempAllPerc < 100 
begin
UPDATE #temp_Perc 
set Perc_23 = Perc_23 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 

SET @tempAllPerc = @tempAllPerc + 1  
END

-- ////////////////
IF @tempAllPerc < 100 
UPDATE #temp_Perc 
set Perc_33 = Perc_33 + 1,
	AllPerc = AllPerc + 1
where current of CursorUpdPerc 



fetch next from CursorUpdPerc into @var_AllP
end 

close CursorUpdPerc 
deallocate CursorUpdPerc 

INSERT INTO [dbo].[Tot_GeneratedPercForTest]
           ([TestNum],[Tirag],[NumMatch],[p01],[p02],[p12],[p03],[p13],[p23],[p00],[p11],[p22],[p33],[p10],[p20],[p21],[p30],[p31],[p32],[pLD])
select @testNum, tirag, NumMatch
           ,Perc_01,Perc_02,Perc_12,Perc_03,Perc_13,Perc_23,Perc_00,Perc_11,Perc_22,Perc_33,Perc_10,Perc_20,Perc_21,Perc_30,Perc_31,Perc_32,Perc_LD
from #temp_Perc 
ORDER BY 1,2

end