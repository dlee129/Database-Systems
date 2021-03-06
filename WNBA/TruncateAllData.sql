USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[TruncateAllData]    Script Date: 3/17/2018 7:17:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Truncat All datas
-- =============================================
ALTER PROCEDURE [dbo].[TruncateAllData]
AS
BEGIN
	SET NOCOUNT ON;

	TRUNCATE TABLE [Coach].[WomBasketballCoaches]
	TRUNCATE TABLE [Player].[WomBasketballAwards]
	TRUNCATE TABLE [Player].[WomBasketballDraft]
	TRUNCATE TABLE [Player].[WomBasketballPlayerInfo]
	TRUNCATE TABLE [Player].[WomBasketballPlayersStats]
	TRUNCATE TABLE [WNBASeries].[Abbreviations]
	TRUNCATE TABLE [WNBASeries].[BasketballDescriptions]
	TRUNCATE TABLE [WNBASeries].[WomBasketballSeriesPost]
	TRUNCATE TABLE [WNBASeries].[WomBasketballTeams]
	TRUNCATE TABLE [WNBASeries].[WomBasketBallTeamsPost]

END




