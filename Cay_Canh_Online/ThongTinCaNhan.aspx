<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ThongTinCaNhan.aspx.cs" Inherits="ThongTinCaNhan" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta charset="utf-8" />
<title>Vườn cây cảnh The Moon</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="/obajuCSS/css/font-awesome.css" rel="stylesheet"/>
<link href="../templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/orman.css" type="text/css" media="screen" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
<link href="../obajuCSS/css/animate.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link href="obajuCSS/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
<style type="text/css">
    .information, .success, .error, .warning, .tip, .secure, .message, .download, .purchase, .print, .edit, .undconst, .register, .wait {
            /*margin: 20px 50px;*/
            width: 100%;
            padding: 10px;
            -webkit-border-radius: 15px;
            -moz-border-radius: 15px;
            border-radius: 15px;
            -moz-box-shadow: 4px 3px 5px rgba(000,000,000,0.5), inset 0px 0px 10px rgba(46,46,46,0.4);
            -webkit-box-shadow: 4px 3px 5px rgba(000,000,000,0.5), inset 0px 0px 10px rgba(46,46,46,0.4);
            box-shadow: 4px 3px 5px rgba(000,000,000,0.5), inset 0px 0px 10px rgba(46,46,46,0.4);
            /* Un comment any BORDER CSS line to use the style; */
            border: 3px dashed;
            /*border: 3px solid ;*/
            /*border: 3px dotted ; */
        }

        /*Notification Boxes Properties*/
        .information {
            border-color: #0e7fad;
            color: #0e7fad;
            background: #c0e9fa url("../img/info.png") no-repeat;
            background-position: 30px 20px;
        }

            .information h4 {
                margin: 5px 5px 5px 80px;
                padding: 0;
                font-size: 18px;
                width: 100%;
            }

            .information p {
                font-size: 14px;
                color: #434E54;
                margin: 5px 5px 5px 80px;
            }
            .box
        {
            position: relative;
        top: 0px;
        left: 0px;
    }
    .h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
    font-family: inherit;
    font-weight: 500;
    line-height: 1.1;
    color: white;
}
    .faqs p{
        color: black;
    }
    .theme-orman.slider-wrapper {
	margin-top: 10px;
	background: url(../images/templatemo_sliderbg.png) no-repeat;
	width: 980px;
	height: 360px;
	padding: 10px 10px 53px 10px;
	position:relative;
}
#info_user {
    float: right;
    margin-top: -42px;
}
  #templatemo_menu { clear: both; padding: 10px; width: 980px; height: 50px; background: url(images/templatemo_menu.png)}
   .sidebar_box h3 {font-size: 14px;font-weight: 700;padding: 0 10px 0 10px;margin: 0;width: 250px;height: 44px;line-height: 44px;margin-bottom: 0;background: url(images/templatemo_sbheader.png)  no-repeat;color: #fff;}
#templatemo_search .txt_field {
	float: left;
	display: block;
	height: 20px;
	line-height: 20px;
	width: 180px;
	color: #333;
	font-size: 12px;
	padding: 14px;
	font-variant: normal;
	border: none;
	background: none;
}
#content h2{
    letter-spacing: 0px;
    color: beige;
}
.search-form {
    margin-top: -32px;
    margin-left: 10px;
}
a {
    color: #337ab7;
    text-decoration: none;
    font-size: 19px;
}
.h4, h4 {
    font-size: 18px;
    color: bisque;
}
.modal-body {
    position: relative;
    padding: 25px;
}
    .table#GridView_GioHang{
        background-color: #f5f5f5;
    }
    .header_home{
        height: 270px;
    }
    #info_user {
    float: right;
    margin-top: -42px;
}
    #templatemo_search .txt_field {
	float: left;
	display: block;
	height: 20px;
	line-height: 20px;
	width: 180px;
	color: #333;
	font-size: 12px;
	padding: 14px;
	font-variant: normal;
	border: none;
	background: none;
}
.col-md-9 {
    width: 100%;
    padding-left: 0 !important;
    padding-right: 186px !important;
}
.container{
    padding-bottom: 20px;
}
.box h1{
    text-align:center !important;
}
</style>
<script type="text/javascript">
    ddsmoothmenu.init({
        mainmenuid: "templatemo_menu", //menu DIV id
        orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
        classname: 'ddsmoothmenu', //class added to menu's outer DIV
        //customtheme: ["#1c5a80", "#18374a"],
        contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
    })

    function clearText(field) {
        if (field.defaultValue == field.value) field.value = '';
        else if (field.value == '') field.value = field.defaultValue;
    }

</script>
<link rel="stylesheet" href="css/slimbox2.css" type="text/css" media="screen" /> 
<script type="text/JavaScript" src="js/slimbox2.js"></script> 
</head>
<body>
    <form runat="server">

    <div id="templatemo_wrapper_h">
