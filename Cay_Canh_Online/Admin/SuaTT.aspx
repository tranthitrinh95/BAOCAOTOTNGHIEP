<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="SuaTT.aspx.cs" Inherits="SuaTT" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="form-horizontal">
        <div class="form-group">
        <asp:Label ID="Label2" runat="server" CssClass="control-label col-md-2" Text="Tiêu đề: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="txtTieuDe" runat="server" Height="39px" ReadOnly="true" TextMode="MultiLine" Width="75%"></asp:TextBox>
            </div>
        </div>
          <div class="form-group">
        <asp:Label ID="Label3" runat="server" CssClass="control-label col-md-2" Text="Ngày đăng: "></asp:Label>
            <div class="col-md-10">
                <asp:TextBox ID="TextBox1" runat="server" Height="22px" TextMode="SingleLine" ReadOnly="true" ></asp:TextBox>
            </div>
        </div>
         <div class="form-group">
        <asp:Label ID="Label1" runat="server" CssClass="control-label col-md-2" Text="Nội dung: "></asp:Label>
            <div class="col-md-10">
                <CKEditor:CKEditorControl runat="server" ID="ckeNoiDung"></CKEditor:CKEditorControl>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ckeNoiDung" ErrorMessage="Vui lòng nhập nội dung !">(*)</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                 <input type="button" value="Cập nhật" id="btCapNhat" runat="server" onserverclick="btCapNhat_ServerClick1"  class="btn btn-default" />
                 <a href="TinTuc.aspx">Quay lại</a>
            </div>
        </div>
    </div>
<div>
   
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
   
</div>
</asp:Content>

