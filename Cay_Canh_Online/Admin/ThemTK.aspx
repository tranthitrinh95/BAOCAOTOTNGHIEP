<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ThemTK.aspx.cs" Inherits="Admin_ThemTK" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
     <div class="form-group">
        <asp:Label ID="Label1" runat="server" CssClass="control-label col-md-2" Text="Họ tên nhân viên: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Vui lòng nhập họ tên !">(*)</asp:RequiredFieldValidator>
            </div>
        </div>
    <div class="form-group">
        <asp:Label ID="Label4" runat="server" CssClass="control-label col-md-2" Text="Tài khoản: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtTaiKhoan" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTaiKhoan" ErrorMessage="Vui lòng nhập tài khoản !">(*)</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
        <asp:Label ID="Label5" runat="server" CssClass="control-label col-md-2" Text="Mật khẩu: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtMatKhau" ErrorMessage="Vui lòng nhập mật khẩu !">(*)</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <input type="button" id="btThem" value="Thêm mới" runat="server" onserverclick="btThem_ServerClick"   class="btn btn-default" />
                 <a href="TaiKhoan.aspx">Quay lại</a>
            </div>
        </div>
    </div>
<div>
   
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
   
</div>
</asp:Content>

