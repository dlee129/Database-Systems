USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[DropForeignKeys]    Script Date: 3/17/2018 7:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	DROP ALL FOREIGN KEYS
-- =============================================
ALTER PROCEDURE [dbo].[DropForeignKeys]
AS
BEGIN
	SET NOCOUNT ON;

	ALTER TABLE [WNBASeries].[WomBasketBallTeamsPost] DROP CONSTRAINT [FK_WomBasketBallTeamsPost_WomBasketballTeams]
	ALTER TABLE [Coach].[WomBasketballCoaches] DROP CONSTRAINT [FK_WomBasketballCoaches_WomBasketballTeams]
	ALTER TABLE [Player].[WomBasketballPlayersStats] DROP CONSTRAINT [FK_WomBasketballPlayersStats_WomBasketballTeams]
	ALTER TABLE [Player].[WomBasketballAwards] DROP CONSTRAINT [FK_WomBasketballAwards_WomBasketballPlayersStats]
	ALTER TABLE [Player].[WomBasketballPlayerInfo] DROP CONSTRAINT [FK_WomBasketballPlayerInfo_WomBasketballPlayersStats]
	ALTER TABLE [Player].[WomBasketballDraft] DROP CONSTRAINT [FK_WomBasketballDraft_WomBasketballPlayersStats]
	ALTER TABLE [WNBASeries].[Abbreviations] DROP CONSTRAINT [FK_Abbreviations_BasketballDescriptions]
	ALTER TABLE [WNBASeries].[BasketballDescriptions] DROP CONSTRAINT [FK_BasketballDescriptions_Abbreviations]



END











