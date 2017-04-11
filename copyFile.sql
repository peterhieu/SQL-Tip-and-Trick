CREATE PROCEDURE [dbo].[CopyFile]
	@from_path NVARCHAR(400),
	@to_path NVARCHAR(400),
	@p_authentication INT = 0
AS
BEGIN     
	DECLARE @l_return_code INT; 
	DECLARE @l_cmdstring VARCHAR(2000);	

	IF @p_authentication = 0
	BEGIN
		SET @l_cmdstring = N'copy "' + @from_path+ '" "' + @to_path + '" /Y ';
		EXEC WriteINFOLog @p_message = @l_cmdstring;
		RETURN @l_return_code
	END
	
	-- Authentication uncomment the statement below if need authentication
	-- EXEC AuthenSAMBA
	SET @l_cmdstring = N'copy "' + @from_path+ '" "' + @to_path + '" /Y ';
	EXEC @l_return_code = master..xp_cmdshell @l_cmdstring;
	EXEC WriteINFOLog @p_message = @l_cmdstring;

	RETURN @l_return_code;
END