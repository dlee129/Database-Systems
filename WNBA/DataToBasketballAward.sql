USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[OriDataToBasketballAwards]    Script Date: 3/17/2018 7:24:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Data Transfer from FileUpload to Original Table
-- =============================================
ALTER PROCEDURE [dbo].[OriDataToBasketballAwards]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Player.WomBasketballAwards
	            (PlayerID,PlayerStatsKey,Award,Year,LeagueID,TeamID,Note,Pos,Name)
	SELECT ps.PlayerID,ps.PlayerStatsKey, ba.Award, ba.Year,ba.LeagueID,ps.TeamID,ba.Note,ba.Pos,ba.Name
	FROM FileUpload.WomBasketballAwards as ba INNER JOIN
	     Player.WomBasketballPlayersStats as ps 
	ON   ba.Name = ps.PlayerName AND
	     ba.LeagueID = ps.LeagueID AND
		 ba.Year = ps.Year
    WHERE ba.Name != ''
			
END




