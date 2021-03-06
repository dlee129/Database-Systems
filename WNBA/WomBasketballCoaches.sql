USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[OriDataToWomBasketballCoaches]    Script Date: 3/17/2018 7:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Data Transfer from FileUpload to Original Table
-- =============================================
ALTER PROCEDURE [dbo].[OriDataToWomBasketballCoaches]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Coach.WomBasketballCoaches
	  ([CoachID]
      ,[Year]
      ,[TeamID]
	  ,[TeamsKey]
      ,[LeagueID]
      ,[Stint]
      ,[FullName]
      ,[Won]
      ,[Lost]
      ,[PostWins]
      ,[PostLosses]
      ,[PlayerCoach])
	SELECT 
	   bc.[CoachID]
      ,bc.[Year]
      ,bc.[TeamID]
	  ,bt.[TeamsKey]
      ,bc.[LeagueID]
      ,bc.[Stint]
      ,bc.[FullName]
      ,bc.[Won]
      ,bc.[Lost]
      ,bc.[PostWins]
      ,bc.[PostLosses]
      ,bc.[PlayerCoach]
	FROM FileUpload.WomBasketballCoaches as bc INNER JOIN
		 WNBASeries.WomBasketballTeams as bt
	ON   bc.Year = bt.Year AND
	     bc.TeamID = bt.TeamID AND
		 bc.LeagueID = bt.LeagueID
			
END





