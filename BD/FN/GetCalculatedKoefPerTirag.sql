/*

This function allow to calculate coef per tirag according to provided countes per kategory

	Tereshenko V.A.  02.08.2016   - created this function

EXAMPLE: 
select [dbo].[GetCalculatedKoefPerTirag] (2060 , 1000 , 0, 0, 0, 1, 10, 50, 200)

*/


CREATE FUNCTION [dbo].[GetCalculatedKoefPerTirag] (@Tirag INT , @KuponsCount INT , @CountBet8 INT, @CountBet7 INT, @CountBet6 INT, @CountBet5 INT, @CountBet4 INT, @CountBet3 INT, @CountBet2 INT)
RETURNS @retFindReports TABLE 
(
    tirag INT NOT NULL,
	koef8 NUMERIC(15,5) NULL,
	koef7 NUMERIC(15,5) NULL,
	koef6 NUMERIC(15,5) NULL,
	koef5 NUMERIC(15,5) NULL,
	koef4 NUMERIC(15,5) NULL,
	koef3 NUMERIC(15,5) NULL,
	koef2 NUMERIC(15,5) NULL	
)
AS 
BEGIN

DECLARE @CancelCount INT = 0;
DECLARE @NewPool NUMERIC(15,5), @Pool8 NUMERIC(15,5), @Pool7 NUMERIC(15,5), @Pool6 NUMERIC(15,5), @Pool5 NUMERIC(15,5), @Pool4 NUMERIC(15,5), @Pool3 NUMERIC(15,5), @Pool2 NUMERIC(15,5);
DECLARE @BetAmount NUMERIC(15,5) = 0.2;

-- Check is cancelation exist
SELECT @CancelCount = COUNT(1)
FROM [dbo].[HistoryTotalsMT]
WHERE tirag = @Tirag AND exodus = N'Отмена'

IF @CancelCount > 2
BEGIN 
	INSERT INTO @retFindReports
	SELECT @Tirag, -1, -1, -1, -1, -1, -1, -1 
END 

select @NewPool = [pool] + @KuponsCount*@BetAmount
FROM [dbo].[HistoryTotalsMT]
WHERE tirag = @Tirag AND numb = 1

-- // Minus profit for BK
--SET @NewPool = @NewPool*0.95
SELECT @Pool8 = @NewPool*0.05, @Pool7 = @NewPool*0.05, @Pool6 = @NewPool*0.075, @Pool5 = @NewPool*0.10, @Pool4 = @NewPool*0.125,
	   @Pool3 = @NewPool*0.20, @Pool2 = @NewPool*0.35;	   

IF @CancelCount < 1 
BEGIN

