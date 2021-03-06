USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[OriDataToWomBasketBallTeamsPost]    Script Date: 3/17/2018 7:17:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Data Transfer from FileUpload to Original Table
-- =============================================
ALTER PROCEDURE [dbo].[OriDataToWomBasketBallTeamsPost]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO WNBASeries.WomBasketBallTeamsPost
	  ([Year]
      ,[TeamID]
	  ,[TeamsKey]
      ,[LeagueID]
      ,[Wins]
      ,[Losses])
	SELECT 
	   bp.[Year]
      ,bp.[TeamID]
	  ,bt.[TeamsKey]
      ,bp.[LeagueID]
      ,bp.[Wins]
      ,bp.[Losses]
	FROM FileUpload.WomBasketBallTeamsPost as bp INNER JOIN
		 WNBASeries.WomBasketballTeams as bt
	ON   bp.Year = bt.Year AND
	     bp.TeamID = bt.TeamID AND
		 bp.LeagueID = bt.LeagueID
			
END



