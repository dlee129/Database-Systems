USE [BasketballWNBA]
GO
/****** Object:  StoredProcedure [dbo].[AddForeignKeys]    Script Date: 3/17/2018 7:25:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David Lee
-- Create date: 12/1/17
-- Description:	Add foreign Keys
-- =============================================
ALTER PROCEDURE [dbo].[AddForeignKeys]
AS
BEGIN
	SET NOCOUNT ON;
	/******
	******/
	ALTER TABLE [WNBASeries].[WomBasketBallTeamsPost]  WITH CHECK ADD  CONSTRAINT [FK_WomBasketBallTeamsPost_WomBasketballTeams] FOREIGN KEY([TeamsKey])
	REFERENCES [WNBASeries].[WomBasketballTeams] ([TeamsKey])
	ALTER TABLE [WNBASeries].[WomBasketBallTeamsPost] CHECK CONSTRAINT [FK_WomBasketBallTeamsPost_WomBasketballTeams]

	ALTER TABLE [Coach].[WomBasketballCoaches]  WITH CHECK ADD  CONSTRAINT [FK_WomBasketballCoaches_WomBasketballTeams] FOREIGN KEY([TeamsKey])
	REFERENCES [WNBASeries].[WomBasketballTeams] ([TeamsKey])
	ALTER TABLE [Coach].[WomBasketballCoaches] CHECK CONSTRAINT [FK_WomBasketballCoaches_WomBasketballTeams]

	ALTER TABLE [Player].[WomBasketballPlayersStats]  WITH CHECK ADD  CONSTRAINT [FK_WomBasketballPlayersStats_WomBasketballTeams] FOREIGN KEY([TeamsKey])
	REFERENCES [WNBASeries].[WomBasketballTeams] ([TeamsKey])
	ALTER TABLE [Player].[WomBasketballPlayersStats] CHECK CONSTRAINT [FK_WomBasketballPlayersStats_WomBasketballTeams]

	ALTER TABLE [Player].[WomBasketballAwards]  WITH CHECK ADD  CONSTRAINT [FK_WomBasketballAwards_WomBasketballPlayersStats] FOREIGN KEY([PlayerStatsKey])
	REFERENCES [Player].[WomBasketballPlayersStats] ([PlayerStatsKey])
	ALTER TABLE [Player].[WomBasketballAwards] CHECK CONSTRAINT [FK_WomBasketballAwards_WomBasketballPlayersStats]
	
	ALTER TABLE [Player].[WomBasketballPlayerInfo]  WITH CHECK ADD  CONSTRAINT [FK_WomBasketballPlayerInfo_WomBasketballPlayersStats] FOREIGN KEY([PlayerStatsKey])
	REFERENCES [Player].[WomBasketballPlayersStats] ([PlayerStatsKey])
	ALTER TABLE [Player].[WomBasketballPlayerInfo] CHECK CONSTRAINT [FK_WomBasketballPlayerInfo_WomBasketballPlayersStats]
	
	ALTER TABLE [Player].[WomBasketballDraft]  WITH CHECK ADD  CONSTRAINT [FK_WomBasketballDraft_WomBasketballPlayersStats] FOREIGN KEY([PlayerStatsKey])
	REFERENCES [Player].[WomBasketballPlayersStats] ([PlayerStatsKey])
	ALTER TABLE [Player].[WomBasketballDraft] CHECK CONSTRAINT [FK_WomBasketballDraft_WomBasketballPlayersStats]
	
	ALTER TABLE [WNBASeries].[Abbreviations]  WITH CHECK ADD  CONSTRAINT [FK_Abbreviations_BasketballDescriptions] FOREIGN KEY([AbbrevCode], [AbbrevType])
	REFERENCES [WNBASeries].[BasketballDescriptions] ([AbbrevCode], [AbbrevShortDescription])
	ALTER TABLE [WNBASeries].[Abbreviations] CHECK CONSTRAINT [FK_Abbreviations_BasketballDescriptions]

	ALTER TABLE [WNBASeries].[BasketballDescriptions]  WITH CHECK ADD  CONSTRAINT [FK_BasketballDescriptions_Abbreviations] FOREIGN KEY([AbbKey])
	REFERENCES [WNBASeries].[Abbreviations] ([AbbKey])
	ALTER TABLE [WNBASeries].[BasketballDescriptions] CHECK CONSTRAINT [FK_BasketballDescriptions_Abbreviations]
	
	
END


