USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[OriDataToBasketballPlayerInfo]    Script Date: 3/17/2018 7:23:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Data Transfer from FileUpload to Original Table
-- =============================================
ALTER PROCEDURE [dbo].[OriDataToBasketballPlayerInfo]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Player.WomBasketballPlayerInfo
	([BioID],[PlayerStatsKey],[FirstName],[MiddleName],[LastName],[NameGiven],[FullGivenName],[MarriedName],[NameNick],[Pos],[FirstSeason]
   ,[LastSeason],[Height],[Weight],[College],[CollegeOther],[BirthDate],[BirthCity],[BirthState],[BirthCountry],[HighSchool]
   ,[HighschoolCity],[HighschoolState],[HighschoolCountry],[DeathDate])
	SELECT 
	pi.[BioID],ps.[PlayerStatsKey],pi.[FirstName],pi.[MiddleName],pi.[LastName],pi.[NameGiven],pi.[FullGivenName],pi.[MarriedName],pi.[NameNick],pi.[Pos],pi.[FirstSeason]
   ,pi.[LastSeason],pi.[Height],pi.[Weight],pi.[College],pi.[CollegeOther],pi.[BirthDate],pi.[BirthCity],pi.[BirthState],pi.[BirthCountry],pi.[HighSchool]
   ,pi.[HighschoolCity],pi.[HighschoolState],pi.[HighschoolCountry],pi.[DeathDate]
	FROM FileUpload.WomBasketballPlayerInfo as pi INNER JOIN
		 Player.WomBasketballPlayersStats as ps 
	ON   pi.BioID = ps.PlayerID
			
END



