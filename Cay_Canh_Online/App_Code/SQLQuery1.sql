alter proc httenad (
@email varchar(100)
)
as
begin
	Select HoTenAD from TAIKHOANAD where Email=@email
end

CREATE proc deleteTaiKhoan (@id int)
as
	begin
	delete from TAIKHOANAD  where MaTK=@id
	END
GO

create proc update_taikhoan
(
@ma int,
@mk varchar(100)
)
as
begin
update TAIKHOANAD set MatKhau = @mk where MaTK=@ma
end

CREATE PROC BH_TaiKhoan_1 (@hoten nvarchar(100), @taiKhoan varchar(100), @matKhau varchar(100))
AS
BEGIN
    IF RTRIM(LTRIM(@taiKhoan)) IN (SELECT Email FROM TAIKHOANAD)
	BEGIN
		select (N'Trùng tài khoản, Không thêm được!')
	END
		ELSE
	BEGIN
		Insert into TAIKHOANAD(HoTenAD, MatKhau, Email) values (@hoten, @matKhau, @taiKhoan)
	END	
END