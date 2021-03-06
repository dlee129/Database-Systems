USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[OriDataToWomBasketballTeams]    Script Date: 3/17/2018 7:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Data Transfer from FileUpload to Original Table
-- =============================================
ALTER PROCEDURE [dbo].[OriDataToWomBasketballTeams]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO WNBASeries.WomBasketballTeams
	([Year],[LeagueID],[TeamID],[FranchiseID],[ConferenceID],[DivisionID],[Rank],[Playoff],[Seeded]
    ,[FirstRound],[Semis],[Finals],[Name],[OffensiveFieldGoalsMade],[OffensiveFieldGoalsAttempted],[OffensiveFieldTriedMade]
    ,[OffensiveFieldTriedAttempted],[OffensiveThreePointersMade],[OffensiveThreePointersAttempted],[AsAwayTeamOffensiveRebound]
    ,[AsAwayTeamDefensiveRebound],[AsAwayTeamTotalRebound],[AsAwayTeamAssists],[AsAwayTeamPersonalFoul],[AsAwayTeamSteals]
    ,[AsAwayTeamTimeOut],[AsAwayTeamOffensiveBlock],[AsAwayTeamPoints],[AsHomeTeamFieldGoalsMade],[AsHomeTeamFieldGoalsAttempted]
    ,[AsHomeTeamFieldTriedMade],[AsHomeTeamFieldTriedAttempted],[AsHomeTeamThreesMade],[AsHomeTeamThreesAttempted]
    ,[AsHomeTeamOffensiveRebound],[AsHomeTeamDefensiveRebounds],[AsHomeTeamTotalRebounds],[AsHomeTeamAssists]
    ,[AsHomeTeamPersonalFouls],[AsHomeTeamSteals],[AsHomeTeamTimeOuts],[AsHomeTeamBlocks],[AsHomeTeamPoints]
    ,[TeamOffensiveRebounds],[TeamDefensiveRebounds],[TeamTotalRebounds],[OpponentOffensiveRebounds],[OpponentDefensiveRebounds]
    ,[OpponentTotalRebounds],[Won],[Lost],[GamesPlayed],[HomeWins],[HomeLosses],[AwayWins],[AwayLosses],[ConferenceWins]
    ,[ConferenceLosses],[Minutes],[Attendees],[ArenaName])
	SELECT 
	 bt.[Year],bt.[LeagueID],bt.[TeamID],bt.[FranchiseID],bt.[ConferenceID],bt.[DivisionID],bt.[Rank],bt.[Playoff],bt.[Seeded]
    ,bt.[FirstRound],bt.[Semis],bt.[Finals],bt.[Name],bt.[OffensiveFieldGoalsMade],bt.[OffensiveFieldGoalsAttempted],bt.[OffensiveFieldTriedMade]
    ,bt.[OffensiveFieldTriedAttempted],bt.[OffensiveThreePointersMade],bt.[OffensiveThreePointersAttempted],bt.[AsAwayTeamOffensiveRebound]
    ,bt.[AsAwayTeamDefensiveRebound],bt.[AsAwayTeamTotalRebound],bt.[AsAwayTeamAssists],bt.[AsAwayTeamPersonalFoul],bt.[AsAwayTeamSteals]
    ,bt.[AsAwayTeamTimeOut],bt.[AsAwayTeamOffensiveBlock],bt.[AsAwayTeamPoints],bt.[AsHomeTeamFieldGoalsMade],bt.[AsHomeTeamFieldGoalsAttempted]
    ,bt.[AsHomeTeamFieldTriedMade],bt.[AsHomeTeamFieldTriedAttempted],bt.[AsHomeTeamThreesMade],bt.[AsHomeTeamThreesAttempted]
    ,bt.[AsHomeTeamOffensiveRebound],bt.[AsHomeTeamDefensiveRebounds],bt.[AsHomeTeamTotalRebounds],bt.[AsHomeTeamAssists]
    ,bt.[AsHomeTeamPersonalFouls],bt.[AsHomeTeamSteals],bt.[AsHomeTeamTimeOuts],bt.[AsHomeTeamBlocks],bt.[AsHomeTeamPoints]
    ,bt.[TeamOffensiveRebounds],bt.[TeamDefensiveRebounds],bt.[TeamTotalRebounds],bt.[OpponentOffensiveRebounds],bt.[OpponentDefensiveRebounds]
    ,bt.[OpponentTotalRebounds],bt.[Won],bt.[Lost],bt.[GamesPlayed],bt.[HomeWins],bt.[HomeLosses],bt.[AwayWins],bt.[AwayLosses],bt.[ConferenceWins]
    ,bt.[ConferenceLosses],bt.[Minutes],bt.[Attendees],bt.[ArenaName]
	FROM FileUpload.WomBasketballTeams as bt
			
END







