SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UpdateTicket]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[UpdateTicket]
GO
----- Author: <Mahsa Vahed>-----
CREATE PROCEDURE [dbo].UpdateTicket
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

--IF UPDATE(Code) BEGIN

	--	RAISERROR ('Error: cannot change the code.', 16, 10)
--END

UPDATE Ticket SET ID=@Id, airline = @airline, Arrivaldate = @Arrivaldate, arrivaltime = @arrivaltime, availableqty = @availableqty, date = @date, destination = @destination, firstqty = @firstqty, Price = @Price, source = @source, StartTime = @StartTime
WHERE Id=@Id;

END
GO
