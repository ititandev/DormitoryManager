/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2017 (14.0.1000)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [DormitoryDB]
GO
/****** Object:  UserDefinedFunction [dbo].[KiemTraThoiHan]    Script Date: 18/11/2017 9:59:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[KiemTraThoiHan]
(
	@MSSV NVARCHAR(10)
)
RETURNS INT
AS
BEGIN
	DECLARE @ResultVar INT;

	
	IF (SELECT COUNT(*) FROM HopDong WHERE MSSV = @MSSV) > 0
		SET @ResultVar  = dbo.CheckDate((SELECT TOP 1 NgayBatDau FROM HopDong WHERE MSSV = @MSSV ORDER BY MaSo DESC),
		(SELECT TOP 1 NgayKetThuc FROM HopDong WHERE MSSV = @MSSV ORDER BY MaSo DESC))
	ELSE
		SET @ResultVar = 0;


	RETURN @ResultVar

END
