SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Register]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Register]
GO
----- Author: <Mahsa Vahed>-----
CREATE PROCEDURE [dbo].Register
	@UserId varchar(60),
	@FirstName varchar(50),
	@LastName varchar(50),
	@Password varchar(32),
	@Gender varchar(10),
	@PhoneNumber bigint,
	@Birthday date,
	@Address varchar(50),
	@City varchar(50),
	@Country varchar(50),
	@PostalCode varchar(10)

AS
BEGIN

SET @UserId = ISNULL(@UserId,'')

IF @UserId = 'ADMIN' BEGIN
	IF NOT EXISTS(SELECT * FROM Users WHERE Email = 'ADMIN')
		INSERT INTO Users(Email, FirstName, LastName, Password, Gender, PhoneNumber, Address, City, Country, PostalCode, IsAdmin) 
		VALUES ('ADMIN', 'Admin', 'Admin', 000, 'Male', 000, 'ADD1', 'City', 'Country', '123', 1 )
END

IF EXISTS(SELECT * FROM Users WHERE Email = @UserId) BEGIN
	RAISERROR('Error: This Email is already exist.',16,10)
	RETURN -1

END ELSE

INSERT INTO Users( FirstName, LastName, Password, Gender, Email, IsAdmin, PhoneNumber, Birth, Address, City, Country, PostalCode)
VALUES (@FirstName, @LastName , @Password, @Gender, @UserId, 0, @PhoneNumber, @Birthday, @Address, @City, @Country, @PostalCode)

END
GO
