<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuenMK.aspx.cs" Inherits="QuenMK" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .form-group{
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
                  <h2 class="text-center"><i class="fa fa-lock"></i> Quên mật khẩu?</h2>
                  <p style="color: #000000">Bạn có thể lấy lại mật khẩu tại đây.</p>
                  <div class="panel-body">
            <div class="form-group">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i>
                   
                    </span>
                     <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
                    </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Vui lòng nhập email" style="font-style: italic; color: #FF0000"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <input name="recover-submit" id="btGui" runat="server" onserverclick="btGui_ServerClick"  class="btn btn-lg btn-primary btn-block" value="Gửi yêu cầu" type="button">
            </div>
            <input type="hidden" class="hide" name="token" id="token" value="">
                  </div>

</asp:Content>

