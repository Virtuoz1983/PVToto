/*
        Tereshenko V.A. 08.06.2016
		Merge data from Stage

		Tereshenko V.A. 20.04.2017 - added update statemant for "sect" field
		Tereshenko V.A. 24.04.2017 - added delete statemant (as for now just for testing purpose). Will remove after.
		
 USAGE:   
    exec dbo.HistoryTotalsMT_Merge

 check
    SELECT * FROM dbo.HistoryTotalsMT
	order by tirag, numb
	--delete FROM dbo.HistoryTotalsMT
	  
*/

IF OBJECT_ID('dbo.HistoryTotalsMT_Merge', 'P') IS NULL
    EXECUTE('CREATE PROCEDURE dbo.HistoryTotalsMT_Merge AS SELECT 1')

GO

ALTER PROCEDURE dbo.HistoryTotalsMT_Merge
AS
        BEGIN 
        SET NOCOUNT ON
        
        MERGE INTO dbo.HistoryTotalsMT AS Tdest
        USING
            ( SELECT    tirag ,
                        [data] ,
                        jackPot ,
                        [pool] ,
                        complex ,
                        maxWin ,
                        quanOption ,
                        quanUniq ,
                        winJack ,
                        quan8 ,
                        sum8 ,
                        res8 ,
                        quan7 ,
                        sum7 ,
                        res7 ,
                        quan6 ,
                        sum6 ,
                        res6 ,
                        quan5 ,
                        sum5 ,
                        res5 ,
                        quan4 ,
                        sum4 ,
                        res4 ,
                        quan3 ,
                        sum3 ,
                        res3 ,
                        quan2 ,
                        sum2 ,
                        res2 ,
                        numb ,
                        sect ,                       
                        account ,
                        exodus ,
                        prob10 ,
                        pool10 ,
                        prob20 ,
                        pool20 ,
                        prob21 ,
                        pool21 ,
                        prob30 ,
                        pool30 ,
                        prob31 ,
                        pool31 ,
                        prob32 ,
                        pool32 ,
                        prob00 ,
                        pool00 ,
                        prob11 ,
                        pool11 ,
                        prob22 ,
                        pool22 ,
                        prob33 ,
                        pool33 ,
                        prob01 ,
                        pool01 ,
                        prob02 ,
                        pool02 ,
                        prob12 ,
                        pool12 ,
                        prob03 ,
                        pool03 ,
                        prob13 ,
                        pool13 ,
                        prob23 ,
                        pool23 ,
                        probld ,
                        poolld
              FROM      Stage.HistoryTotalsMT
            ) AS Tsrc
        ON Tsrc.tirag = Tdest.tirag
		AND Tsrc.numb = Tdest.numb
		-- New attributes
        WHEN NOT MATCHED BY TARGET THEN
            INSERT ( tirag ,
                     [data] ,
                     jackPot ,
                     [pool] ,
                     complex ,
                     maxWin ,
                     quanOption ,
                     quanUniq ,
                     winJack ,
                     quan8 ,
                     sum8 ,
                     res8 ,
                     quan7 ,
                     sum7 ,
                     res7 ,
                     quan6 ,
                     sum6 ,
                     res6 ,
                     quan5 ,
                     sum5 ,
                     res5 ,
                     quan4 ,
                     sum4 ,
                     res4 ,
                     quan3 ,
                     sum3 ,
                     res3 ,
                     quan2 ,
                     sum2 ,
                     res2 ,
                     numb ,
                     sect ,                     
                     account ,
                     exodus ,
                     prob10 ,
                     pool10 ,
                     prob20 ,
                     pool20 ,
                     prob21 ,
                     pool21 ,
                     prob30 ,
                     pool30 ,
                     prob31 ,
                     pool31 ,
                     prob32 ,
                     pool32 ,
                     prob00 ,
                     pool00 ,
                     prob11 ,
                     pool11 ,
                     prob22 ,
                     pool22 ,
                     prob33 ,
                     pool33 ,
                     prob01 ,
                     pool01 ,
                     prob02 ,
                     pool02 ,
                     prob12 ,
                     pool12 ,
                     prob03 ,
                     pool03 ,
                     prob13 ,
                     pool13 ,
                     prob23 ,
                     pool23 ,
                     probld ,
                     poolld
                   )
            VALUES ( Tsrc.tirag ,
                     Tsrc.[data] ,
                     Tsrc.jackPot ,
                     Tsrc.[pool] ,
                     Tsrc.complex ,
                     Tsrc.maxWin ,
                     Tsrc.quanOption ,
                     Tsrc.quanUniq ,
                     Tsrc.winJack ,
                     Tsrc.quan8 ,
                     Tsrc.sum8 ,
                     Tsrc.res8 ,
                     Tsrc.quan7 ,
                     Tsrc.sum7 ,
                     Tsrc.res7 ,
                     Tsrc.quan6 ,
                     Tsrc.sum6 ,
                     Tsrc.res6 ,
                     Tsrc.quan5 ,
                     Tsrc.sum5 ,
                     Tsrc.res5 ,
                     Tsrc.quan4 ,
                     Tsrc.sum4 ,
                     Tsrc.res4 ,
                     Tsrc.quan3 ,
                     Tsrc.sum3 ,
                     Tsrc.res3 ,
                     Tsrc.quan2 ,
                     Tsrc.sum2 ,
                     Tsrc.res2 ,
                     Tsrc.numb ,
                     Tsrc.sect ,                     
                     Tsrc.account ,
                     Tsrc.exodus ,
                     Tsrc.prob10 ,
                     Tsrc.pool10 ,
                     Tsrc.prob20 ,
                     Tsrc.pool20 ,
                     Tsrc.prob21 ,
                     Tsrc.pool21 ,
                     Tsrc.prob30 ,
                     Tsrc.pool30 ,
                     Tsrc.prob31 ,
                     Tsrc.pool31 ,
                     Tsrc.prob32 ,
                     Tsrc.pool32 ,
                     Tsrc.prob00 ,
                     Tsrc.pool00 ,
                     Tsrc.prob11 ,
                     Tsrc.pool11 ,
                     Tsrc.prob22 ,
                     Tsrc.pool22 ,
                     Tsrc.prob33 ,
                     Tsrc.pool33 ,
                     Tsrc.prob01 ,
                     Tsrc.pool01 ,
                     Tsrc.prob02 ,
                     Tsrc.pool02 ,
                     Tsrc.prob12 ,
                     Tsrc.pool12 ,
                     Tsrc.prob03 ,
                     Tsrc.pool03 ,
                     Tsrc.prob13 ,
                     Tsrc.pool13 ,
                     Tsrc.prob23 ,
                     Tsrc.pool23 ,
                     Tsrc.probld ,
                     Tsrc.poolld
                   );


