CREATE TABLE [SQLLighthouse].[Trigger_Errors]
(
[id] [bigint] NOT NULL IDENTITY(1, 1),
[error_time] [datetimeoffset] NULL,
[error_number] [int] NULL,
[error_severity] [int] NULL,
[error_state] [int] NULL,
[error_procedure] [sys].[sysname] NOT NULL,
[error_line] [int] NULL,
[error_message] [nvarchar] (4000) COLLATE Cyrillic_General_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [SQLLighthouse].[Trigger_Errors] ADD CONSTRAINT [PK__Trigger___3213E83F56F0ABB4] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
