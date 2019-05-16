<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="HoaDon.aspx.cs" Inherits="Admin_HoaDon" %>

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
           .box {
            position: relative;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>DANH SÁCH HÓA ĐƠN</h2>
    <asp:CheckBox ID="CkDuyet" Visible="false" runat="server" />
    <%--<a href="#" data-toggle="modal" data-target="#Bill-modal">Cập nhật hóa đơn</a>--%>
    <asp:GridView ID="GvHoaDon" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="MaHD"    GridLines="None"  CellSpacing="10" CellPadding="1" HorizontalAlign="Center" Width="100%"  PageSize="5" OnSelectedIndexChanging="GvHoaDon_SelectedIndexChanging" OnRowDataBound="GvHoaDon_RowDataBound" OnRowDeleting="GvHoaDon_RowDeleting" OnPageIndexChanging="GvHoaDon_PageIndexChanging"  >
        <Columns>
            <asp:BoundField DataField="MaHD" HeaderText="Mã Hóa Đơn"  ReadOnly="True" SortExpression="MaHD" >
            </asp:BoundField>
            <asp:TemplateField HeaderText="Ngày lập">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "NgayLap", "{0:MM/dd/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tổng tiền">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("TriGia","{0:#,##0 VNĐ}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Người gửi" Visible="False" />
            <asp:BoundField HeaderText="Người nhận" Visible="False" />
            <asp:BoundField HeaderText="Địa chỉ nhận" Visible="False" />
            <asp:BoundField HeaderText="Số điện thoại nhận" Visible="False" />
            <asp:BoundField HeaderText="Trạng thái" Visible="False" />
            <asp:TemplateField HeaderText="Duyệt hóa đơn" InsertVisible="False" Visible="False">
                <ItemTemplate>
                    <asp:CheckBox ID="CkDuyetHD" runat="server" Checked='<%# Eval("DuyetHD") %>' Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField DeleteText="Xóa" HeaderText="Công cụ" SelectText="Chọn" ShowDeleteButton="True" ShowSelectButton="True" />
        </Columns>
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="Trước" LastPageText="Sau" /> 
    </asp:GridView>
    <%--<div class="modal fade center-block" id="Bill-modal" tabindex="-1" role="dialog" aria-labelledby="HoaDon" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="Bill"></h4>
                        </div>
                        <div class="modal-body">
                             <div class="box">
                                <div>
                                    <div class="container">
                                        <div class="col-md-6" runat="server" id="fdangnhap">
                                             <div class="box">
                                                 <h1>Cập nhật hóa đơn</h1>
                                            <div class="form-group">
                                                Mã hóa đơn: <asp:DropDownList ID="ddlMaHD" runat="server"></asp:DropDownList>
                                                <span class="text-danger">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_NoiDung" runat="server" ErrorMessage="Vui lòng chọn hóa đơn" ControlToValidate="ddlMaHD" Style="font-style: italic"></asp:RequiredFieldValidator>
                                                </span>
                                                <asp:CheckBox ID="CheckBox1" Text="Duyệt hóa đơn" runat="server" />
                                            </div>
                                            <div class="text-center">
                                                 <asp:LinkButton ID="LinkButton_CapNhat" CssClass="btn btn-primary" runat="server"><i class="fa fa-sign-in"></i> Cập nhật</asp:LinkButton>
                                            </div>
                                                 </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>--%>
</asp:Content>

