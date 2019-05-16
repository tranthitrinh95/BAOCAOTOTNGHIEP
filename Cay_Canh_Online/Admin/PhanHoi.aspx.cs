using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_PhanHoi : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (Session["AD"] == null)
            {
                Response.Redirect("~/Admin/DangNhap.aspx");
            }
            else
            {
                htdsphanhoi();
            }
    }

    private void htdsphanhoi()
    {
        GvPhanHoi.DataSource = x.getData("select MaBL,HoTenKH,TenHK,BinhLuan,Email from PHANHOIBL p,KHACHHANG k,HOAKIENG s where p.MaKH=k.MaKH and p.MaHK=s.MaHK");
        GvPhanHoi.DataBind();
    }

    protected void GvPhanHoi_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Response.Redirect("~/Admin/TraLoi.aspx?MaBL=" + GvPhanHoi.DataKeys[e.NewSelectedIndex].Value.ToString());
    }

    protected void GvPhanHoi_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            Object[] o = new Object[] { GvPhanHoi.DataKeys[e.RowIndex].Value };
            DataTable dtb = x.GetDataTable("deletePhanHoi", o);
            Response.Write("<script>alert('Xóa Dữ Liệu Thành Công !')</script>");
            htdsphanhoi();
        }
        catch
        {
            Response.Write("<script>alert('Xóa Dữ Liệu Thất Bại !')</script>");
        }
    }
}