<div id="templatemo_header_wh">
	<div id="templatemo_header" class="header_home">
        <div class="logo_home">
            <a href="Home.aspx">
                <img src="../images/logo.png" />
            </a>
        </div>
        <div id="hotlinetop" style="display: block;">
				<label>Hotline: </label>0985 010 406 -  02439 190 190	
            <div id="lang2">
                <div class="navbar-buttons">      
                    <div class="navbar-collapse collapse right" id="basket-overview">
                        <a href="Shopping_Cart.aspx" id="giohang" runat="server" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i> Giỏ hàng <span class="hidden-sm">
                        </span></a>
                    </div>
                </div> 
		    </div>
        </div>
        <div id="slogan">
			<a href="#" title=""><img src="../images/logo_slogan.png" alt=""/></a>
             <div class="search-form">
                  <div class="col-md-6 offer" data-animate="fadeInDown">
                    <div class="form-group">
                                                <div class="input-group">
                        <input type="text" runat="server" id="txtTimKiem" class="form-control" placeholder="Tìm kiếm theo tên sản phẩm..."/>
                        <span class="input-group-btn">
                            <asp:Button class="btn btn-default" runat="server" OnClick="Button1_Click" ID="Button1" Text="Tìm"></asp:Button>
                        </span>
                       
                    </div>
                        </div>
                </div>
        </div>
		</div>
        <div id="info_user">
            <asp:LinkButton ID="LinkButton_ThongTinCaNhan" OnClick="LinkButton_ThongTinCaNhan_Click" Enabled="false" runat="server"></asp:LinkButton>
            <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server"><span class="fa fa-power-off"></span></asp:LinkButton>
        </div>
        
        <div id="templatemo_menu" class="ddsmoothmenu" data-animate="fadeInDown">
            <ul>
                <li><a href="Home.aspx" class="selected">Trang chủ</a></li>
                <li><a href="GioiThieu.aspx">Giới thiệu</a></li>
                <li><a href="SanPham.aspx">Sản phẩm</a>
                    <ul>
                        <li>
                            <asp:DataList ID="dtlLoaiHK" runat="server">
                              <ItemTemplate>
                                 <h5><a href="SanPham.aspx?MaLHK=<%# Eval("MaLHK") %>"><%# Eval("TenLHK") %></a></h5>
                              </ItemTemplate>                              
                            </asp:DataList>
                        </li>
                  	</ul>
                </li>
                <li><a href="TinTuc.aspx">Tin tức</a></li>
                <li><a href="#" data-toggle="modal" data-target="#lienhe-modal">Liên hệ</a></li>
                <li>
                    <a href="#" runat="server" id="btDangNhap" data-toggle="modal" data-target="#login-modal">
                    <asp:Label ID="Label1" runat="server" Text="Đăng nhập" CssClass="text-white"></asp:Label>
                </a></li>
                <li><a href="#" id="btDangKy" runat="server" data-toggle="modal" data-target="#register-modal">
                    <asp:Label ID="Label2" runat="server" Text="Đăng ký" CssClass="text-white"></asp:Label>       
                </a></li>

            </ul>
            <br style="clear: left" />
        </div> <!-- end of templatemo_menu -->
		<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
        
        <script type="text/javascript">
            $(window).load(function () {
                $('#slider').nivoSlider({
                    controlNav: false
                });
            });
        </script>
    </div> <!-- END of header -->
