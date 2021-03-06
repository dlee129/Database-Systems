USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[OriDataToWomBasketballSeriesPost]    Script Date: 3/17/2018 7:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Data Transfer from FileUpload to Original Table
-- =============================================
ALTER PROCEDURE [dbo].[OriDataToWomBasketballSeriesPost]
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO WNBASeries.WomBasketballSeriesPost
	  ( [Year]
      ,[Round]
      ,[Series]
      ,[TeamIDWinner]
      ,[LeagueIDWinner]
      ,[TeamIDLoser]
      ,[LeagueIDLoser]
      ,[Wins]
      ,[Losses])
	SELECT
	    [Year]
      ,[Round]
      ,[Series]
      ,[TeamIDWinner]
      ,[LeagueIDWinner]
      ,[TeamIDLoser]
      ,[LeagueIDLoser]
      ,[Wins]
      ,[Losses]
	FROM FileUpload.WomBasketballSeriesPost

END
