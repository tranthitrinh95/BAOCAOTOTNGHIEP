<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .col-lg-12 {
            margin-top: 25px;
            margin-left:20px;
        }
      .col-sm-6{
          height:500px;
          
          
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

           .details{
               font-weight: normal;
               font-family: "Roboto", Helvetica, Arial, sans-serif;
               padding: 6px 12px;
               font-size: 14px;
               line-height: 1.42857143;
               border-radius: 3px;   
           }
           .details:hover{
                
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
         .line {
             color: #F7931E;
         }
    </style>
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/notify/0.4.2/notify.min.js"></script>
    
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
    <h2>Chào mừng bạn đến với vườn hoa kiểng Lê Tân</h2>
		<p> <a rel="nofollow"><strong>SẢN PHẨM MỚI</strong></a></p>
    <p>
        <asp:Label ID="Lb_thongbao" runat="server" Text="Label" Visible="False" ForeColor="White"></asp:Label>
    </p>
    <asp:Repeater ID="Repeater_SanPham_1" runat="server" >
        <ItemTemplate>
            <div class="product_box">
                <asp:HyperLink ID="Hyperlink_SP1" runat="server" NavigateUrl='<%# "~/Sp_ChiTietSanPham.aspx?MaHK=" + Eval("MaHK")%>'>
                    <asp:Image ID="Image_img1" runat="server" ImageUrl='<%# "~/images/HINH-SP/" + Eval("HinhHK")%>' Width="100%" Height="165px"/>
                </asp:HyperLink>
                <h3>
                <asp:HyperLink ID="HyperLink_SP4" runat="server" NavigateUrl='<%# "~/Sp_ChiTietSanPham.aspx?MaHK=" + Eval("MaHK") %>' Text='<%# Eval("TenHK") %>' Font-Size="Medium"></asp:HyperLink></h3>
                <p class="price">
                   <asp:Label ID="Label_Gia" runat="server" Text='<%# string.Format("{0:#,##0 VNĐ}",Eval("DonGia")) %>'></asp:Label>
                </p>
                <p>
                    <button type="button" id="btTimKiem" class="details" runat="server"> 
                            <asp:HyperLink  ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Sp_ChiTietSanPham.aspx?MaHK=" + Eval("MaHK") %>' Font-Size="Medium"><span class="fa fa-search" title="Xem chi tiết" style="color: rgba(51, 51, 51, 0.88)"></span></asp:HyperLink>                                             
                    </button>
                </p>
        </div>
        </ItemTemplate>
     </asp:Repeater>
    <asp:Repeater ID="Repeater_SanPham" runat="server" >
        <ItemTemplate>
            <div class="product_box">
                <asp:HyperLink ID="Hyperlink_SP1" runat="server" NavigateUrl='<%# "~/Sp_ChiTietSanPham.aspx?MaHK=" + Eval("MaHK")%>'>
                    <asp:Image ID="Image_img1" runat="server" ImageUrl='<%# "~/images/HINH-SP/" + Eval("HinhHK")%>' Width="100%" Height="165px"/>
                </asp:HyperLink>
                <h3>
                <asp:HyperLink ID="HyperLink_SP4" runat="server" NavigateUrl='<%# "~/Sp_ChiTietSanPham.aspx?MaHK=" + Eval("MaHK") %>' Text='<%# Eval("TenHK") %>' Font-Size="Medium"></asp:HyperLink></h3>
                <p class="price">
                   <asp:Label ID="Label_Gia" runat="server" Text='<%# string.Format("{0:#,##0 VNĐ}",Eval("DonGia")) %>'></asp:Label>
                </p>
                <p>
                    <button type="button" runat="server" id="btGioHang" class="buy" data='<%# Eval("MaHK") %>'>
                      <span class="fa fa-shopping-cart" title="Thêm giỏ hàng"></span>
                    </button>
                    <button type="button" id="btTimKiem" class="details" runat="server"> 
                            <asp:HyperLink  ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Sp_ChiTietSanPham.aspx?MaHK=" + Eval("MaHK") %>' Font-Size="Medium"><span class="fa fa-search" title="Xem chi tiết" style="color: rgba(51, 51, 51, 0.88)"></span></asp:HyperLink>                                             
                    </button>
                </p>
        </div>
        </ItemTemplate>
     </asp:Repeater>
    <!--<asp:DataList ID="dtl_SanPham" runat="server" DataKeyField="MaHK" RepeatColumns="4">
            <ItemTemplate>
                <table class="auto-style2">
                    <tr>
                        <td>
                        <asp:HyperLink ID="Hyperlink_SP1" runat="server" NavigateUrl='<%# "~/Sp_ChiTietSanPham.aspx?MaHK=" + Eval("MaHK")%>'>
                    <asp:Image ID="Image_img1" runat="server" ImageUrl='<%# "~/images/HINH-SP/" + Eval("HinhHK")%>' Width="165px" Height="165px"/>
                </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:HyperLink ID="HyperLink_SP4" runat="server" NavigateUrl='<%# "~/Sp_ChiTietSanPham.aspx?MaHK=" + Eval("MaHK") %>' Text='<%# Eval("TenHK") %>' Font-Size="Medium"></asp:HyperLink></h3>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <asp:Label ID="Label_Gia" runat="server" Text='<%# string.Format("{0:#,##0 VNĐ}",Eval("DonGia")) %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <button type="button" runat="server" id="btGioHang" class="buy" data='<%# Eval("MaHK") %>'>
                      <span class="fa fa-shopping-cart" title="Thêm giỏ hàng"></span>
                    </button>
                    <button type="button" id="btTimKiem" class="details" runat="server"> 
                            <asp:HyperLink  ID="HyperLink1" CommangName="TimKiem" runat="server" NavigateUrl='<%# "~/Sp_ChiTietSanPham.aspx?MaHK=" + Eval("MaHK") %>' Font-Size="Medium"><span class="fa fa-search" title="Xem chi tiết" style="color: rgba(51, 51, 51, 0.88)"></span></asp:HyperLink>                                             
                    </button>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>-->
     <div class="blank_box">
       <a href="#"><img src="../images/free_shipping.jpg" alt="Free Shipping" /></a>
     </div>   
</asp:Content>

