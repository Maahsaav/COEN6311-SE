SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Login]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[Login]
GO
----- Author: <Mahsa Vahed>-----
CREATE PROCEDURE [dbo].[Login] 
    @Email VARCHAR(60),
    @Password VARCHAR(32),
    @ReturnValue INT

AS
BEGIN

    -- No User
    IF NOT EXISTS (Select * From Users Where Email=@Email and Password = @Password)
        BEGIN
            SET @ReturnValue = 0
        END


    -- Email Not Exist
    ELSE IF NOT EXISTS (Select * From Users Where Email=@Email)
        BEGIN
            SET @ReturnValue = 1
        END

    -- Password Not Match
    ELSE IF EXISTS (Select * From Users Where Email=@Email)
        BEGIN
            SET @ReturnValue = 2
        END
END
GO