</div> <!-- END of header wrapper -->
<div id="templatemo_main_wrapper">
<div id="templatemo_main">
  <div id="all">
      <div id="content">
            <div class="container">

                <%--<div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="#">Home</a>
                        </li>
                        <li>My account</li>
                    </ul>

                </div>--%>

                <div class="col-md-3">
                    <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                    <!-- /.col-md-3 -->

                    <!-- *** CUSTOMER MENU END *** -->
                </div>

                <div class="col-md-9">
                    <div class="box">
                        <h1>Tài khoản khách hàng</h1>
                       <%-- <p class="lead">Change your personal details or your password here.</p>
                        <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>--%>

                        <h3>Đổi mật khẩu</h3>


                        <div class="row">
                            <div class="col-sm-6">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="TextBox_PassNew">Mật khẩu mới</label>
                                    <asp:TextBox ID="TextBox_PassNew" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    <em class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_PassNew" runat="server" ErrorMessage="Nhập Mật khẩu" ControlToValidate="TextBox_PassNew" ValidationGroup="DoiMK"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_New" runat="server" ErrorMessage="Tối thiểu là 8 kí tự và tối đa là 20 kí tự" ControlToValidate="TextBox_PassNew" ValidationExpression="^[a-zA-Z0-9]{8,20}$" ValidationGroup="DoiMK"></asp:RegularExpressionValidator>
                                    </em>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="TextBox_PassOld">Nhập lại mật khẩu</label>
                                    <asp:TextBox ID="TextBox_PassOld" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                    <em class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_PassOld" runat="server" ErrorMessage="Nhập Mật khẩu" ControlToValidate="TextBox_PassOld" ValidationGroup="DoiMK"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox_PassNew" ControlToValidate="TextBox_PassOld" ErrorMessage="Mật khẩu không trùng khớp" ValidationGroup="DoiMK"></asp:CompareValidator>
                                    </em>
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="col-sm-12 text-center">
                            <asp:Button ID="Button_DoiMK" runat="server" OnClick="Button_DoiMK_Click" Text="Cập nhật mật khẩu" CssClass="btn btn-primary" ValidationGroup="DoiMK"  />
                        </div>


                        <hr>

                        <h3>Thông tin cá nhân</h3>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="TextBox_NameKH">Tên khách hàng</label>
                                    <asp:TextBox ID="TextBox_NameKH" runat="server" CssClass="form-control" ValidationGroup="TTCN" placeholder="Tên khách hàng"></asp:TextBox>
                                    <em class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_NameKH" runat="server" ErrorMessage="Nhập tên khách hàng" ValidationGroup="TTCN" ControlToValidate="TextBox_NameKH"></asp:RequiredFieldValidator>&ensp;
                                    </em>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="TextBox_NgaySinh">Ngày sinh</label>
                                    <asp:TextBox ID="TextBox_NgaySinh" runat="server" CssClass="form-control" placeholder="Ngày sinh" TextMode="DateTime" OnPreRender="TextBox_NgaySinh_PreRender"></asp:TextBox>
                                    <em class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_NgaySinh" runat="server" ErrorMessage="Nhập ngày sinh" ValidationGroup="TTCN" ControlToValidate="TextBox_NgaySinh"></asp:RequiredFieldValidator>
                                    </em>
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="TextBox_SDT">Số điện thoại</label>

                                    <asp:TextBox ID="TextBox_SDT" runat="server" CssClass="form-control" placeholder="Số điện thoại" TextMode="Number"></asp:TextBox>
                                    <em class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_SDT" runat="server" ErrorMessage="Nhập Mật khẩu" ControlToValidate="TextBox_SDT" ValidationGroup="TTCN"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator_SDT" runat="server" ErrorMessage="Số điện thoại gồm 10 hoặc 11 số" ControlToValidate="TextBox_SDT" ValidationExpression="\d{10,11}" ValidationGroup="TTCN"></asp:RegularExpressionValidator>
                                    </em>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="TextBox_PassDK">Giới tính</label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="True">Nam</asp:ListItem>
                                        <asp:ListItem Value="False">Nữ</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label for="TextBox_DiaChi">Địa chỉ</label>
                                    <asp:TextBox ID="TextBox_DiaChi" runat="server" CssClass="form-control" placeholder="Địa chỉ" TextMode="MultiLine"></asp:TextBox>

                                    <em class="text-danger">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_DiaChi" runat="server" ErrorMessage="Nhập Địa chỉ" ValidationGroup="TTCN" ControlToValidate="TextBox_DiaChi"></asp:RequiredFieldValidator>
                                    </em>
                                </div>
                            </div>
                            <div class="col-sm-12 text-center">
                                <%--<button type="submit" class="btn btn-primary"><i class="fa fa-save"></i>Save changes</button>--%>
                                <asp:LinkButton ID="LinkButton_TTCN" OnClick="LinkButton_TTCN_Click" runat="server" CssClass="btn btn-primary"   ValidationGroup="TTCN"><i class="fa fa-save"></i> Lưu thông tin</asp:LinkButton>

                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->
    </div>
    </div>
    <div class="cleaner"></div>
        <div class="modal fade center-block" id="lienhe-modal" tabindex="-1" role="dialog" aria-labelledby="LienHe" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="LienHe">Thông tin liên hệ</h4>
                        </div>
                        <div class="modal-body">
                            <div class="information">
                                <h4>Nếu bạn gặp khó khăn hoặc không hài lòng về dịch vụ</h4>
                                <p>Xin vui lòng gửi ý kiến đóng góp về địa chỉ email:</p>
                                <div style="margin: 15px 0; text-align: center; padding: 10px 0 11px; border-radius: 10px; font-size: 2em; background:#0000FF; color:blue; ">
                                    <b>
                                        <a class="text-success" href="mailto:trinhnu1809@gmail.com">trinhnu1809@gmail.com</a>
                                    </b>
                                </div>
                                <p>Chúng tôi luôn sẵn sàng giải quyết mọi phản ánh của các bạn một cách nhanh nhất.</p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
</div> <!-- END of main wrapper -->

<div id="templatemo_footer_wrapper">
<div id="templatemo_footer">
	<div class="footer_left">
    	<a href="#"><img src="../images/1311260370_paypal-straight.png" alt="Paypal" /></a>
        <a href="#"><img src="../images/1311260374_mastercard-straight.png" alt="Master" /></a>
        <a href="#"><img src="../images/1311260374_visa-straight.png" alt="Visa" /></a>
    </div>
	<div class="footer_right">
		<p><a href="Home.aspx">Trang chủ</a> | <a href="GioiThieu.aspx">Giới thiệu</a> | <a href="SanPham.aspx">Sản phẩm</a> | <a href="TinTuc.aspx">Tin tức</a> | <a href="#" data-toggle="modal" data-target="#lienhe-modal">Liên hệ</a></p>
        <p>Bản quyền © 2019 <a href="#">Trinh Trần</a></p>
	</div>
    <div class="cleaner"></div>
</div> <!-- END of footer -->
</div> <!-- END of footer wrapper -->
</div>
</form>
</body>
</html>
