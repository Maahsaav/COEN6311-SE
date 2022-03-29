SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[UserCodeList]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[UserCodeList]
GO

----- Author: <Mahsa Vahed>-----
CREATE PROCEDURE [dbo].UserCodeList
	@UserId varchar(60)
WITH ENCRYPTION
AS
SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRY

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

SET @UserId = ISNULL(@UserId,'')

SELECT
	FirstName, LastName, Password, Gender, Email, IsAdmin, PhoneNumber, Birth, Address, City, Country, PostalCode
	
FROM
	Users
WHERE
	Email <> 'ADMIN'
	AND (@UserId = '' OR Email = @UserId)
ORDER BY
	Email

END TRY
BEGIN CATCH
	IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION
	RETURN -1
END CATCH
GO
