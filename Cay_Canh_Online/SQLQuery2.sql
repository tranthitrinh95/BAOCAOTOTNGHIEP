create PROCEDURE XemSanPhamTheoLHK (@Type varchar(100),@MaLHK int)

AS
BEGIN

	IF(@Type = 1)
	BEGIN
		SELECT * FROM HOAKIENG
	END
	IF(@Type = 2)
	BEGIN
		select * from HOAKIENG where MaLHK = @MaLHK
	END
END