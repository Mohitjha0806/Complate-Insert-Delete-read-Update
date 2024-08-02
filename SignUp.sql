
CREATE DATABASE SignUp;

CREATE TABLE tbl_sign (
    ID INT PRIMARY KEY IDENTITY(1,1),
    FULL_NAME VARCHAR(50) NULL,
    EMAIL VARCHAR(50) NULL,
    PHONE VARCHAR(20) NULL,
    USERNAME VARCHAR(20) NULL,
    PASSWORD VARCHAR(20) NULL
);
GO

SELECT * FROM tbl_sign; 


CREATE PROC signup_insert (
@FULL_NAME VARCHAR(50) = NULL,
@EMAIL VARCHAR(50) = NULL,
@PHONE VARCHAR(20) = NULL,
@USERNAME VARCHAR(20) = NULL,
@PASSWORD VARCHAR(20) = NULL )
AS 
BEGIN

INSERT INTO tbl_sign([FULL_NAME], [EMAIL], [PHONE], [USERNAME], [PASSWORD])
VALUES(
@FULL_NAME,
@EMAIL,
@PHONE,
@USERNAME,
@PASSWORD)
END;



CREATE PROC SignUpDataGrid
AS
BEGIN
SELECT [ID], [FULL_NAME], [EMAIL], [PHONE], [USERNAME], [PASSWORD] FROM tbl_sign;
END;


SELECT * FROM tbl_sign;


--alter PROC SignUpDelete
--@ID INT
--AS
--BEGIN
--DELETE FROM tbl_sign WHERE ID = @ID;
--SELECT @@ROWCOUNT AS RowsAffected;
--END;

ALTER PROC SignUpDelete(
@ID INT,
@FULL_NAME VARCHAR(50) = NULL,
@EMAIL VARCHAR(50) = NULL,
@PHONE VARCHAR(20) = NULL,
@USERNAME VARCHAR(20) = NULL,
@PASSWORD VARCHAR(20) = NULL )
AS
BEGIN
Declare @status varchar (10), @Message varchar (40)
BEGIN TRY
DELETE FROM tbl_sign WHERE ID = @ID
SET @status = 'OK'
 SET @message = 'DATA UPDATE SUCCESSFully'
END TRY
BEGIN CATCH
SET @status = 'NOTOK'
SET @Message = ERROR_MESSAGE()
END CATCH
SELECT @status AS stat, @Message AS msg
END



ALTER proc SignUpUpdate
	@ID INT ,
    @FULL_NAME VARCHAR(50),
    @EMAIL VARCHAR(50),
    @PHONE VARCHAR(20),
    @USERNAME VARCHAR(20) ,
    @PASSWORD VARCHAR(20)
AS
BEGIN
DECLARE @STATUS VARCHAR(10), @MESSAGE VARCHAR(40)
BEGIN TRY
UPDATE tbl_sign
SET  
    FULL_NAME = @FULL_NAME,
    EMAIL = @EMAIL,
    PHONE = @PHONE,
    USERNAME= @USERNAME,
    PASSWORD = @PASSWORD
    WHERE ID = @ID;
	SET @STATUS  = 'OK'
	SET @MESSAGE = 'DATA UPDATE SUCCESSFULLY'
	END TRY
BEGIN CATCH
SET @STATUS = 'NOTOK'
SET @MESSAGE =  ERROR_MESSAGE()

END CATCH
SELECT @STATUS AS STAT, @MESSAGE AS MSG
END    








CREATE DATABASE signup;

CREATE TABLE tbl_sign(
ID INT PRIMARY KEY IDENTITY(1,1),
FULL_NAME VARCHAR(50),
EMAIL VARCHAR(50),
PHONE VARCHAR(20),
USERNAME VARCHAR(20),
PASSWORD VARCHAR(20)
)

SELECT * FROM tbl_sign; 

CREATE PROC signup_insert(
@FULL_NAME VARCHAR(50) = NULL,
@EMAIL VARCHAR(50) = NULL,
@PHONE VARCHAR(20) = NULL,
@USERNAME VARCHAR(20) = NULL,
@PASSWORD VARCHAR(20) = NULL
)

AS 
BEGIN

INSERT INTO tbl_sign([FULL_NAME], [EMAIL], [PHONE], [USERNAME], [PASSWORD])
VALUES(
@FULL_NAME,
@EMAIL,
@PHONE,
@USERNAME,
@PASSWORD)
END;

SELECT * FROM tbl_sign;
