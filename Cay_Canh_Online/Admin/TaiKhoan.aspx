<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="TaiKhoan.aspx.cs" Inherits="Admin_TaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h2>DANH SÁCH TÀI KHOẢN</h2>
    <a href="ThemTK.aspx">Thêm mới</a>
    <asp:GridView ID="GvTaiKhoan" CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="MaTK"    GridLines="None"  CellSpacing="10" CellPadding="1" HorizontalAlign="Center" Width="100%"  PageSize="5" OnPageIndexChanging="GvTaiKhoan_PageIndexChanging" OnRowDataBound="GvTaiKhoan_RowDataBound" OnSelectedIndexChanging="GvTaiKhoan_SelectedIndexChanging" OnRowDeleting="GvTaiKhoan_RowDeleting" >
        <Columns>
           
            <asp:BoundField DataField="MaTK" HeaderText="Mã tài khoản" Visible="False" />
            <asp:BoundField DataField="HoTenAD" HeaderText="Họ tên" />
            <asp:BoundField DataField="Email" HeaderText="Tài khoản" />
            <asp:TemplateField HeaderText="Mật khẩu" Visible="False">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("matKhau") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField  HeaderText="Công Cụ" ShowSelectButton="True" ShowDeleteButton="True" DeleteText="Xóa" SelectText="Chọn"  >
            <ControlStyle CssClass="vach" />
            <HeaderStyle HorizontalAlign="Center" Width="50px" />
            <ItemStyle Wrap="True" />
            </asp:CommandField>
        </Columns>
       
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="Trước" LastPageText="Sau" /> 
       
    </asp:GridView>
</asp:Content>

