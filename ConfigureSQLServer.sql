/*
By default, some advanced options are disable on new installations. 
To use them such as xp_cmdshell, Need to enable and reconfigure.
Run this script
*/

sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
sp_configure 'clr enabled', 1;
GO
RECONFIGURE;
GO

-- To allow advanced options to be changed.
EXEC sp_configure 'show advanced options', 1;
GO
-- To update the currently configured value for advanced options.
RECONFIGURE;
GO
-- To enable the feature.
EXEC sp_configure 'xp_cmdshell', 1;
GO

-- To update the currently configured value for this feature.
RECONFIGURE;
GO

