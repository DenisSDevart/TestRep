SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Test] (
		[col1]     [int] NULL,
		[col2]     [int] NULL,
		[col3]     [varchar](50) COLLATE Cyrillic_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Test] SET (LOCK_ESCALATION = TABLE)
GO
