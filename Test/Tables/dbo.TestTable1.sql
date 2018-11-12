SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TestTable1] (
		[col1]     [int] NULL,
		[col2]     [int] NULL,
		[col4]     [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TestTable1] SET (LOCK_ESCALATION = TABLE)
GO
