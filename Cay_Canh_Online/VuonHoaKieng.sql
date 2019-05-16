create table LOAIHOAKIENG
(
	MaLHK int identity(1,1) not null primary key,
	TenLHK nvarchar(100)
)

INSERT INTO LOAIHOAKIENG(TenLHK) VALUES(N'CÂY TRONG NHÀ')
INSERT INTO LOAIHOAKIENG(TenLHK) VALUES(N'CÂY VĂN PHÒNG')
INSERT INTO LOAIHOAKIENG(TenLHK) VALUES(N'CÂY PHONG THỦY ')
INSERT INTO LOAIHOAKIENG(TenLHK) VALUES(N'CÂY KIỂNG')
INSERT INTO LOAIHOAKIENG(TenLHK) VALUES(N'CÂY CÔNG TRÌNH')


DROP TABLE LOAIHOAKIENG

create table BAIDANG
(
	MaBD int identity(1,1) not null primary key,
	TenBD ntext,
	HinhBD varchar(400),
	NgayDang date,
	NoiDung ntext
)

INSERT INTO BAIDANG(TenBD,HinhBD,NgayDang, NoiDung) VALUES(N'Trồng ngay cây lan quân tử để tránh xui xẻo hoạn nạn, đón quý nhân phù trợ','1.jpg','05/01/2019',N'Cây lan quân tử và hoa lan nói chung đều thể hiện sự đầm ấm, vương giả, phú quý, đủ đầy, thịnh vượng và trường tồn.')
INSERT INTO BAIDANG(TenBD,HinhBD,NgayDang, NoiDung) VALUES(N'6 loại cây chứa độc tố thường được trồng làm cảnh','2.jpg','03/22/2019',N'Trúc đào, thầu dầu, ngô đồng hay huỳnh anh là những loại cây thường được trồng làm cảnh trong các trường học nhưng lại chứa chất độc gây hại cho con...')
INSERT INTO BAIDANG(TenBD,HinhBD,NgayDang, NoiDung) VALUES(N'Những loài cây dây leo dễ trồng cho nhà phố thêm xinh','3.1.jpg','02/18/2019','Nếu biết cách chăm sóc, những loài cây dây leo như hoàng thảo, cúc tần Ấn Độ...là điểm nhấn lý tưởng, góp phần tô điểm cho ngôi nhà bạn thêm...')
INSERT INTO BAIDANG(TenBD,HinhBD,NgayDang, NoiDung) VALUES(N'Kỳ lạ miền Tây: Tượng Phật Di Lặc hiện hình trên cây khế già','4.1.jpg','08/26/2018',N'Tượng Phật Di Lặc, Phật Quan Âm, ba ông Phúc - Lộc - Thọ lần lượt xuất hiện trên cây phát tài, cây khế ở miền Tây khiến nhiều người ngạc...')




DROP TABLE BAIDANG

create table KHACHHANG
(
	MaKH int identity(1,1) not null primary key,
	HoTenKH nvarchar(100),
	Email nvarchar(100),
	MatKhau varchar(100),
	SDT varchar(20),
	DiaChi ntext,
	NgaySinh date,
	GioiTinh bit
)

create table TAIKHOANAD(
	MaTK int identity(1,1) not null primary key,
	HoTenAD nvarchar(100),
	MatKhau varchar(100),
	Email varchar(100)
)

INSERT INTO TAIKHOANAD(HoTenAD,MatKhau,Email) VALUES(N'TRẦN THỊ TRINH','18091995','trinhnu1809@gmail.com')


create table HOAKIENG
(
	MaHK int identity(1,1) not null primary key,
	MaLHK int not null,
	TenHK nvarchar(100),
	HinhHK varchar(300),
	NgayCapNhat date,
	DonGia money,
	MoTa ntext,
	CONSTRAINT fk_ma_loai_hk
   FOREIGN KEY (MaLHK)
   REFERENCES LOAIHOAKIENG (MaLHK) 
)

INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây lưỡi hổ','cay_luoi_ho.jpg','11/12/2018',150000,N'Cây lưỡi hổ là loại cây cảnh trong nhà phù hợp với những người có bản tính trầm lặng, khoan dung độ lượng, không câu nệ tiểu tiết.Trồng cây lưỡi hổ sẽ giúp trấn giữ tiền của và làm cho con đường sự nghiệp ngày càng đi lên.Có thể đặt ở phòng khách hay phòng ngủ đều được, không những mang tài lộc vào nhà mà loại cây này còn có khả năng tiêu diệt 107 loại khí độc, rất có ích cho sức khỏe của gia chủ nữa.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây tuyết tùng','cay_tuyet_tung.jpg','02/10/2018',250000,N'Cây tuyết tùng hay còn gọi là cây bách Nhật Bản, trồng tuyết tùng giúp cung cấp độ ẩm, loại bỏ bụi bẩn và giúp không khí trong nhà luôn tươi mát.Trong phong thủy, cây tuyết tùng cũng có ý nghĩa giúp mang lại may mắn và tài lộc, xua đuổi những điều không may cho người trồng. Và tốt nhất thì nên đặt tuyết tùng ở những vị trí thoáng mát, nhiều ánh sáng như trước cửa hay ngoài sân, cây có tươi tốt thì mới mang lại sinh khí tốt cho căn nhà được. Về hướng đặt cây thì nên ưu tiên hướng Nam.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây sống đời','cay_day_nhen.jpg','11/12/2018',150000,N'Cây sống đời là loại cây cảnh trong nhà phù hợp để đặt ở những vị trí như góc phòng, bàn học, bàn làm việc, bàn phòng khách hay cũng có thể để các vị trí như ban công, cửa sổ, trên các lọai giá kệ như kệ sách, kệ ti vi hay kệ trang trí ở các cửa hàng, quán nước. Màu vàng ở cây sống đời sẽ giúp khai minh trí tuệ, đầu óc minh mẫn, tăng cường tính lạc quan hơn. ')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây quýt','cay_quyt.jpg','11/12/2018',350000,N'Cây quýt luôn tỏa ra một mùi hương vô cùng dễ chịu, trồng trong nhà không những giúp thư giãn mà cây cũng có khả năng hút ẩm tốt, lá cây chứa một lượng lớn các chất chữa bệnh, diệt khuẩn cho môi trường sống gần nơi đặt cây.Theo phong thủy, mùi hương dịu ngọt cũng như năng lượng dương mang lại trong sắc cam của những loại cây này sẽ giúp tránh được những điều xui xẻo, mang lại thịnh vượng. ')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây lan ý','cay_lan-y.jpg','11/12/2018',280000,N'Cây lan ý là loại cây cảnh trong nhà có thể được đặt ở nhiều vị trí khác nhau. Với những chậu cây nhỏ xinh thì có thể đặt ở bàn làm việc, bàn tiếp tân hay kệ sách, bàn ăn,… giúp mang lại vẻ tươi trẻ, tạo không khí mới mẻ, thư giãn giúp cho công việc và học tập hiệu quả hơn.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây dây nhện','cay_day_nhen.jpg','11/12/2018',190000,N'rong đời sống, cây dây nhện có khả năng hấp thụ nhanh các chất độc từ không khí như Carbon monoxide, Formaldehyde, Styrene, Nicotin từ thuốc lá và xăng; nó cũng có thể chuyển hóa chất gây ung thư Aldehyde formic trong không khí thành đường và amoni acid.Trong phong thủy, cây dây nhện mang ý nghĩa của sự may mắn. Khi đặt cây trong nhà, các thành viên cũng vui vẻ, khỏe mạnh hơn, giúp mang lại sự tỉnh táo, minh mẫn để làm việc và học tập.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây hương đào','cay-huong-dao.jpg','11/12/2018',190000,N'Cây hương đào là sự lựa chọn để đặt trên bàn làm việc, trong phòng khách hay tốt nhất là ở phòng ngủ. Bởi cây có khả năng thanh lọc không khí, loại bỏ bụi bẩn và một số loại khí độc.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây nguyệt quế','cay_nguyet_que.jpg','11/12/2018',190000,N'Cây nguyệt quế là loại cây vinh danh cho sự chiến thắng. Là loài cây được sinh ra từ tình yêu của sự tinh khiết, là biểu tượng dành cho sự chiến thắng và những người khát khao chiến thắng mãnh liệt.Cây nguyệt quế còn có ý nghĩa trừ ma, ngăn chặn những điều xui xẻo, những điều xấu đến với gia đình. Cây nguyệt quế để trồng trước sân nhà phù hợp với phong thủy hoặc đặt ở trong nhà, trên bàn cũng mang lại khí tốt.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây thường xuân','cay_thuong_xuan.jpg','11/12/2018',190000,N'Là loài cây cảnh trong nhà có bộ máy lọc không khí hoàn hảo nhất được NASA đánh giá, nên trồng trong nhà giúp làm sạch không khí, cuộc sống chất lượng hơn. Cây cũng có sức sống vô cùng mãnh liệt, ngay cả trong thời tiết giá rét.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây trầu bà','cay_trau_ba.jpg','11/12/2018',190000,N'Cây trầu bà tượng trưng cho sức khỏe dẻo dai, tuổi thọ; là hình ảnh cho sự vươn lên không ngừng nghỉ, sự may mắn và bình an. Không những thế, trầu bà cũng có khả năng loại bỏ các từ tính từ điện thoại, máy tính, làm sạch không khí.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây dương xỉ','cay_duong_si.jpg','11/12/2018',190000,N'Cây dương xỉ mang lại sự giàu có cho gia chủ. Nên nếu có trồng một chậu dương xỉ, hãy chôn thêm 9 đồng xu ở dưới cây và đặt ở góc trái, xa nhất của ngôi nhà.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(1,N'Cây vạn niên thanh','cay_van_nien_thanh.jpg','11/12/2018',190000,N'Cây vạn niên thanh hiện nay được sử dụng rộng rãi và phổ biến trong trang trí nội thất, thiết kế tiểu cảnh sân vườn bởi nó mang ý nghĩa may mắn cho người trưng. Trong phong thủy, cây vạn niên thanh chứng tỏ người trồng là một người có đầu óc khoa học, yêu ghét phân minh. Thích hợp nhất cho những người hoạt động kinh doanh, đầu tư.')



INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(2,N'Cây Kim Phát Tài','cay_phat_loc_hoa.jpg','05/05/2018',190000,N' Loài cây này nhỏ nhưng thân khỏe. Lá cây trơn tru mang vẻ tươi mới. Nếu như cây càng sống lâu vậy thì chúng cho thấy được công ty có xu hướng phát triển. Cây này có khả năng lọc không khí rất tốt, đặc biệt có tính phong thủy cao, cây này thường được đặt ở các góc nhỏ trong văn phòng. đặt ở bàn làm việc hoặc hành lang đi lại.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(2,N'Cây ngọc bích','cay-ngoc-bich-1','05/05/2018',190000,N'Cây Ngọc Bích chính là một trong số những loài cây đem lại tiền tài tốt nhất. Cây mang trong mình dáng vẻ nhỏ bé nhưng sức sống rất mãnh liệt sống khỏe trong môi trường văn phòng, ít bị bệnh. Cây ngọc bích cây trồng văn phòng có phiến là hình bầu dục kết nối với nhau tạo thành những búp măng đẹp mắt. Nhằm giúp cây  hút được tiền tài và năng lượng.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(2,N'Cây lan ý','cay_lan_y.jpg','05/05/2018',190000,N'Loài cây có thể thanh lọc được bầu không khí. Đồng thời có thể giải được các độc tố từ sóng điện từ, tia tử ngoại phát ra từ thiết bị điện tử. Cây này thường đặt ở hành lang, đặt ở nối đi lại ít đặt ở bàn làm việc.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(2,N'Cây thiết mộc lan','cay_thiet_moc_lan.jpg','05/05/2018',190000,N'Thiết Mộc Lan mang trong mình quan điểm phong thủy rất hoàn thiện. Ví dụ khi cây có 2 nhánh mang ý nghĩa về tình duyên, 3 nhánh mang lại sự hạnh phúc. Còn cây 5 nhánh mang đến sức khỏe, 8 nhánh thì về tài lộc và 9 nhánh thì về thời vận. ')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(2,N'Cây tiểu hồng môn','cay_tieu_hong_mon.jpg','05/05/2018',190000,N'Cây tiểu hồng môn là loại cây có hoa đỏ, dễ trồng, dễ chăm sóc cây có khả năng lọc sạch không khí rất tốt, cây còn mang tính phong thủy cao.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(2,N'Cây bao thanh thiên','cay_bao_thanh_thien.jpg','05/05/2018',190000,N'Xếp ở vị trí thứ 5 trong Top 20 cây cảnh văn phòng tốt nhất chính là cây Bao Thanh Thiên. Loài cây này thể hiện sự thanh cao, chính trực, ngay thẳng và quý phái. Theo quan niệm phong thủy loài cây này có tác dụng trừ tà, loại bỏ khí âm, bảo vệ vận khí và xua đuổi vận đen. Cây phù hợp với phòng nhân sự, hành chính tổng hợp.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(2,N'Cây ngọc ngân','cay-ngoc-ngan_21a.jpg','05/05/2018',190000,N'Cây Ngọc Ngân hay còn được biết đến là cây Valentine. Cây sở hữu điểm nhấn là sự tương phản giữa màu sắc của lá. Nếu đặt cây ở văn phòng và bàn làm việc chúng có thể mang đến sự may mắn.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(2,N'Cây kim ngân','cay-kim-ngan-2.jpg','05/05/2018',190000,N'Loài cây này không chỉ được ưa chuộng về nét đẹp tượng trưng cho Kim, Mộc, Thủy, Hỏa, Thổ. Mà bản thân nó còn đảm bảo được ý nghĩa phong thủy tốt cho các mệnh.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(2,N'Cây Lưỡi Hổ','cay_luoi_ho.jpg','05/05/2018',190000,N'Cây Lưỡi Hổ là giống cây phong cảnh xếp ở thứ 15 trong Top 20 cây cảnh văn phòng tốt nhất. Với hình ảnh xanh mát và khỏe khoắn “ Lưỡi Hổ” giúp mọi người giảm stress rất tốt. Hoặc là cải thiện những điều xui xẻo sẽ gặp trong công việc làm ăn.')


INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(3,N'Cây kim tiền','cay-kim-tien.jpg','05/05/2018',190000,N'Loài cây phong thủy đầu tiên mà chúng tôi muốn giới thiệu đến bạn đọc chính là cây phát tài hay còn được gọi là cây kim tiền. Đây là loài cây được rất nhiều người lựa chọn. Cây phát tài với những tán lá sum suê chính là hình ảnh tượng trưng cho sự phát triển của gia chủ về kinh tế, tiền bạc. Hơn thế nữa, lá của cây phát tài còn rất đẹp, bóng, xanh mượt, tán lá cân đối.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(3,N'Cây thanh lan','cay-thanh-lan.jpg','05/05/2018',190000,N'Không phát triển tốt như thiết mộc lan nhưng thanh lan vẫn là loài cây phong thủy được không ít gia chủ lựa chọn để trang trí phòng khách. Đặc biệt, đối với các căn phòng mà có nhiều ánh sáng và nhiều kính thì thanh lan có tác dụng làm ẩm không khí, làm mát không gian trong phòng, đặc biệt đối với không gian sử dụng điều hòa thường xuyên.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(3,N'Cây tài lộc','cay-tai-loc.jpg','05/05/2018',190000,N'ên gọi đã tạo nên sự đặc biệt riêng cho loài hoa này rồi. Và đây cũng là một trong những loài cây phong thủy được khá nhiều người lựa chọn để đặt tại phòng khách của gia đình mình. Cây tài lộc với hình dáng lạ mát, thân cây uốn tết và mềm mại, chắc khỏe. Đa phần những người lựa chọn cây tài lộc theo quan niệm phong thủy vì nó giúp họ mang đến nhiều tài lộc và sự giàu sang, phú quý.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(3,N'Cây phất dụ','cay-phat-du.jpg','05/05/2018',190000,N'Ngoài tên gọi đó ra thì nó còn có tên gọi khác là cây phát tài. Theo quan điểm về phong thủy thì phất dụ giúp mang lại may mắn cho gia chủ nên được rất nhiều người lựa chọn để trang trí phòng khách. ')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(3,N'Cây Ngọc Bích','ngoc-bich.jpg','05/05/2018',190000,N'Là loài cây được trồng trong nhà. Đặc biệt, dưới nhiều điều kiện khác nhau thì cây ngọc bích có thể cho ra nhiều màu hoa khác nhau. Còn trong phong thủy thì những cành lá của cây ngọc bích tượng trưng cho tài sản, cho tiền bạc. Và cây ra hoa là hình ảnh tượng trưng cho sự giàu sang và no ấm.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(3,N'Cây phát lộc hoa','cay-phat-loc-hoa.jpg','05/05/2018',190000,N'Là loài cây khá mới nhưng trong thời gian gần đây thì cây phát lộc hoa cũng là một trong những loài cây phong thủy được khá nhiều người ưa chuộng. Bởi loài cây này cho màu sắc đẹp, giúp không gian phòng khách trở nên tươi mới và hơn hết là chúng còn mang lại nhiều tài lộc và may mắn cho gia chủ nữa.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(3,N'Cây cafe','cafe.jpg','05/05/2018',190000,N'Có tác dụng hút ẩm, tạo ra mùi thơm dễ chịu khi trổ bông')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(3,N'Cây ngũ gia bì','cay-ngu-gia-bi.jpg','05/05/2018',190000,N'Có tác dụng phong thủy phát triển mạnh hơn về tài chính và quản lí tài chính sáng suốt')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(3,N'Cây hương đào','cay-huong-dao.jpg','05/05/2018',190000,N'Còn được gọi là cây sim, trước đây ít được chú ý nhưng hiện nay được trồng nhiều làm cây cảnh để bàn có tác dụng lọc không khí rất tốt')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(3,N'Hoa trạng nguyên','hoa-trang-nguyen.jpg','05/05/2018',190000,N'Có tác dụng phong thủy mang đến thành công, đỗ đạt')


INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(4,N'Cây phát lộc','cay-phat-loc-hoa.jpg','05/05/2018',190000,N'Cây Phát Lộc hay lucky bamboo là loại cây cảnh  phổ biến được dùng làm cây để bàn, cây văn phòng, trang trí nhà. Theo phong thủy cây Phát Lộc sẽ mang lại sự may mắn, phát đạt, vận mệnh, đặc biệt khi được người khác trao tặng.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(4,N'Cây cảnh Trúc Mây','15.jpg','05/05/2018',190000,N'Cây cảnh Trúc Mây là một trong những cây xanh văn phòng cải thiện không khí tốt nhất. Cây trúc mây có tác dụng lọc ammonia , formaldehyde chỉ sau thiết mộc lan. Với giá thành vừa phải nó thực sự là một loài cây trang trí nội thất rất tuyệt vời.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(4,N'Cây nho cảnh','nho-canh.jpg','05/05/2018',190000,N'Nếu bạn muốn thay đổi những loại cây trồng mới trong nhà, nho cảnh lvy chính là sự lựa chọn mà bạn không nên bỏ qua. Loại cây này vừa làm đẹp khuôn viên gia đình vừa có nho để ăn. ')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(4,N'Hoa đỗ quyên','do-quyen2.jpg','05/05/2018',190000,N'Hoa đỗ quyên rất đặc biệt, từ khi đâm nụ cho đến lúc nở hoa kéo dài tới 7 tháng trời. Khi nở, mỗi nụ sẽ bung ra 18 bông hoa to như miệng chiếc bát tô, nhìn đẹp như quả tú cầu. Ngoài vẻ đẹp từ thân, dáng, hoa, đỗ quyên còn có ý nghĩa đem lại cuộc sống thịnh vượng cho gia chủ.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(4,N'Kim ngân lượng','kim-ngan-luong.jpg','05/05/2018',190000,N'Kim ngân lượng có những chùm quả đỏ xum xuê, đẹp mắt... vốn là biểu tượng của vượng khí, tài lộc, vì thế, chậu cây thường được những người làm kinh doanh mua về đặt trong phòng khách.')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(4,N'Cây cọ','cay-co.jpg','05/05/2018',190000,N'Trong phong thủy thì cây cọ có tác dụng sinh tài, giữ của. Vì thế, rất nhiều nhà mua về để ở các lối đi vào nhà, vừa tạo cảnh quan vừa có ý sinh tài, hộ tài.')


INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(5,N'Cây tùng tháp','cay-tung-thap.jpg','05/05/2018',190000,N'Cây tùng tháp là biểu trưng cho ý chí nghị lực,đức tính nghị lực của con người')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(5,N'Cây vạn tuế','cay-van-tue.jpg','05/05/2018',190000,N'Là cây xanh được ưa chuộng nhiều nhất cho công trình cây xanh công cộng')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(5,N'Cây hồng nam','cay-hong-nam.jpg','05/05/2018',190.000,N'Là cây xanh được ưa chuộng nhiều nhất cho công trình cây xanh công cộng')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(5,N'Cây nhội','cay-nhoi.jpg','05/05/2018',190000,N'Là cây xanh được ưa chuộng nhiều nhất cho công trình cây xanh công cộng')
INSERT INTO HOAKIENG(MaLHK,TenHK,HinhHK,NgayCapNhat,DonGia,MoTa) VALUES(5,N'Cây ngâu tròn','cay-ngau-tron.jpg','05/05/2018',190000,N'Là cây xanh được ưa chuộng nhiều nhất cho công trình cây xanh công cộng')






create table PHANHOIBL(
	MaBL int identity(1,1) not null primary key,
	MaKH int not null,
	MaHK int not null,
	BinhLuan ntext,
	CONSTRAINT fk_ma_kh
   FOREIGN KEY (MaKH)
   REFERENCES KHACHHANG (MaKH) ,
   CONSTRAINT fk_ma_hk
   FOREIGN KEY (MaHK)
   REFERENCES HOAKIENG (MaHK)
)

create table HOADON(
	MaHD int identity(1,1) not null primary key,
	MaKH int not null,
	NgayLap date,
	NgayGiao date,
	HoTenNguoiNhan nvarchar(100),
	SDTNguoiNhan varchar(20),
	DiaChiNguoiNhan ntext,
	TriGia money,
	TrangThai nvarchar(100),
	DuyetHD bit,
	CONSTRAINT fk_ma_kh_hd
	FOREIGN KEY (MaKH)
	REFERENCES KHACHHANG (MaKH)
)

create table HOADONCT(
	MaHD int not null,
	MaHK int not null,
	SoLuong int,
	DonGia money,
	ThanhTien money,
	CONSTRAINT hoadonct_pk PRIMARY KEY (MaHD, MaHK),
	CONSTRAINT fk_ma_hd
	FOREIGN KEY (MaHD)
	REFERENCES HOADON (MaHD),
	CONSTRAINT fk_ma_hk_hdct
	FOREIGN KEY (MaHK)
	REFERENCES HOAKIENG (MaHK)
)

create  PROC A_GETMETAPROC_SP1

	@V_PROCNAME NVARCHAR(50)
AS
begin

	SELECT P.ORDINAL_POSITION, P.PARAMETER_NAME, P.DATA_TYPE FROM INFORMATION_SCHEMA.PARAMETERS P WHERE P.SPECIFIC_NAME =@V_PROCNAME ORDER BY P.ORDINAL_POSITION;
end
