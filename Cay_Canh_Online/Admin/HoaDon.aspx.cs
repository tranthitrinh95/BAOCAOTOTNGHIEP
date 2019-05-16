using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_HoaDon : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Session["AD"]==null)
            {
                Response.Redirect("~/Admin/DangNhap.aspx");
            }
            load();
        }
    }
    public void load()
    {
        GvHoaDon.DataSource = x.getData("select * from HOADON");
        GvHoaDon.DataBind();
    }

    protected void GvHoaDon_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        
            Response.Redirect("~/Admin/XemHoaDon.aspx?MaHD=" + GvHoaDon.DataKeys[e.NewSelectedIndex].Value.ToString());
      
    }

    protected void GvHoaDon_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow
            && e.Row.RowIndex != GvHoaDon.EditIndex)
        {
            (e.Row.Cells[9].Controls[0] as LinkButton).Attributes["onclick"] = "return confirm('Bạn muốn xóa dòng này?');";
        }
    }

    protected void GvHoaDon_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        try
        {
            DataTable dt = x.getData("Select DuyetHD from HOADON");
            CkDuyet.Checked = Boolean.Parse(dt.Rows[0][0].ToString());
            if (CkDuyet.Checked == true)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Hóa đơn đã được duyệt !')", true);
            }
            else
            if (CkDuyet.Checked == false)
            {
                x.thuchienlenh("delete from HOADONCT where MaHD='" + GvHoaDon.DataKeys[e.RowIndex].Value.ToString() + "'");
                x.thuchienlenh("delete from HOADON where MaHD=" + GvHoaDon.DataKeys[e.RowIndex].Value.ToString() + "and DuyetHD=0");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Xóa Thành Công !')", true);
                load();
            }

        }
        catch
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Lỗi không xác định !')", true);

        }
        
        
    }

    protected void GvHoaDon_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvHoaDon.PageIndex = e.NewPageIndex;
        load();
    }
}