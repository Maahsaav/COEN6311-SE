SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[ADDTicket]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[ADDTicket]
GO
----- Author: <Mahsa Vahed>-----
CREATE PROCEDURE [dbo].ADDTicket
	@Id int,
	@airline varchar(50),
	@Arrivaldate date,
	@arrivaltime time,
	@availableqty int,
	@date date,
	@destination varchar(50),
	@firstqty int,
	@Price float,
	@source varchar(50),
	@StartTime Time

AS
BEGIN

SET @Id = ISNULL(@Id,'')


IF EXISTS(SELECT * FROM Ticket WHERE ID = @Id) BEGIN
	RAISERROR('Error: This Ticket is already exist.',16,10)
	RETURN -1

END ELSE

INSERT INTO Ticket( ID, airline, Arrivaldate, arrivaltime, availableqty, date, destination, firstqty, Price, source, StartTime)
VALUES (@Id, @airline , @Arrivaldate, @arrivaltime, @availableqty, @date, @destination, @firstqty, @Price, @source, @StartTime)

END
GO
