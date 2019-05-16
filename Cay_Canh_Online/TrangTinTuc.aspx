<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TrangTinTuc.aspx.cs" Inherits="TrangTinTuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:DataList ID="DtNoiDung" cssClass="table table-hover table-striped" runat="server">
        <ItemTemplate>
            <table class="nav-justified">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" style="color: #0000FF; font-weight: 700; font-size: large; text-align: center" Text='<%# Eval("TenBD") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                       <i> Ngày đăng: </i><asp:Label ID="Label1" runat="server" style="text-align: left" Text='<%# DataBinder.Eval(Container.DataItem, "NgayDang", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("NoiDung") %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>

