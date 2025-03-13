USE [CimDbase_IPMS_V2]
GO

ALTER TABLE [dbo].[RunningScenario] DROP CONSTRAINT [FK_RunningScenario_Scenario]
GO

/****** Object:  Table [dbo].[RunningScenario]    Script Date: 10/30/2013 7:17:50 AM ******/
DROP TABLE [dbo].[RunningScenario]
GO

/****** Object:  Table [dbo].[RunningScenario]    Script Date: 10/30/2013 7:17:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RunningScenario](
	[Running_ID] [int] NOT NULL,
	[Running_TimeStamp] [timestamp] NULL,
	[Running_Start] [datetime] NULL,
	[Running_End] [datetime] NULL,
	[Scenario_ID] [int] NULL,
 CONSTRAINT [PK_RunningScenario] PRIMARY KEY CLUSTERED 
(
	[Running_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RunningScenario]  WITH CHECK ADD  CONSTRAINT [FK_RunningScenario_Scenario] FOREIGN KEY([Scenario_ID])
REFERENCES [dbo].[Scenario] ([Scenario_ID])
GO

ALTER TABLE [dbo].[RunningScenario] CHECK CONSTRAINT [FK_RunningScenario_Scenario]
GO

