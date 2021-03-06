USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[OriDataToBasketballDescriptions]    Script Date: 3/17/2018 7:24:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Data Transfer from FileUpload to Original Table
-- =============================================
ALTER PROCEDURE [dbo].[OriDataToBasketballDescriptions]
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO WNBASeries.BasketballDescriptions
	  ([AbbKey]
	  ,[AbbrevCode]
      ,[AbbrevShortDescription]
      ,[AbbrevLongDescription])
	SELECT
	   ab.[AbbKey]
	  ,ab.[AbbrevCode]
      ,ab.[AbbrevType]
      ,bd.[AbbrevLongDescription]
	FROM FileUpload.BasketballDescriptions as bd RIGHT JOIN
	     WNBASeries.Abbreviations as ab
    ON   bd.AbbrevCode = ab.AbbrevCode AND
		 bd.AbbrevShortDescription = ab.AbbrevType
END





