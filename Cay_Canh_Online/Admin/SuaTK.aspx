<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="SuaTK.aspx.cs" Inherits="Admin_SuaTK" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
        <div class="form-group">
        <asp:Label ID="Label1" runat="server" CssClass="control-label col-md-2" Text="Họ Tên: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Vui lòng nhập họ tên !">(*)</asp:RequiredFieldValidator>
            </div>
        </div>
    <div class="form-group">
        <asp:Label ID="Label4" runat="server" CssClass="control-label col-md-2" Text="Tài khoản: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtTaiKhoan" runat="server" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTaiKhoan" ErrorMessage="Vui lòng nhập tài khoản !">(*)</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
        <asp:Label ID="Label5" runat="server" CssClass="control-label col-md-2" Text="Mật khẩu: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password" OnPreRender="txtMatKhau_PreRender"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtMatKhau" ErrorMessage="Vui lòng nhập mật khẩu !">(*)</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <input type="button" id="btCapNhat" value="Cập nhật" runat="server" onserverclick="btCapNhat_ServerClick"   class="btn btn-default" />
                 <a href="TaiKhoan.aspx">Quay lại</a>
            </div>
        </div>
    </div>
<div>
   
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
   
</div>
</asp:Content>

