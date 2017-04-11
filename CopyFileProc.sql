CREATE PROCEDURE [dbo].[CopyFileProc]
	@src_path NVARCHAR(400),
	@dst_path NVARCHAR(400),
	@p_authentication INT = 0
AS
BEGIN     
	DECLARE @l_return_code INT; 
	DECLARE @l_cmdstring VARCHAR(2000);	

	IF @p_authentication = 0
	BEGIN
		SET @l_cmdstring = N'copy "' + @src_path+ '" "' + @dst_path + '" /Y ';
		RETURN @l_return_code
	END
	
	-- If need Authentication.
	-- Ref to: AuthenticationProc.sql
	EXEC AuthenticationProc
	SET @l_cmdstring = N'copy "' + @src_path+ '" "' + @dst_path + '" /Y ';
	EXEC @l_return_code = master..xp_cmdshell @l_cmdstring;

	RETURN @l_return_code;
END