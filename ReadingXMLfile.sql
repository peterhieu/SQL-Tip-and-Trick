CRATE PROC [dbo].[GetXML]
    @FilePath NVARCHAR(max), 
    @xml XML output
AS
BEGIN
    DECLARE @sql nVARCHAR(max) = 'SET @xml = CAST((SELECT CAST(c1 AS xml) FROM OPENROWSET (BULK ''' + @FilePath + ''',SINGLE_BLOB) AS T1(c1)) AS XML)';
    EXEC sp_executesql @sql, N'@xml xml out', @xml out
END
