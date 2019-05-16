create proc SP_TinTuc
(
	@rq int,@id int,@type int,@MaBD int,@tenBD nvarchar(500), @ngay date, @noidung ntext
)
AS
BEGIN
	IF @rq=0
		BEGIN
			DECLARE @out int
			IF @type = 1
			BEGIN
				IF RTRIM(LTRIM(@tenBD)) IN (SELECT
              TenBD
            FROM BAIDANG)
            SET @out = 0
			ELSE
				IF RTRIM(LTRIM(@tenBD)) NOT IN (SELECT
              TenBD
            FROM BAIDANG)
				BEGIN
					INSERT INTO BAIDANG VALUES (@tenBD, GETDATE(), @noidung)
					set @out=1
				END
			END
		
		END	
	IF @rq=1
		BEGIN
			IF @type = 2
			BEGIN
			UPDATE BAIDANG SET NoiDung = @noidung Where MaBD=@MaBD
			SELECT
			(N'Sửa thành công')
			END
		END
	IF @rq=2
		BEGIN
			Delete BAIDANG where MaBD = @MaBD
		END
		SELECT @out AS 'KetQua'
END

exec SP_TinTuc 0, 0, 1, '', N'Trồng ngay cây lan quân tử để tránh xui xẻo hoạn nạn, đón quý nhân phù trợ', '2019/04/26', 'abc'