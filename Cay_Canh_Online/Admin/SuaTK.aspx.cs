using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_SuaTK : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            if (Session["AD"] == null)
            {
                Response.Redirect("~/Admin/DangNhap.aspx");
            }
            else
            {
                LoadTK();
            }
    }
    public void LoadTK()
    {
        DataTable dt = x.getData("select * from TAIKHOANAD where MaTK=" + Request.QueryString["MaTK"].ToString());
        TextBox1.Text = dt.Rows[0][1].ToString();
        txtTaiKhoan.Text = dt.Rows[0][3].ToString();
        txtMatKhau.Text = dt.Rows[0][2].ToString();

    }
    protected void btCapNhat_ServerClick(object sender, EventArgs e)
    {
        try
        {

            Object[] o = new Object[] { Request.QueryString["MaTK"].ToString(), txtMatKhau.Text};
            x.ExecuteQuery("update_taikhoan", o);
            Response.Redirect("~/Admin/TaiKhoan.aspx");

        }
        catch
        {
            Response.Write("<script>alert('Sửa Dữ Liệu Thất Bại!')</script>");
        }
    }

    protected void txtMatKhau_PreRender(object sender, EventArgs e)
    {
        txtMatKhau.Attributes["value"] = txtMatKhau.Text;
    }
}