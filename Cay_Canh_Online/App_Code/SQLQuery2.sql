USE [QLYHOAKIENG]
GO
/****** Object:  StoredProcedure [dbo].[BH_TaiKhoan]    Script Date: 05/03/2019 13:47:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[BH_TaiKhoan]
(
	@rq int,@id int,@type int, @hoten nvarchar(100), @matKhau varchar(100), @taiKhoan varchar(100)
)
AS
BEGIN
	IF @rq=0
		BEGIN
			DECLARE @out int
			IF @type = 1
			BEGIN
				IF RTRIM(LTRIM(@taiKhoan)) IN (SELECT
              Email
            FROM TAIKHOANAD)
            SET @out = 4
			ELSE
				IF RTRIM(LTRIM(@taiKhoan)) NOT IN (SELECT
              Email
            FROM TAIKHOANAD)
				BEGIN
					Insert into TAIKHOANAD(HoTenAD, MatKhau, Email) values (@hoten, @matKhau, @taiKhoan)
					set @out=1
				END
			END
	END	
		SELECT @out AS 'KetQua'
END

exec BH_TaiKhoan 0, 0, 1,'a', '123', 'trinhnu1809@gmail.com'