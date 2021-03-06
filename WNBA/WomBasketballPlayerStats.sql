USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[OriDataToBasketballPlayerStats]    Script Date: 3/17/2018 7:19:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Data Transfer from FileUpload to Original Table
-- =============================================
ALTER PROCEDURE [dbo].[OriDataToBasketballPlayerStats]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Player.WomBasketballPlayersStats
   ([PlayerID],[LeagueID],[TeamID],[TeamsKey],[Year],[Stint],[PlayerName],[GamesPlayed],[GamesStarted],[Minutes],[Points],[OffensiveRebounds]
   ,[DefensiveRebounds],[TotalRebounds],[Assists],[Steals],[Blocks],[Turnovers],[PersonalFouls],[FieldGoalsAttempted]
   ,[FieldGoalsMade],[FieldTriedAttempted],[FieldTriedMade],[ThreesAttempted],[ThreesMade],[Disqualifications],[PostGamesPlayed]
   ,[PostGamesStarted],[PostMinutes],[PostPoints],[PostOffensiveRebounds],[PostDefensiveRebounds],[PostTotalRebounds]
   ,[PostAssists],[PostSteals],[PostBlocks],[PostTurnovers],[PostPersonalFouls],[PostFieldGoalsAttempted],[PostFieldGoalsMade]
   ,[PostFieldTriedAttempted],[PostFieldTriedMade],[PostThressAttempted],[PostThreesMade],[PostDisqualifications])
	SELECT 
	ps.[PlayerID],ps.[LeagueID],ps.[TeamID],bt.[TeamsKey],ps.[Year],ps.[Stint],ps.[PlayerName],ps.[GamesPlayed],ps.[GamesStarted],ps.[Minutes],ps.[Points],ps.[OffensiveRebounds]
   ,ps.[DefensiveRebounds],ps.[TotalRebounds],ps.[Assists],ps.[Steals],ps.[Blocks],ps.[Turnovers],ps.[PersonalFouls],ps.[FieldGoalsAttempted]
   ,ps.[FieldGoalsMade],ps.[FieldTriedAttempted],ps.[FieldTriedMade],ps.[ThreesAttempted],ps.[ThreesMade],ps.[Disqualifications],ps.[PostGamesPlayed]
   ,ps.[PostGamesStarted],ps.[PostMinutes],ps.[PostPoints],ps.[PostOffensiveRebounds],ps.[PostDefensiveRebounds],ps.[PostTotalRebounds]
   ,ps.[PostAssists],ps.[PostSteals],ps.[PostBlocks],ps.[PostTurnovers],ps.[PostPersonalFouls],ps.[PostFieldGoalsAttempted],ps.[PostFieldGoalsMade]
   ,ps.[PostFieldTriedAttempted],ps.[PostFieldTriedMade],ps.[PostThressAttempted],ps.[PostThreesMade],ps.[PostDisqualifications]
	FROM FileUpload.WomBasketballPlayersStats as ps LEFT JOIN
	     WNBASeries.WomBasketballTeams as bt
	ON   ps.Year = bt.Year AND
	     ps.TeamID = bt.TeamID AND
		 ps.LeagueID = bt.LeagueID
			
END




