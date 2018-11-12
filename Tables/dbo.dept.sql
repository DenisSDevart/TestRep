CREATE TABLE [dbo].[dept]
(
[deptno] [int] NOT NULL,
[dname] [varchar] (14) COLLATE Cyrillic_General_CI_AS NULL,
[loc] [varchar] (13) COLLATE Cyrillic_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dept] ADD CONSTRAINT [PK_dept] PRIMARY KEY CLUSTERED  ([deptno]) ON [PRIMARY]
GO
