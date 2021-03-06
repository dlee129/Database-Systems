USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[BuildSchema]    Script Date: 3/17/2018 7:25:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Build Schema
-- =============================================
ALTER PROCEDURE [dbo].[BuildSchema]
AS
BEGIN
	SET NOCOUNT ON;
	/******
	1.First Drop the foreign Keys from the Schema
	2.And Delete all existing datas.
	3.Transfer backedup data to each tables
	4.Add foreign Key lastly.
	******/
	EXECUTE [dbo].[DropForeignKeys]
	EXECUTE [dbo].[TruncateAllData]

	EXECUTE [dbo].[OriDataToWomBasketballTeams]
	EXECUTE [dbo].[OriDataToBasketballPlayerStats]
	EXECUTE [dbo].[OriDataToWomBasketballCoaches]
	EXECUTE [dbo].[OriDataToWomBasketBallTeamsPost]
	EXECUTE [dbo].[OriDataToWomBasketballSeriesPost]
	EXECUTE [dbo].[OriDataToAbbreviations]
	EXECUTE [dbo].[OriDataToBasketballDescriptions]
	EXECUTE [dbo].[OriDataToBasketballPlayerInfo]
	EXECUTE [dbo].[OriDataToBasketballDraft]
	EXECUTE [dbo].[OriDataToBasketballAwards]

	EXECUTE [dbo].[AddForeignKeys]

END





