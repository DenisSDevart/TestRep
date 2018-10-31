CREATE TABLE [SQLLighthouse].[DDL_Events]
(
[id] [bigint] NOT NULL IDENTITY(1, 1),
[PostTime] [datetimeoffset] NULL,
[transaction_id] [bigint] NULL,
[spid] [smallint] NULL,
[options] [int] NULL,
[nestlevel] [int] NULL,
[langid] [smallint] NULL,
[client_net_address] [varchar] (48) COLLATE Cyrillic_General_CI_AS NULL,
[appname] [nvarchar] (128) COLLATE Cyrillic_General_CI_AS NULL,
[eventdata] [xml] NULL
) ON [PRIMARY]
GO
ALTER TABLE [SQLLighthouse].[DDL_Events] ADD CONSTRAINT [PK__DDL_Even__3213E83FFBF23CFA] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
