using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sp_ChiTietSanPham : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Load_CTSP();
            Load_CMT();
        }
    }
    public void Load_CTSP()
    {
        if (Session["User"] == null || Session["Email"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirectMe", "alert('Thông báo: Vui lòng đăng nhập để mua hàng');", true);
            Repeater1.DataSource = x.getData("SELECT TOP 1 * FROM HOAKIENG where MaHK=" + Request.QueryString["MaHK"].ToString());
            Repeater1.DataBind();
        }
        else

        Repeater_CTSP.DataSource = x.getData("SELECT TOP 1 * FROM HOAKIENG where MaHK=" + Request.QueryString["MaHK"].ToString());
        Repeater_CTSP.DataBind();
    }
    protected void LinkButton_Gui_Click(object sender, EventArgs e)
    {
        if (Session["User"] == null || Session["Email"] == null)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "alert('Vui lòng đăng nhập tài khoản !');", true);
        }
        else
            if (txtNoiDung.Text == "")
            {
                Response.Write("<script>alert('vui lòng điền đầy đủ thông tin!');</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalBinhLuan();", true);
            }
            else
            {
                DataTable makh = x.getData("select MaKH from KHACHHANG where Email='" + Session["Email"].ToString() + "'");
                x.thuchienlenh("insert into PHANHOIBL values (" + makh.Rows[0][0].ToString() + "," + Request.QueryString["MaHK"] + ",N'" + txtNoiDung.Text + "')");
                Load_CMT();
                txtNoiDung.Text = "";
                txtNoiDung.Focus();
            }
    }
    public void Load_CMT()
    {
        ddlBinhLuan.DataSource = x.getData("select HoTenKH, BinhLuan from PHANHOIBL bl, KHACHHANG kh where  bl.MaKH = kh.MaKH and MaHK = " + Request.QueryString["MaHK"].ToString());
        ddlBinhLuan.DataBind();
    }
}