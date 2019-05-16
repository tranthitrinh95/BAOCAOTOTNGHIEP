<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="XemHoaDon.aspx.cs" Inherits="Admin_XemHoaDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
         <div class="form-group">
        <asp:Label ID="Label8" runat="server" Visible="false" CssClass="control-label col-md-2" Text="Mã hóa đơn: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtMaHD" Visible="false" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
        <asp:Label ID="Label2" runat="server" CssClass="control-label col-md-2" Text="Ngày lập: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtNgay" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
        </div>
         <div class="form-group">
        <asp:Label ID="Label3" runat="server" CssClass="control-label col-md-2" Text="Người gửi: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtNguoiGui" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
        <asp:Label ID="Label4" runat="server" CssClass="control-label col-md-2" Text="Người nhận: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtNguoiNhan" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
        </div>
         <div class="form-group">
        <asp:Label ID="Label5" runat="server" CssClass="control-label col-md-2" Text="Địa chỉ nhận: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtDiaChiNhan" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
        </div>
         <div class="form-group">
        <asp:Label ID="Label6" runat="server" CssClass="control-label col-md-2" Text="Số điện thoại nhận: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtSDTNhan" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
        <asp:Label ID="Label9" runat="server" CssClass="control-label col-md-2" Text="Tổng tiền: "></asp:Label>
            <div class="col-md-10">
               <asp:Label ID="lbTong" runat="server" Text=""></asp:Label>
            </div>
        </div>
         <div class="form-group">
        <asp:Label ID="Label1" runat="server" CssClass="control-label col-md-2" Text="Trạng thái giao hàng: "></asp:Label>
            <div class="col-md-10">
               <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
            </div>
        </div>
         <div class="form-group">
        <asp:Label ID="Label7" runat="server" CssClass="control-label col-md-2" Text="Duyệt hóa đơn: "></asp:Label>
            <div class="col-md-10">
               <asp:CheckBox ID="CheckBox1" runat="server" Text="Xác nhận duyệt hóa đơn" />
            </div>
        </div>
        
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <input type="button" id="btCapNhat" onserverclick="btCapNhat_ServerClick" value="Cập nhật" runat="server" class="btn btn-default" />
                <input type="button" value="Xem chi tiết hóa đơn" runat="server" onserverclick="Unnamed_ServerClick" class="btn btn-default" />
                 <a href="HoaDon.aspx">Quay lại</a>
            </div>
        </div>
    </div>
<div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
   
</div>
</asp:Content>

