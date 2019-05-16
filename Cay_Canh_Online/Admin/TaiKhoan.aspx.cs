using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_TaiKhoan : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Session["UserName"] == null || Session["AD"] == null)
            {
                Response.Redirect("~/Admin/DangNhap.aspx");
            }
            else
            {
                LoadGV();
            }
        }
    }
    public void LoadGV()
    {
        GvTaiKhoan.DataSource = x.getData("select * from TAIKHOANAD");
        GvTaiKhoan.DataBind();
    }

    protected void GvTaiKhoan_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvTaiKhoan.PageIndex = e.NewPageIndex;
        LoadGV();
    }

    protected void GvTaiKhoan_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Response.Redirect("~/Admin/SuaTK.aspx?MaTK=" + GvTaiKhoan.DataKeys[e.NewSelectedIndex].Value.ToString());
    }

    protected void GvTaiKhoan_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow
            && e.Row.RowIndex != GvTaiKhoan.EditIndex)
        {
            (e.Row.Cells[4].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Bạn muốn xóa dòng này?');";
        }
    }


    protected void GvTaiKhoan_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            object[] xoa = new object[] { GvTaiKhoan.DataKeys[e.RowIndex].Value };

            x.GetDataTable("deleteTaiKhoan", xoa);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Thông báo: Xóa dữ liệu thành công!');", true);
            Response.Redirect("~/Admin/TaiKhoan.aspx");
        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Lỗi: Xóa dữ liệu thất bại!');", true);
        }
    }

}