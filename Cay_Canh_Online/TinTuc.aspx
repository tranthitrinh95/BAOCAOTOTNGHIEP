<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TinTuc.aspx.cs" Inherits="Kiến_thức" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 80%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <h2>TIN TỨC</h2>
    <div class="container">
            <div class="col-md-12" data-animate="fadeInUp">

                <div id="blog-homepage" class="row" style=" overflow:scroll; width: 691px;">
                     <asp:DataList ID="DtNoiDung" cssClass="table table-hover table-striped" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                         <AlternatingItemStyle BackColor="#F7F7F7" />
                         <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                         <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                         <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        <ItemTemplate>
                   <table class="nav-justified" style="border-style: none">
                <tr>
                    <td class="auto-style1">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/TrangTinTuc.aspx?MaBD=" + Eval("MaBD") %>' Text='<%# Eval("TenBD") %>'></asp:HyperLink>
                    </td>
                    <td class="text-right">
                        <asp:Label ID="Label1" runat="server" style="text-align: left" Text='<%# DataBinder.Eval(Container.DataItem, "NgayDang", "{0:MM/dd/yyyy}") %>'></asp:Label>
                    </td>
                </tr>
            </table>
               
        </ItemTemplate>
                         <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
    </asp:DataList>
                    <!--<asp:GridView ID="GvTinTuc" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" Width="679px">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="MaBD" Visible="False" />
                            <asp:BoundField DataField="TenBD" >
                            <HeaderStyle BorderStyle="None" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NgayDang" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" />
                        </Columns>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    </asp:GridView>-->
                </div>
                
            </div>
        </div>

</asp:Content>

