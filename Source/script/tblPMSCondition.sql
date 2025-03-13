USE [CimDbase_IPMS_V2]
GO

ALTER TABLE [dbo].[PMS_Condition] DROP CONSTRAINT [FK_PMS_Condition_Condition]
GO

/****** Object:  Table [dbo].[PMS_Condition]    Script Date: 10/30/2013 7:18:02 AM ******/
DROP TABLE [dbo].[PMS_Condition]
GO

/****** Object:  Table [dbo].[PMS_Condition]    Script Date: 10/30/2013 7:18:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[PMS_Condition](
	[PMS_ID] [int] NOT NULL,
	[PMS_Name] [varchar](50) NULL,
	[PMS_Type] [int] NULL,
	[PMS_State] [int] NULL,
	[PMS_OnOff] [int] NULL,
	[Condition_ID] [int] NULL,
 CONSTRAINT [PK_PMS_ID] PRIMARY KEY CLUSTERED 
(
	[PMS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[PMS_Condition]  WITH CHECK ADD  CONSTRAINT [FK_PMS_Condition_Condition] FOREIGN KEY([Condition_ID])
REFERENCES [dbo].[Condition] ([Condition_ID])
GO

ALTER TABLE [dbo].[PMS_Condition] CHECK CONSTRAINT [FK_PMS_Condition_Condition]
GO

