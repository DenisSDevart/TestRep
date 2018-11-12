SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dept] (
		[deptno]     [int] NOT NULL,
		[dname]      [varchar](14) COLLATE Cyrillic_General_CI_AS NULL,
		[loc]        [varchar](13) COLLATE Cyrillic_General_CI_AS NULL,
		CONSTRAINT [PK_dept]
		PRIMARY KEY
		CLUSTERED
		([deptno])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dept] SET (LOCK_ESCALATION = TABLE)
GO
