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
 * Stored procedure: RedGate.dbo.RG_SQLLighthouse_WriteError
 * Used by trigger RG_SQLLighthouse_DDLTrigger to write error logs to RedGate.SQLLighthouse.Trigger_Errors
 ************************************************************************************************************/
CREATE PROCEDURE [dbo].[RG_SQLLighthouse_WriteError]
	@error_number INT,
	@error_severity INT,
	@error_state INT,
	@error_procedure sysname,
	@error_line INT,
	@error_message NVARCHAR(4000)
AS

	INSERT  INTO RedGate.SQLLighthouse.Trigger_Errors
	VALUES  (
		SYSDATETIMEOFFSET(), @error_number, @error_severity, @error_state, @error_procedure, @error_line, @error_message
		)
	IF (SELECT COUNT(*) FROM RedGate.SQLLighthouse.Trigger_Errors) >= 512
	BEGIN
		DELETE FROM RedGate.SQLLighthouse.Trigger_Errors WHERE id <= SCOPE_IDENTITY() - 420
	END
GO
