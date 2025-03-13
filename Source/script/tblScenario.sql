USE [CimDbase_IPMS_V2]
GO

/****** Object:  Table [dbo].[Scenario]    Script Date: 10/30/2013 7:17:37 AM ******/
DROP TABLE [dbo].[Scenario]
GO

/****** Object:  Table [dbo].[Scenario]    Script Date: 10/30/2013 7:17:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Scenario](
	[Scenario_ID] [int] NOT NULL,
	[Scenario_Name] [varchar](max) NOT NULL,
	[Scenario_Description] [text] NULL,
	[Scenario_Created] [datetime] NULL,
	[Scenario_Updated] [datetime] NULL,
 CONSTRAINT [PK_Scenario] PRIMARY KEY CLUSTERED 
(
	[Scenario_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

