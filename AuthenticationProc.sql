CREATE PROC [dbo].[AuthenticationProc]	
AS
BEGIN
	DECLARE @l_user				AS VARCHAR(50);
	DECLARE @l_password			AS VARCHAR(50);
	DECLARE @l_drive_letter		AS VARCHAR(1);
	DECLARE @l_root_dir			AS VARCHAR(200);
	DECLARE @l_ret_code 		INT;
	DECLARE @l_cmdstring 		VARCHAR(2000);	

	-- Get authentication information from Configuration table which is stored in 1 place in database
	SELECT @l_user = SAMBAUser,
		   @l_password = SAMBAPassword,
		   @l_drive_letter = DriveLeter,
		   @l_root_dir = RootDir
	FROM Configuration

	IF @l_user IS NULL OR @l_password IS NULL
	BEGIN
		RETURN 0;
	END

	SET @l_cmdstring  = 'NET USE ' + @l_drive_letter + ': ' + @l_root_dir + ' /USER:' + @l_user + ' ' + @l_password;
	EXEC WriteINFOLog @p_message = @l_cmdstring;
	EXEC  @l_ret_code = master..xp_cmdshell @l_cmdstring; 

	RETURN @l_ret_code;
END