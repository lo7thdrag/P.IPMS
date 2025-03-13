USE [CimDbase_IPMS_V2]
GO

/****** Object:  Table [dbo].[Condition]    Script Date: 10/30/2013 7:18:13 AM ******/
DROP TABLE [dbo].[Condition]
GO

/****** Object:  Table [dbo].[Condition]    Script Date: 10/30/2013 7:18:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Condition](
	[Condition_ID] [int] NOT NULL,
	[Condition_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Condition] PRIMARY KEY CLUSTERED 
(
	[Condition_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

