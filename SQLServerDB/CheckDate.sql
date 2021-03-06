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
/****** Object:  UserDefinedFunction [dbo].[CheckDate]    Script Date: 18/11/2017 10:06:16 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER FUNCTION [dbo].[CheckDate]
(
	@NgayBatDau datetime,
	@NgayKetThuc datetime
)
RETURNS INT
AS
BEGIN
	DECLARE @ResultVar INT;

	SET @ResultVar = CASE
		WHEN GETDATE() >= @NgayBatDau AND GETDATE() <= @NgayKetThuc THEN 1
		WHEN GETDATE() < @NgayBatDau AND GETDATE() < @NgayKetThuc THEN 2
		ELSE 0
	END;
	
	RETURN @ResultVar

END
