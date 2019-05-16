CREATE proc update_sanpham
( @mahk int, @malhk int, @tensp nvarchar(100), @hinh varchar(300), @ngay date, @gia money, @mota ntext)
as
begin
if(@hinh != '')
 update HOAKIENG set MaLHK = @malhk, TenHK = @tensp, HinhHK = @hinh, NgayCapNhat = GETDATE(), DonGia = @gia, MoTa = @mota where MaHK=@mahk
 else
 update HOAKIENG set MaLHK = @malhk, TenHK = @tensp, NgayCapNhat = GETDATE(), DonGia = @gia, MoTa = @mota where MaHK=@mahk
end