<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sp_ChiTietSanPham.aspx.cs" Inherits="Sp_ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/obajuCSS/css/font-awesome.css" rel="stylesheet"/>
    <script type="text/javascript">

        function openModalBinhLuan() {
            $('#register-modal').modal({ show: true });
        }
        function openModalBinhLuan() {
            $('#comment-modal').modal({ show: true });
        }
        function CloseModalBinhLuan() {
            $('#comment-modal').modal({ show: false });
        }
        function openModalDangNhap() {
            $('#login-modal').modal({ show: true });
        }
        function CloseModal() {
            $('#register-modal').modal({ show: false });
        }
        </script>
    <style type="text/css">
        .col-lg-12 {
            margin-top: 25px;
            margin-left:20px;
        }
      .col-sm-6{
          height:420px;
          
          
      }
        .product-name {
            color: black;
            
        }
         .glyphicon-shopping-cart{
            color:white;
        }
         .glyphicon-shopping-cart:hover{
            color:#66CD00;
        }
            .product-name:hover {
                text-decoration: none;
                color: red;
            }

        .show {
            -webkit-transition-duration: 0.5s; /*Webkit: Animation duration*/
            -moz-transition-duration: 0.5s; /*Mozilla duration version*/
            -o-transition-duration: 0.5s; /*Opera duration version*/
            margin: 0 10px 5px 0; /*margin between images*/
        }

            .show:hover {
                -webkit-transform: scale(1.1); /*Webkit: Scale up image to 1.2x original size*/
                -moz-transform: scale(1.1); /*Mozilla scale version*/
                -o-transform: scale(1.1); /*Opera scale version*/
            }
           .buy{
               font-weight: normal;
               font-family: "Roboto", Helvetica, Arial, sans-serif;
               padding: 6px 12px;
               font-size: 14px;
               line-height: 1.42857143;
               border-radius: 3px;   
           }
           .buy:hover{
                
                color: #ffffff;
                background-color: #4fbfa8;
                border-color: #41b39c;
           }

           .comment{
               font-weight: normal;
               font-family: "Roboto", Helvetica, Arial, sans-serif;
               padding: 6px 12px;
               font-size: 14px;
               line-height: 1.42857143;
               border-radius: 3px;   
           }
           .comment:hover{
                
                color: #ffffff;
                background-color: #4fbfa8;
                border-color: #41b39c;
           }
           .line{           
            color:#F7931E;
             
        }
        img-responsive {
            width:100%;
            height:auto;
        }
    </style>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>
    <script src="../obajuCSS/js/bootstrap.min.js"></script>
<script>

    jQuery(function ($) {
        $('.buy').click(function () {
            var str = $(this).attr('data');

            $.ajax({
                type: "get",
                url: "Shopping_Cart.aspx",
                data: 'MaHK=' + str,
                contentType: "application/json; charset=utf-8",
                success: function () { // Required Callback Function
                    $.notify("Thêm Thành Công!", { autoHideDelay: 1000, className: 'success' });
                },
                error: function () {
                    $.notify("Thêm Thất Bại!", { autoHideDelay: 1000 });
                }
            });
        });
    });
</script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      	    <div id="all">
            <div class="container">
                <div class="col-md-9">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="row" id="productMain">
                                <div class="col-sm-6">
                                    <div id="mainImage">
                                        <asp:Image ID="Image_img1" runat="server" ImageUrl='<%# "~/images/HINH-SP/" + Eval("HinhHK") %>' CssClass="img-responsive" Width="100%" />
                                    </div>
                                </div>
                                <div class="box">
                                        <p class="text-center">
                                            <asp:Label ID="Label_SanPham" runat="server" Font-Size="20" Text='<%# Eval("TenHK") %>' ForeColor="White"></asp:Label></p>
                                        <p class="price">
                                            Giá bán:
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("DonGia","{0:0,##0}")+"VNĐ"%>'></asp:Label>
                                        </p>
                                 </div>
                                <div class="box" id="details">
                                <h4>Thông tin chi tiết</h4> 
                                <p style="color: white;">
                                    <asp:Label ID="Label_ChiTiet" runat="server" Text='<%# Eval("MoTa") %>' ForeColor="White"></asp:Label>
                                </p>
                            </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Repeater ID="Repeater_CTSP" runat="server">
                        <ItemTemplate>
                            <div class="row" id="productMain">
                                <div class="col-sm-6">
                                    <div id="mainImage">
                                        <asp:Image ID="Image_img1" runat="server" ImageUrl='<%# "~/images/HINH-SP/" + Eval("HinhHK") %>' CssClass="img-responsive" Width="100%" />
                                    </div>
                                </div>
                                <div class="box">
                                        <p class="text-center">
                                            <asp:Label ID="Label_SanPham" runat="server" Font-Size="20" Text='<%# Eval("TenHK") %>' ForeColor="White"></asp:Label></p>
                                        <p class="price">
                                            Giá bán:
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("DonGia","{0:0,##0}")+"VNĐ"%>'></asp:Label>
                                        </p>
                                        <p class="text-center buttons">
                                               <button type="button" runat="server" id="btGioHang" class="buy" data='<%# Eval("MaHK") %>'>
                                    <span class="fa fa-shopping-cart"></span> Thêm vào giỏ hàng
                                </button>
                                            <button type="button" data-toggle="modal" data-target="#comment-modal" class="comment" runat="server">
                                    <span class="fa fa-comments-o"></span> Bình luận của bạn
                                </button>
                                        </p>
                                 </div>
                                <div class="box" id="details">
                                <h4>Thông tin chi tiết</h4> 
                                <p>
                                    <asp:Label ID="Label_ChiTiet" runat="server" Text='<%# Eval("MoTa") %>' ForeColor="White"></asp:Label>
                                </p>
                            </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="box" id="details">
                        <div class="social">
                            <h4>Bình luận gần đây</h4>
                                <asp:DataList ID="ddlBinhLuan" runat="server">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("HoTenKH") %>' style="color: #0000FF"></asp:Label>
                                            :
                                        <asp:Label ID="Label8" runat="server"  Text='<%# (Eval("BinhLuan").ToString()).Replace("\n","<br>") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:DataList>
                        </div>
                    </div>
                    <div class="modal fade center-block" id="comment-modal" tabindex="-1" role="dialog" aria-labelledby="LienHe" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="Comment"></h4>
                        </div>
                        <div class="modal-body">
                             <div class="box">
                                <div>
                                    <div class="container">
                                            <div class="col-md-6" runat="server" id="fdangnhap">
                                             <div class="box1">
                                                 <h1 style="color: #000000">Bình luận của bạn</h1>
                                            <div class="form-group">
                                                <asp:TextBox id="txtNoiDung" runat="server" TextMode="MultiLine" Width="650px" Height="70px" class="form-control" placeholder="Nhập bình luận của bạn.."></asp:TextBox>
                                            </div>
                                            <div class="text-center">
                                                <asp:LinkButton ID="LinkButton_Gui" OnClick="LinkButton_Gui_Click" CssClass="btn btn-primary" runat="server" ><i class="fa fa-sign-in"></i> Gửi bình luận</asp:LinkButton>
                                            </div>
                                                 </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
                    <!-- /.col-md-9 -->
                </div>
                <!-- /.container -->
            </div>
            <!-- /#content -->

        </div>
    <div class="cleaner"></div>
</asp:Content>

