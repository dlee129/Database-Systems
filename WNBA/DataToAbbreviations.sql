USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[OriDataToAbbreviations]    Script Date: 3/17/2018 7:24:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Data Transfer from FileUpload to Original Table
-- =============================================
ALTER PROCEDURE [dbo].[OriDataToAbbreviations]
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO WNBASeries.Abbreviations
	  ([AbbrevCode]
      ,[AbbrevType]
      ,[AbbrevFullName])
	SELECT
	   [AbbrevCode]
      ,[AbbrevType]
      ,[AbbrevFullName]
	FROM FileUpload.Abbreviations

END


