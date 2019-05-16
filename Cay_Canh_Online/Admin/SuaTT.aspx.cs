using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class SuaTT : System.Web.UI.Page
{
    XLDL x = new XLDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Load_TinTuc();
        }
    }
    public void Load_TinTuc()
    {
        DataTable dt = x.getData("Select * from BAIDANG where MaBD=" + Request.QueryString["MaBD"].ToString());
        txtTieuDe.Text = dt.Rows[0][1].ToString();
        TextBox1.Text = dt.Rows[0][2].ToString();
        ckeNoiDung.Text = dt.Rows[0][3].ToString();
    }
    protected void btCapNhat_ServerClick1(object sender, EventArgs e)
    {
        Object[] o = new Object[] { 1, 0, 2, Request.QueryString["MaBD"].ToString(), "", "", ckeNoiDung.Text };
        x.ExecuteQuery("SP_TinTuc", o);
        Response.Redirect("~/Admin/TinTuc.aspx");
    }
}