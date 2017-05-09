CRATE PROC [dbo].[GetXML]
    @FilePath NVARCHAR(max), 
    @xml XML output
AS
BEGIN
    DECLARE @sql nVARCHAR(max) = 'SET @xml = CAST((SELECT CAST(c1 as xml) from OPENROWSET (BULK ''' + @FilePath + ''',SINGLE_BLOB) as T1(c1)) AS XML)';
    EXEC sp_executesql @sql, N'@xml xml out', @xml out
END