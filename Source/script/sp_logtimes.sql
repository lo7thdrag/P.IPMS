USE [CimDbase_IPMS_V2]
GO

/****** Object:  StoredProcedure [dbo].[sp_logtimes]    Script Date: 10/30/2013 7:20:35 AM ******/
DROP PROCEDURE [dbo].[sp_logtimes]
GO

/****** Object:  StoredProcedure [dbo].[sp_logtimes]    Script Date: 10/30/2013 7:20:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Ryu
-- Create date: 
-- Description:	All Timestamp
-- =============================================
CREATE PROCEDURE [dbo].[sp_logtimes] 
	-- Add the parameters for the stored procedure here
	@startTime datetime = 0, 
	@endTime datetime = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	CREATE TABLE #MyResult(
		tTime datetime,		
		tTableName varchar(2000)
	)
	
	CREATE TABLE #MyTemp(
		tTime datetime
	)

	CREATE TABLE #MyTemp2(
		tTime datetime
	)
	
	DECLARE @cEndDate varchar(50)
	DECLARE @cStartDate varchar(50)
	DECLARE @sql varchar(500)
	DECLARE @TableName varchar(50)

	SET @cEndDate	= CONVERT(nvarchar(50), @endTime, 126) 
	SET @cStartDate = CONVERT(nvarchar(50), @startTime, 126) 		

	DECLARE MyTable CURSOR FOR
		SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%AMCS%' 
		ORDER BY TABLE_NAME	
		
	OPEN MyTable
	FETCH NEXT FROM MyTable INTO @tableName
	
	--WHILE @@FETCH_STATUS = 0
	--BEGIN
		DELETE FROM #MyTemp
		DELETE FROM #MyTemp2
		
		set @sql = 
				N'SELECT [timestamp] as mytime FROM ' + @tableName +
					' WHERE [timestamp] >=' + QUOTENAME(@cStartDate,CHAR(39)) + N' AND 
						[timestamp] <= ' + QUOTENAME(@cEndDate,CHAR(39))
						
		--print @sql
		insert into #MyTemp
		exec(@sql);
		
		INSERT INTO #MyTemp2 
		SELECT a.tTime FROM #MyTemp a INNER JOIN #MyResult b ON 
			a.tTime = b.tTime
		
		/*DECLARE MyCursor CURSOR FOR 
			SELECT * FROM #MyTemp
			
		DECLARE @time datetime
		
		OPEN MyCursor
		FETCH NEXT FROM MyCursor INTO @time
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
			DECLARE @count int = (SELECT COUNT(tTime) as c FROM #MyResult WHERE 
				tTime = @time)
			
			IF (@count > 0)
			BEGIN
				Print 'updating'
				UPDATE #MyResult SET tTableName = tTableName + ';' + @tableName
				WHERE tTime = @time
			END 
			ELSE BEGIN
				Print 'inserting'
				INSERT INTO #MyResult VALUES(@time,@tableName)
			END
				
			FETCH NEXT FROM MyCursor INTO @time
		END 
		
		CLOSE MyCursor
		DEALLOCATE MyCursor
		*/
		-- FETCH NEXT FROM MyTable INTO @tableName
	--END	
	
	CLOSE MyTable
	DEALLOCATE MyTable

    -- Insert statements for procedure here
	select tTime as timeditableku from #MyTemp
	select tTime as timeygsama from #MyTemp2

END



GO

