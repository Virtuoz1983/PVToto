/*
		Stored procedure for data preparation.

		08.06.2016  Tereschenko V.A. - created
		01.08.2016  Tereschenko V.A. - added update for exodus field 

SELECT * FROM Stage.HistoryTotalsMT
*/


CREATE PROCEDURE dbo.Stage_HistoryTotalsMT_Prepare AS 
BEGIN 
-- remove first 2 rows
DELETE FROM Stage.HistoryTotalsMT
WHERE prob10 IS NULL;


-- update our empty values 
WITH cte 
     AS (SELECT T1.id,                 
                tirag = COALESCE(T1.tirag, (SELECT TOP 1 REPLACE(SUBSTRING(tirag,11,4),',','')
                                      FROM   Stage.HistoryTotalsMT T2 
                                      WHERE  T2.id < T1.id  
                                             AND tirag IS NOT NULL 
                                      ORDER  BY id DESC)), 
                [data] = COALESCE(T1.[data], (SELECT TOP 1 [data] 
                                      FROM   Stage.HistoryTotalsMT T2 
                                      WHERE  T2.id < T1.id 
                                             AND [data] IS NOT NULL 
                                      ORDER  BY id DESC)) 
         FROM   Stage.HistoryTotalsMT T1) 
UPDATE T 
SET    T.tirag = C.tirag, 
       T.[data] = C.[data]        
FROM   Stage.HistoryTotalsMT T 
       INNER JOIN cte C ON T.id = C.id 
WHERE  T.tirag  IS NULL 
    OR T.[data] IS NULL 

-- and finally update not empty tirag rows        
UPDATE h
	SET tirag = CASE WHEN  TRY_PARSE(tirag AS INT) IS NULL THEN REPLACE(SUBSTRING(tirag,11,4),',','') ELSE tirag END
	   ,h.exodus = CASE WHEN h.exodus = N'ËÄ' THEN 'LD' ELSE h.exodus end 
FROM Stage.HistoryTotalsMT h

END 

