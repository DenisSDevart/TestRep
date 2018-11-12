CREATE TABLE [dbo].[emp]
(
[empno] [int] NOT NULL,
[ename] [varchar] (10) COLLATE Cyrillic_General_CI_AS NULL,
[job] [varchar] (9) COLLATE Cyrillic_General_CI_AS NULL,
[mgr] [int] NULL,
[hiredate] [datetime] NULL,
[sal] [numeric] (7, 2) NULL,
[comm] [numeric] (7, 2) NULL,
[dept] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[emp] ADD CONSTRAINT [PK__emp__AF4C318A371B8029] PRIMARY KEY CLUSTERED  ([empno]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[emp] ADD CONSTRAINT [FK_emp_dept_deptno] FOREIGN KEY ([dept]) REFERENCES [dbo].[dept] ([deptno])
GO
