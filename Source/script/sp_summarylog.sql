USE [CimDbase_IPMS_V2]
GO

/****** Object:  StoredProcedure [dbo].[sp_summarylog]    Script Date: 10/30/2013 7:20:48 AM ******/
DROP PROCEDURE [dbo].[sp_summarylog]
GO

/****** Object:  StoredProcedure [dbo].[sp_summarylog]    Script Date: 10/30/2013 7:20:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Ryu
-- Create date: 
-- Description:	Query Log By TimeStamp
-- =============================================
CREATE PROCEDURE [dbo].[sp_summarylog] 
	-- Add the parameters for the stored procedure here
	@StartDate DateTime = 0, 
	@EndDate DateTime = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	RAISERROR ('Clear SummaryLog Table' , 0, 1) WITH NOWAIT
	DELETE FROM SummaryLog;

	DBCC CHECKIDENT (SummaryLog, RESEED, 0)

	DECLARE @myTable Varchar(50);
	DECLARE @sTemp Varchar(200);
	DECLARE MyTable CURSOR FOR
		SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE '%AMCS%' 
		ORDER BY TABLE_NAME	
		
	OPEN MyTable
	FETCH NEXT FROM MyTable INTO @myTable

	WHILE @@FETCH_STATUS = 0
	BEGIN
		RAISERROR ('Executing : %s' , 0, 1,@myTable) WITH NOWAIT
		exec dbo.sp_tablelog @StartDate, @EndDate, @myTable 
			
		FETCH NEXT FROM MyTable INTO @myTable
	END
	
	CLOSE MyTable
	DEALLOCATE MyTable	
END




GO

