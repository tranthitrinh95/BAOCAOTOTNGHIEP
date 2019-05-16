<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ChiTietHD.aspx.cs" Inherits="Admin_ChiTietHD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>DANH SÁCH CHI TIẾT HÓA ĐƠN</h2>
    <a href="HoaDon.aspx">Quay lại</a>
    <asp:GridView ID="GvCTHD" CssClass="table table-striped table-bordered table-hover" AllowPaging="True" AutoGenerateColumns="False" GridLines="None"  CellSpacing="10" CellPadding="1" HorizontalAlign="Center" Width="100%"  PageSize="5" runat="server">
        <Columns>
            <asp:BoundField HeaderText="Mã hóa đơn" DataField="MaHD" />
            <asp:TemplateField HeaderText="Sản phẩm">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("TenHK") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Số lượng" DataField="SoLuong" />
            <asp:TemplateField HeaderText="Đơn giá">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("DonGia","{0:#,##0 VNĐ}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thành tiền">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("ThanhTien","{0:#,##0 VNĐ}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    
</asp:Content>

