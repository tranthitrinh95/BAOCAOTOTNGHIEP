alter PROCEDURE  SP_DangNhap1
@TenDangNhap varchar(100),
@MatKhau varchar(100)
AS
BEGIN
	DECLARE @OutPut int
	DECLARE @KiemTraTenDangNhap int
	DECLARE @KiemTraMatKhau int
	set @KiemTraTenDangNhap= (SELECT isnull(Count(tk.Email),0)
		FROM TAIKHOANAD tk
		WHERE tk.Email=@TenDangNhap)
	IF @KiemTraTenDangNhap=0
		SET @OutPut=1 -- Sai TenDangNhap
	ELSE
	BEGIN
	SET	@KiemTraMatKhau = (SELECT isnull(count(*),0)
			FROM TAIKHOANAD tk
			WHERE tk.Email=@TenDangNhap
				AND tk.MatKhau=@MatKhau)
		IF @KiemTraMatKhau=0
			SET @OutPut=2 -- Sai m?t kh?u
		ELSE
			BEGIN
				SET @OutPut=3 -- dang nhap vao admin
			END
	END
	SELECT @OutPut AS KetQua
END

alter proc TaiKhoanAdmin (@rp int, @maTK int, @hoten nvarchar(100),  @taiKhoan varchar(100), @matKhau varchar (100))
as
if(@rp=0)
insert into TAIKHOANAD(HoTenAD, Email, MatKhau) values(@hoten, @taiKhoan, @matKhau)
if(@rp=1)
update TAIKHOANAD set HoTenAD = @hoten, MatKhau= @matKhau where MaTK= @maTK
if(@rp=2)
delete TAIKHOANAD where MaTK= @maTK
