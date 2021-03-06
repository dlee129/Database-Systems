USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[OriDataToBasketballDraft]    Script Date: 3/17/2018 7:21:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Data Transfer from FileUpload to Original Table
-- =============================================
ALTER PROCEDURE [dbo].[OriDataToBasketballDraft]
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO Player.WomBasketballDraft
	([DraftYear], [DraftRound] ,[DraftSelection],[DraftOverall],[PlayerStatsKey],[TmID],[FirstName],[LastName],[FullName] ,[SuffixName]
    ,[PlayerID],[DraftFrom],[LeagueID],[PlayedPro],[Notes],[PickRoute])
	SELECT
	bd.DraftYear,bd.DraftRound,bd.DraftSelection,bd.DraftOverall,ps.PlayerStatsKey,bd.TmID,bd.FirstName,bd.LastName,bd.FullName,
	bd.SuffixName,ps.PlayerID,bd.DraftFrom,bd.LeagueID,bd.PlayedPro,bd.Notes,bd.PlayedPro
	FROM FileUpload.WomBasketballDraft as bd INNER JOIN
	     Player.WomBasketballPlayersStats as ps 
	ON   bd.DraftYear = ps.Year AND
	     bd.TmID = ps.TeamID AND
		 bd.LeagueID = ps.LeagueID AND
		 bd.FullName = ps.PlayerName

END




