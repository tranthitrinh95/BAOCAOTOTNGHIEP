using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_KhachHang : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            if(Session["AD"] == null)
            {
                Response.Redirect("~/Admin/DangNhap.aspx");
            }
        else
            {
                LoadKH();
            }
    }
    public void LoadKH()
    {
        GvKhachHang.DataSource = x.getData("select * from KHACHHANG");
        GvKhachHang.DataBind();
    }

    protected void GvKhachHang_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Response.Redirect("~/Admin/ThongTinKH.aspx?MaKH=" + GvKhachHang.DataKeys[e.NewSelectedIndex].Value.ToString());
    }

    protected void GvKhachHang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvKhachHang.PageIndex = e.NewPageIndex;
        LoadKH();
    }

    protected void GvKhachHang_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow
            && e.Row.RowIndex != GvKhachHang.EditIndex)
        {
            (e.Row.Cells[8].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Bạn muốn xóa dòng này?');";
        }
    }

    protected void GvKhachHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            object[] o = new object[]{2,0,3,GvKhachHang.DataKeys[e.RowIndex].Value,"","","","","","",""};
            DataTable dt=x.GetDataTable("BH_KhachHang", o);
            int num = 0;
            if (dt.Rows.Count > 0)
            {
                num = int.Parse("0" + dt.Rows[0][0]);
                switch (num)
                {
                    case 3:
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Nhà sản xuất đã có sản phẩm!');", true);
                        break;
                    case 5:
                        Response.Write("<script>alert('Xóa Dữ Liệu Thành Công !')</script>");
                        LoadKH();
                        break;
                }
            }
            dt.Dispose();
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Xóa dữ liệu thất bại!');", true);
        }
    }
}