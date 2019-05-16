CREATE proc htds_sanpham
as
select MaHK,TenHK,DonGia,HinhHK,TenLHK from HOAKIENG a,LOAIHOAKIENG b
where a.MaLHK=b.MaLHK

alter proc BH_SanPham (@malhk int, @tenhk nvarchar(100), @hinh varchar(300), @ngay date, @dongia money, @mota ntext)
as
begin
begin
if RTRIM(LTRIM( @tenhk)) not in(select TenHK from HOAKIENG)
begin
insert into HOAKIENG values(@malhk, @tenhk, @hinh, GETDATE(), @dongia, @mota )							
	select(N'Thêm thành công!')
	end
			else
				select (N'Trùng tên sản phẩm, Không thêm được!')
		end
end

GO

CREATE proc deleteSanPham (@MaSP int)
as
	begin
	DECLARE @out int
	BEGIN
	IF RTRIM(LTRIM(@MaSP)) IN (SELECT c.MaHK FROM HOAKIENG s,HOADONCT c WHERE s.MaHK=c.MaHK)
	SET @out=2
	ELSE
	BEGIN
	delete from HOAKIENG where MaHK=@MaSP 
	set @out=1
	END
	END
	select @out as 'Ket qua'
	end
GO

create proc doimatkhau ( @taikhoan varchar(100), @matkhau varchar(100))
as
begin
	update TAIKHOANAD set MatKhau = @matkhau where Email = @taikhoan
end