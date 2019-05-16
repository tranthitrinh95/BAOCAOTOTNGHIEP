<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="PhanHoi.aspx.cs" Inherits="Admin_PhanHoi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>DANH SÁCH PHẢN HỒI</h2>
    <asp:GridView ID="GvPhanHoi"  CssClass="table table-striped table-bordered table-hover" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="MaBL"    GridLines="None"  CellSpacing="10" CellPadding="1" HorizontalAlign="Center" Width="100%"  PageSize="5" OnSelectedIndexChanging="GvPhanHoi_SelectedIndexChanging" OnRowDeleting="GvPhanHoi_RowDeleting">
        <Columns>
            <asp:BoundField DataField="MaBL" HeaderText="Mã phản hồi" Visible="False" />
            <asp:TemplateField HeaderText="Khách hàng">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("HoTenKH") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sản phẩm">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("TenHK") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:BoundField DataField="BinhLuan" HeaderText="Nội dung phản hồi" />
            <asp:CommandField  HeaderText="Công Cụ" ShowSelectButton="True" ShowDeleteButton="True" DeleteText="Xóa" SelectText="Chọn"  >
            <ControlStyle CssClass="vach" />
            <HeaderStyle HorizontalAlign="Center" Width="50px" />
            <ItemStyle Wrap="True" />
            </asp:CommandField>
        </Columns>

    </asp:GridView>
</asp:Content>

