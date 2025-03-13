USE [CimDbase_IPMS_V2]
GO

/****** Object:  StoredProcedure [dbo].[sp_tablelog]    Script Date: 10/30/2013 7:21:02 AM ******/
DROP PROCEDURE [dbo].[sp_tablelog]
GO

/****** Object:  StoredProcedure [dbo].[sp_tablelog]    Script Date: 10/30/2013 7:21:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_tablelog] 
	-- Add the parameters for the stored procedure here
	@startDate DateTime = 0, 
	@endDate DateTime = 0,
	@tablename varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @ColName varchar(50) 
	DECLARE @cStartDate varchar(50)
	DECLARE @cEndDate varchar(50)
	DECLARE @SQL varchar(500);
	
	DECLARE @TimeStart datetime
	DECLARE @TimeEnd datetime
	DECLARE @sTemp varchar(100)
	
	CREATE TABLE #MyTimes(
		tDateTime datetime
	)
	
	CREATE TABLE #MyResult(
		--tID bigint,
		tTime datetime,
		tElementID varchar(50),
		tELementValue float
	)
	
	-- RAISERROR ('Clear SummaryLog Table' , 0, 1) WITH NOWAIT
	-- DELETE FROM SummaryLog	
		
	SET @cEndDate	= CONVERT(nvarchar(50), @EndDate, 126) 
	SET @cStartDate = CONVERT(nvarchar(50), @startDate, 126) 		
	Set @TimeStart = SYSDATETIME()
		
	/*DECLARE MyTable CURSOR FOR
		SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%AMCS%' 
		ORDER BY TABLE_NAME	
		
	OPEN MyTable
	FETCH NEXT FROM MyTable INTO @tableName*/

    DELETE FROM #MyResult
	
	--WHILE @@FETCH_STATUS = 0
	--BEGIN
	/*	RAISERROR ('=========================' , 0, 1) WITH NOWAIT
		Set @sTemp = 'Processing ' + @tableName
		RAISERROR ( @sTemp, 0, 1) WITH NOWAIT
		RAISERROR ('=========================' , 0, 1) WITH NOWAIT	
	*/	
		DELETE FROM #MyTimes
		
		set @sql = 
				N'SELECT [timestamp] as mytime FROM ' + @tableName +
					' WHERE [timestamp] >=' + QUOTENAME(@cStartDate,CHAR(39)) + N' AND 
						[timestamp] <= ' + QUOTENAME(@cEndDate,CHAR(39))

		print @sql
		insert into #MyTimes
		exec(@sql);
		
		DECLARE @qCount int = (SELECT Count(tDateTime) as c FROM #MyTimes) 
		Set @sTemp = 'Timestamp : Querying ' + CAST (@qCount as Varchar(5)) + ' record(s)'
		RAISERROR ( @sTemp, 0, 1) WITH NOWAIT
				
		-- get column table information
		DECLARE MyColumn CURSOR FOR
			SELECT 
				C.COLUMN_NAME AS 'COLUMN NAME'
			FROM INFORMATION_SCHEMA.TABLES T
			INNER JOIN INFORMATION_SCHEMA.COLUMNS C ON T.TABLE_NAME=C.TABLE_NAME
				WHERE   T.TABLE_TYPE='BASE TABLE'
						AND T.TABLE_NAME LIKE @tableName	
					
		OPEN MyColumn
		FETCH NEXT FROM MyColumn INTO @ColName			
		
		DECLARE @SField int = 0;
		WHILE @@FETCH_STATUS = 0
		begin
			
			if @ColName <> 'timestamp'
			BEGIN
				Set @SField = @SField + 1;
				    	
				DECLARE @sql2 varchar(500)					
				
				set @sql2 = 
					N'SELECT [timestamp], ' + QUOTENAME(@ColName,CHAR(39)) + ' as ElmName, ' +
						QUOTENAME(@ColName) + ' as value FROM ' + @tableName +
						' WHERE [timestamp] >=' + QUOTENAME(@cStartDate,CHAR(39)) + N' AND 
							[timestamp] <= ' + QUOTENAME(@cEndDate,CHAR(39))
				
				insert into #MyResult
				exec (@sql2)
			END
			
			FETCH NEXT FROM MyColumn INTO @ColName		
		END
		
		CLOSE MyColumn
		DEALLOCATE MyColumn	

		RAISERROR ('Element Counted : %d', 0, 1,@SField) WITH NOWAIT
		
		--FETCH NEXT FROM MyTable INTO @tableName	
	--END
	
	--CLOSE MyTable
	--DEALLOCATE MyTable

	RAISERROR ('Copying to SummaryLog Table', 0, 1) WITH NOWAIT
	insert into SummaryLog(sumDateTime,sumElementID,sumElementValue) 
		Select * from #MyResult order by tTime, tElementID

	Set @TimeEnd = SYSDATETIME()
	
	Set @sTemp = 'Done in ' + Cast(DateDiff(ss,@TimeStart,@TimeEnd) as Varchar(10)) +  ' second' 
	RAISERROR (@sTemp, 0, 1) WITH NOWAIT		
END



GO

