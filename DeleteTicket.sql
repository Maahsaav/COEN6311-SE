SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[DeleteTicket]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[DeleteTicket]
GO
----- Author: <Mahsa Vahed>-----
CREATE PROCEDURE [dbo].DeleteTicket
	@TicketId INT,
	@Id INT
AS
BEGIN

IF EXISTS (SELECT * FROM Soldticket WHERE TicketId = @TicketId) BEGIN
	RAISERROR ('Error: This Ticket is exist in Sold Ticket table and cannot be deleted.', 16, 10)
	RETURN -1

END ELSE

DELETE Ticket WHERE ID = @Id

END
GO
