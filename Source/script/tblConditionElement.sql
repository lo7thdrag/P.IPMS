USE [CimDbase_IPMS_V2]
GO

ALTER TABLE [dbo].[ConditionElement] DROP CONSTRAINT [FK_ConditionElement_Elements]
GO

ALTER TABLE [dbo].[ConditionElement] DROP CONSTRAINT [FK_ConditionElement_Condition]
GO

/****** Object:  Table [dbo].[ConditionElement]    Script Date: 10/30/2013 7:19:24 AM ******/
DROP TABLE [dbo].[ConditionElement]
GO

/****** Object:  Table [dbo].[ConditionElement]    Script Date: 10/30/2013 7:19:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ConditionElement](
	[Condition_ID] [int] NULL,
	[Element_ID] [nvarchar](15) NULL,
	[ConditionElement_ID] [int] NOT NULL,
 CONSTRAINT [PK_ConditionElement] PRIMARY KEY CLUSTERED 
(
	[ConditionElement_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ConditionElement]  WITH CHECK ADD  CONSTRAINT [FK_ConditionElement_Condition] FOREIGN KEY([Condition_ID])
REFERENCES [dbo].[Condition] ([Condition_ID])
GO

ALTER TABLE [dbo].[ConditionElement] CHECK CONSTRAINT [FK_ConditionElement_Condition]
GO

ALTER TABLE [dbo].[ConditionElement]  WITH CHECK ADD  CONSTRAINT [FK_ConditionElement_Elements] FOREIGN KEY([Element_ID])
REFERENCES [dbo].[Elements] ([ElementID])
GO

ALTER TABLE [dbo].[ConditionElement] CHECK CONSTRAINT [FK_ConditionElement_Elements]
GO

