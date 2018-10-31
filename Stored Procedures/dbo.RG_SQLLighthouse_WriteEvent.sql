SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*
 *    Red Gate
 *
 *
 *  _____   _       __  __       _____               _      _                             _ 
 * |  __ \ | |     |  \/  |     |  __ \             | |    | |                           | |
 * | |  | || |     | \  / |     | |  | |  __ _  ___ | |__  | |__    ___    __ _  _ __  __| |
 * | |  | || |     | |\/| |     | |  | | / _` |/ __|| '_ \ | '_ \  / _ \  / _` || '__|/ _` |
 * | |__| || |____ | |  | |     | |__| || (_| |\__ \| | | || |_) || (_) || (_| || |  | (_| |
 * |_____/ |______||_|  |_|     |_____/  \__,_||___/|_| |_||_.__/  \___/  \__,_||_|   \__,_|
 *                                                                                          
 *                                                                                          
 *
 *
 *    For information about these objects, see: http://www.red-gate.com/dlm-dashboard/ddl-trigger
 *
 *    If you have any problems, or need to change these objects, we really want to know,
 *    please email us at: dlmdashboardsupport@red-gate.com
 *
 *    Copyright © Red Gate Software Ltd. 2016 | Version 1.12 | 2016-02-29
 */
/************************************************************************************************************
 * Stored procedure: RedGate.dbo.RG_SQLLighthouse_WriteEvent
 * Used by trigger RG_SQLLighthouse_DDLTrigger to write change events to RedGate.SQLLighthouse.DDL_Events
 ************************************************************************************************************/
CREATE PROCEDURE [dbo].[RG_SQLLighthouse_WriteEvent]
	@eventdata XML
AS
	INSERT INTO RedGate.SQLLighthouse.DDL_Events
	VALUES  (
		TODATETIMEOFFSET(CONVERT(varchar(23), @eventdata.query('data(/EVENT_INSTANCE/PostTime)')), DATEPART(tz, SYSDATETIMEOFFSET())),
		(SELECT transaction_id from sys.dm_tran_current_transaction), @@SPID, @@OPTIONS, @@NESTLEVEL, @@LANGID, CONVERT(varchar(48), CONNECTIONPROPERTY('client_net_address')), APP_NAME(),
		@eventdata
	  )
	IF (SELECT COUNT(*) FROM RedGate.SQLLighthouse.DDL_Events) >= 512
	BEGIN
		DELETE FROM RedGate.SQLLighthouse.DDL_Events WHERE id <= SCOPE_IDENTITY() - 420
	END
GO
