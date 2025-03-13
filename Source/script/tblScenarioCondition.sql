USE [CimDbase_IPMS_V2]
GO

ALTER TABLE [dbo].[ScenarioCondition] DROP CONSTRAINT [FK_ScenarioCondition_Scenario]
GO

ALTER TABLE [dbo].[ScenarioCondition] DROP CONSTRAINT [FK_ScenarioCondition_Condition]
GO

/****** Object:  Table [dbo].[ScenarioCondition]    Script Date: 10/30/2013 7:17:23 AM ******/
DROP TABLE [dbo].[ScenarioCondition]
GO

/****** Object:  Table [dbo].[ScenarioCondition]    Script Date: 10/30/2013 7:17:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ScenarioCondition](
	[Scenario_ID] [int] NULL,
	[Condition_ID] [int] NULL,
	[ScenarioCondition_ID] [int] NOT NULL,
 CONSTRAINT [PK_ScenarioCondition] PRIMARY KEY CLUSTERED 
(
	[ScenarioCondition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ScenarioCondition]  WITH CHECK ADD  CONSTRAINT [FK_ScenarioCondition_Condition] FOREIGN KEY([Condition_ID])
REFERENCES [dbo].[Condition] ([Condition_ID])
GO

ALTER TABLE [dbo].[ScenarioCondition] CHECK CONSTRAINT [FK_ScenarioCondition_Condition]
GO

ALTER TABLE [dbo].[ScenarioCondition]  WITH CHECK ADD  CONSTRAINT [FK_ScenarioCondition_Scenario] FOREIGN KEY([Scenario_ID])
REFERENCES [dbo].[Scenario] ([Scenario_ID])
GO

ALTER TABLE [dbo].[ScenarioCondition] CHECK CONSTRAINT [FK_ScenarioCondition_Scenario]
GO