DECLARE @JackPot NUMERIC(15,5)

	SELECT @JackPot = jackPot
	FROM [dbo].[HistoryTotalsMT]
	WHERE tirag = @Tirag AND numb = 1

	INSERT INTO @retFindReports
	SELECT @Tirag,
		   CASE WHEN quan8 + @CountBet8 > 0 THEN (@Pool8 + @JackPot*0.95)/(quan8 + @CountBet8)/@BetAmount ELSE 0 END AS Koef8,
		   CASE -- we have 7, without 8 
				WHEN (quan7 + @CountBet7 > 0) AND (quan8 + @CountBet8 = 0) THEN (@Pool7 + @Pool8*0.3 + @JackPot*0.05)/(quan7 + @CountBet7)/@BetAmount
				-- we have 7 and we have 8 
				WHEN (quan7 + @CountBet7 > 0) AND (quan8 + @CountBet8 > 0) THEN (@Pool7 + @JackPot*0.05)/(quan7 + @CountBet7)/@BetAmount
		   ELSE 0 END AS Koef7,
		   CASE -- we have 6, without 7,8 
				WHEN (quan6 + @CountBet6 > 0) AND (quan8 + @CountBet8 = 0) AND (quan7 + @CountBet7 = 0) THEN (@Pool6 + @Pool7*0.3 + @Pool8*0.3)/(quan6 + @CountBet6)/@BetAmount
				-- we have 6, with 7, without 8 
				WHEN (quan6 + @CountBet6 > 0) AND (quan7 + @CountBet7 > 0) THEN (@Pool6)/(quan6 + @CountBet6)/@BetAmount				
		   ELSE 0 END AS Koef6,
		   CASE -- we have 5, without 6,7,8 
				WHEN (quan5 + @CountBet5 > 0) AND (quan6 + @CountBet6 = 0) AND (quan8 + @CountBet8 = 0) AND (quan7 + @CountBet7 = 0) THEN (@Pool5 + (@Pool6 + @Pool7 + @Pool8)*0.3)/(quan5 + @CountBet5)/@BetAmount				
				-- we have 5, with 6
				WHEN (quan5 + @CountBet5 > 0) AND (quan6 + @CountBet6 > 0) THEN (@Pool5)/(quan5 + @CountBet5)/@BetAmount				
		   ELSE 0 END AS Koef5,
		   CASE -- we have 4, without 5,6,7,8 
				WHEN (quan4 + @CountBet4 > 0) AND (quan5 + @CountBet5 = 0) AND (quan6 + @CountBet6 = 0) AND (quan8 + @CountBet8 = 0) 
				AND (quan7 + @CountBet7 = 0) THEN (@Pool4 + @Pool5*0.3 + @Pool6*0.3 + @Pool7*0.3 + @Pool8*0.3)/(quan4 + @CountBet4)/@BetAmount				
				-- we have 4, with 5
				WHEN (quan4 + @CountBet4 > 0) AND ((quan5 + @CountBet5 > 0) OR (quan6 + @CountBet6 > 0)) THEN (@Pool4)/(quan4 + @CountBet4)/@BetAmount				
		   ELSE 0 END AS Koef4,
		   CASE -- we have 3, without 4,5,6,7,8 
				WHEN (quan3 + @CountBet3 > 0) AND (quan4 + @CountBet4 = 0) AND (quan5 + @CountBet5 = 0) AND (quan6 + @CountBet6 = 0) AND (quan8 + @CountBet8 = 0) 
				AND (quan7 + @CountBet7 = 0) THEN (@Pool3 + @Pool4*0.3 + @Pool5*0.3 + @Pool6*0.3 + @Pool7*0.3 + @Pool8*0.3)/(quan3 + @CountBet3)/@BetAmount				
				-- we have 3, with 4
				WHEN (quan3 + @CountBet3 > 0) AND ((quan4 + @CountBet4 > 0) OR (quan5 + @CountBet5 > 0) OR (quan6 + @CountBet6 > 0)) THEN (@Pool3)/(quan3 + @CountBet3)/@BetAmount				
		   ELSE 0 END AS Koef3,
		   CASE WHEN 
		   CASE -- we have 2, without 3,4,5,6,7,8 
				WHEN (quan2 + @CountBet2 > 0) AND (quan3 + @CountBet3 = 0) AND (quan4 + @CountBet4 = 0) AND (quan5 + @CountBet5 = 0) AND (quan6 + @CountBet6 = 0) AND (quan8 + @CountBet8 = 0) 
				AND (quan7 + @CountBet7 = 0) THEN (@Pool2 + @Pool3*0.3 + @Pool4*0.3 + @Pool5*0.3 + @Pool6*0.3 + @Pool7*0.3 + @Pool8*0.3)/(quan2 + @CountBet2)/@BetAmount				
				-- we have 2, with 3
				WHEN (quan2 + @CountBet2 > 0) AND (quan3 + @CountBet3 > 0) THEN (@Pool2)/(quan2 + @CountBet2)/@BetAmount				
		   ELSE 0 END < 1.1 THEN 1.1
		   ELSE 
		   CASE -- we have 2, without 3,4,5,6,7,8 
				WHEN (quan2 + @CountBet2 > 0) AND (quan3 + @CountBet3 = 0) AND (quan4 + @CountBet4 = 0) AND (quan5 + @CountBet5 = 0) AND (quan6 + @CountBet6 = 0) AND (quan8 + @CountBet8 = 0) 
				AND (quan7 + @CountBet7 = 0) THEN (@Pool2 + @Pool3*0.3 + @Pool4*0.3 + @Pool5*0.3 + @Pool6*0.3 + @Pool7*0.3 + @Pool8*0.3)/(quan2 + @CountBet2)/@BetAmount				
				-- we have 2, with 3
				WHEN (quan2 + @CountBet2 > 0) AND (quan3 + @CountBet3 > 0) THEN (@Pool2)/(quan2 + @CountBet2)/@BetAmount				
		   ELSE 0 END
		   END AS Koef2
	FROM [dbo].[HistoryTotalsMT]
	WHERE tirag = @Tirag AND numb = 1;
	
END  -- IF @CancelCount < 1 

RETURN

END


GO


