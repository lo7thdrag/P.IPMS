USE [CimDbase_IPMS_V2]
GO

/****** Object:  StoredProcedure [dbo].[sp_savescenario]    Script Date: 10/30/2013 7:20:21 AM ******/
DROP PROCEDURE [dbo].[sp_savescenario]
GO

/****** Object:  StoredProcedure [dbo].[sp_savescenario]    Script Date: 10/30/2013 7:20:21 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Ryu
-- Create date: 
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[sp_savescenario] 
	-- Add the parameters for the stored procedure here
	@ScenarioID int, -- 0 if new, else if update
	@ScenarioName varchar(100) = '', 
	@ScenarioDesc text = ''
AS
BEGIN
	DECLARE @NUM int;
	DECLARE @CNTNAME int;
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT @NUM = COUNT(SCENARIO_ID) FROM Scenario; 
	IF((@NUM > 0) )
	BEGIN
		SELECT @NUM = MAX(Scenario_ID) FROM Scenario;
		SET @NUM = @NUM + 1;
	END
	ELSE
		SET @NUM = 1;

	SELECT @CNTNAME = COUNT(SCEnario_Name) FROM Scenario
		WHERE UPPER(Scenario_Name) LIKE UPPER(@ScenarioName);
	
    PRINT N'Count :' + Cast(@CNTNAME as nvarchar(5));
		
	IF(@CNTNAME >= 1) 
	BEGIN
		DECLARE @tmp int;
		SELECT @tmp = Scenario_ID FROM Scenario
			WHERE UPPER(Scenario_Name) LIKE UPPER(@ScenarioName);
			
		PRINT N'ID :' + Cast(@tmp as nvarchar(5));
		IF (@tmp <> @ScenarioID) 
		BEGIN
			RAISERROR('Scenario Name already exist',16,1);
			SELECT @ScenarioID as SCENARIO_ID, 0 as SUCCESS;
			RETURN;
		END;
	END

	IF(@ScenarioID = 0)
	BEGIN
		INSERT INTO Scenario VALUES(@NUM,UPPER(@ScenarioName),@ScenarioDesc,GETDATE(),
					GETDATE());		
		SELECT @NUM as SCENARIO_ID,1 as SUCCESS;		
	END
	ELSE
	BEGIN
		UPDATE Scenario SET
			 Scenario_Name = UPPER(@ScenarioName),
			 Scenario_Description = @ScenarioDesc,
			 Scenario_Updated = GETDATE()
		WHERE Scenario_ID = @ScenarioID	;
		SELECT @ScenarioID as SCENARIO_ID, 1 as SUCCESS;
	END	
END


GO