update h
  set sect  = --case when 
		  case		  
			 when CHARINDEX(N'����� �������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'����� �������',sect)-2)
			 when CHARINDEX(N'����� ���',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'����� ���',sect)-2)
			 when CHARINDEX(N'2017. ���������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'2017. ���������',sect)-2)
			 when CHARINDEX(N'2016. ���������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'2016. ���������',sect)-2)
			 when CHARINDEX(N'2016. �������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'2016. �������',sect)-1)			 
			 when CHARINDEX(N'2016. �������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'2016. �������',sect)-1)			 
			 when CHARINDEX(N'��-2013.',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'��-2013.',sect)-1)			 
			 when CHARINDEX(N'��������� ����',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'��������� ����',sect)-2)
			 when CHARINDEX(N'����� �� �����',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'����� �� �����',sect)-2)			 
			 when CHARINDEX(N'1/32 ������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'1/32 ������',sect)-2)
			 when CHARINDEX(N'1/16 ������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'1/16 ������',sect)-2)
			 when CHARINDEX(N'1/8 ������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'1/8 ������',sect)-2)
			 when CHARINDEX(N'1/2 ������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'1/2 ������',sect)-2)
			 when CHARINDEX(N'1/4 ������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'1/4 ������',sect)-2)
			 when CHARINDEX(N'7-� �����',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'7-� �����',sect)-2)
			 when CHARINDEX(N'4-� �����',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'4-� �����',sect)-2)
			 when CHARINDEX(N'3-� �����',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'3-� �����',sect)-2)
			 when CHARINDEX(N'2-� �����',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'2-� �����',sect)-2)
			 when CHARINDEX(N'1-� �����',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'1-� �����',sect)-2)
			 when CHARINDEX(N'����-��� ��',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'����-��� ��',sect)-2)
			 when CHARINDEX(N'����-���',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'����-���',sect)-2)
			 when CHARINDEX(N'����� �� ������',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'����� �� ������',sect)-2)
			 when CHARINDEX(N'����������������� �����.',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'����������������� �����.',sect)-2)
			 when CHARINDEX(N'����� ����-���',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'����� ����-���',sect)-2)
			 when CHARINDEX(N'����� ����.',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'����� ����.',sect)-2)
			 when CHARINDEX(N'�����.',sect) > 0 then SUBSTRING(sect,0,CHARINDEX(N'�����.',sect)-2)
			 else sect
		  end,
		  winprob = case when [exodus] = '1:0' then [prob10] 
			 	    when [exodus] = '2:0' then [prob20] 
				    when [exodus] = '2:1' then [prob21] 
					when [exodus] = '3:0' then [prob30] 
					when [exodus] = '3:1' then [prob31] 
					when [exodus] = '3:2' then [prob32] 
					when [exodus] = '0:0' then [prob00] 
					when [exodus] = '1:1' then [prob11] 
					when [exodus] = '2:2' then [prob22] 
					when [exodus] = '3:3' then [prob33] 
					when [exodus] = '0:1' then [prob01] 
					when [exodus] = '0:2' then [prob02] 
					when [exodus] = '1:2' then [prob12] 
					when [exodus] = '0:3' then [prob03] 
					when [exodus] = '1:3' then [prob13] 
					when [exodus] = '2:3' then [prob23] 
					when [exodus] = 'LD'  then [probLD] 
					when [exodus] = '������' then 1000
						else -1.0 
			end
	from [dbo].[HistoryTotalsMT] h

	-- As for now I removed data from 2227 tirag
	-- Because we have empty values for match �����-��������� �� 17 - ���� �� 17<
	delete from [dbo].[HistoryTotalsMT] where tirag = 2227


END 